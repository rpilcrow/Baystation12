GLOBAL_LIST_EMPTY(bluespace_collectors)

/obj/machinery/power/bluespacecollector
	name = "bluespace collector"
	desc = "It generates power from bluespace distortions, and its function can be enhanced with phoron."
	icon = 'icons/obj/pilcrow_bsc.dmi'
	icon_state = "bsc0"
	density = 1
	var/power_output = 60000
	var/tweak = 0
	var/last_variant = 0
	var/last_power = 0
	var/stack_num = 0
	var/stack_cur = 0
	var/stack_time = 90 //# of ticks a stack will last for
	var/stack_max = 100
	var/exhaust_temp = T0C+420
	var/exhaust_type = "aliether"

/obj/machinery/power/bluespacecollector/Initialize()
	..()
	GLOB.bluespace_collectors |= src
	if(anchored)
		connect_to_network()

/obj/machinery/power/bluespacecollector/Destroy()
	GLOB.bluespace_collectors -= src
	..()

/obj/machinery/power/bluespacecollector/Process()
	..()
	if(!last_variant)
		if(find_outdoors())
			pollute()
		if(stack_cur)
			add_avail(power_output)
			last_power = power_output
			burn_fuel(1)
		else
			add_avail(power_output*0.1)
			last_power = power_output*0.1


/obj/machinery/power/bluespacecollector/proc/find_outdoors() //return 0 if indoors, 1 if outdoors
	return HasAbove(z)
/*	if(z in GLOB.using_map.station_levels)
		if(istype(loc,/turf/space))
			return 0
		var/turf/T = GetAbove(src)
		if(T)
			if(istype(T,/turf/space) || istype(T,/turf/simulated/open))
				return 0
			else
				return 1
		return 0*/

/obj/machinery/power/bluespacecollector/proc/pollute()
//	if(stack_cur)
	var/turf/simulated/T = get_step(src,0)
	if(!istype(T))
		return
	if(stack_cur)
		T.assume_gas("phoron", 5, exhaust_temp+200)
	T.assume_gas(exhaust_type, 5, exhaust_temp)

/obj/machinery/power/bluespacecollector/proc/burn_fuel(var/amt = 1)
	if(stack_cur)
		stack_cur = max(stack_cur-amt,0)
		if(!stack_cur && stack_num)
			stack_num--
			stack_cur = stack_time
		return 1
	return 0


/obj/machinery/power/bluespacecollector/proc/start_pulses(var/variant = 1)
	last_variant = variant
	icon_state = "bsc1"
	visible_message("\The [src] flashes into life!")

/obj/machinery/power/bluespacecollector/proc/end_pulses()
	last_variant = 0
	tweak = 0
	icon_state = "bsc0"
	visible_message("\The [src] flickers out.")

/obj/machinery/power/bluespacecollector/proc/get_pulsed(var/severity = 1,var/variant = 1)
	if(find_outdoors())
		pollute()
		//return 0 //TODO: make BSCs create massive heat, toxic gas, or something similar instead when indoors


	severity += tweak

	if(stack_cur)
		severity++
		burn_fuel(1)

	add_avail(power_output*severity)
	last_power = power_output*severity
	return 1

	//outputs:
	//1: 60kw
	//2: 120kw
	//3: 180kw
	//4: 240kw
	//each station should have 3-4 collectors depending on their power reqs

/obj/machinery/power/bluespacecollector/attackby(var/obj/item/I, var/mob/user)
	if(isMultitool(I))
		if(!last_variant)
			to_chat(user,"You adjust \the [src]'s calibration, to no effect.")
			return 0
		tweak = 1
		to_chat(user,"<span class='notice'>You adjust \the [src] to more efficiently harvest energy from the current bluespace distortion.</span>")
		return 1
	if(isWrench(I))
		if(anchored)
			user.visible_message("<span class='notice'>\The [user] loosens \the [src]'s bolts with \the [I].</span>", "<span class='notice'>You loosen \the [src]'s bolts with \the [I].</span>")
			disconnect_from_network()
		else
			user.visible_message("<span class='notice'>\The [user] tightens \the [src]'s bolts with \the [I].</span>", "<span class='notice'>You tighten \the [src]'s bolts with \the [I].</span>")
			connect_to_network()
		anchored = !anchored
		playsound(loc, 'sound/items/Deconstruct.ogg', 50, 1)
		return 1
	if(istype(I, /obj/item/stack/material/phoron))
		var/obj/item/stack/addstack = I
		var/amount = min((stack_max - stack_num), addstack.amount)
		if(amount < 1)
			to_chat(user, "<span class='notice'>The [src] is full!</span>")
			return 0
		to_chat(user, "<span class='notice'>You add [amount] sheet\s to the [src.name].</span>")
		stack_num += amount
		addstack.use(amount)
		stack_cur = stack_time
		return amount
	return ..()

/obj/machinery/power/bluespacecollector/examine(mob/user)
	..()
	to_chat(user, "It is rated with a base output of [power_output/1000]kW during distortions, and is generating [last_power/1000]kW.")
	if(tweak)
		to_chat(user, "<span class='notice'>Its status display reports that it is calibrated.</span>")
	else
		if(last_variant)
			to_chat(user, "Its status display reports that it can be calibrated. Use a multitool to do so.")
		else
			to_chat(user, "It is not currently calibrated. Use a multitool to adjust this during a distortion.")
	if(stack_cur)
		to_chat(user,"There is [round((stack_cur/stack_time)*100)]% of a phoron sheet being used. [stack_num ? stack_num : "no"] more [stack_num == 1 ? "sheet is" : "sheets are"] loaded.")
	else
		to_chat(user,"There are no phoron sheets loaded.")