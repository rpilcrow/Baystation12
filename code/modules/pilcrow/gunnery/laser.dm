/obj/machinery/gunnery/core/laser
	name = "Laser Targeting System"
	desc = "A complex targeting system that directs the laser through its focusing arrays, and acts as a control unit."
	icon_state = "lasercore"
	schutsound = 'sound/weapons/pulse.ogg'
	guntype = "laser"
	var/decalibration = 0

/obj/machinery/gunnery/core/laser/gunneryReady()
	if(istype(gMag,/obj/machinery/gunnery/magazine/laser))
		var/obj/machinery/gunnery/magazine/laser/lMag = gMag
		if(!lMag.gCell)
			ready = 0
			return 0
	return ..()

/obj/machinery/gunnery/core/laser/gunneryAimOffset(atom/target)
	if(prob(15+decalibration))
		var/offset = decalibration/10
		decalibration += rand(1,10)
		target = locate(target.x+round(rand(-offset,offset)),target.y+round(rand(-offset,offset)),target.z)
	return target

/obj/machinery/gunnery/core/laser/examine(mob/user, distance = -1)
	..()
	switch(decalibration)
		if(0)
			to_chat(user,"The focusing arrays are well-calibrated.")
		if(1 to 10)
			to_chat(user,"The focusing arrays are slightly out of alignment.")
		if(10 to 20)
			to_chat(user,"The focusing arrays are out of alignment.")
		if(20 to 40)
			to_chat(user,"The focusing arrays are heavily out of alignment.")
		if(40 to 60)
			to_chat(user,"The focusing arrays are in desparate need of calibration.")
		if(60 to INFINITY)
			to_chat(user,"The focusing arrays are practically worthless. They will likely never hit the intended target.")
	to_chat(user,"You can recalibrate the focusing arrays using a multitool.")

/obj/machinery/gunnery/core/laser/attackby(obj/item/I, mob/user)
	if(isMultitool(I))
		if(decalibration)
			if(do_after(user, 2, src))
				to_chat(user,"You recalibrate \the [src]'s arrays.")
				var/usrskill = user.get_skill_value(SKILL_DEVICES)
				if(usrskill == SKILL_MAX)
					decalibration = 0
				else
					decalibration = rand(0,20-(usrskill*4))
		else
			to_chat(user,"It doesn't need calibrating at this time.")
		return
	..()


/obj/machinery/gunnery/magazine/laser
	name = "Laser Emitter"
	desc = "A capacitor system that draws power from a cell in order to charge and generate a laser."
	icon_state = "laserbattery"
	ammunition = "NO CELL"
	guntype = "laser"
	var/obj/item/weapon/cell/gCell
	var/drain_setting = 100
	rangemod = 1

/obj/machinery/gunnery/magazine/laser/Destroy()
	if(gCell)
		gCell.loc = loc
		gCell = null
	. = ..()

/obj/machinery/gunnery/magazine/laser/examine(mob/user, distance = -1)
	..()
	if(user)
		to_chat(user,"It is set to draw [drain_setting]kw. You can change this with a multitool.")
		if(gCell)
			to_chat(user,"<span class='notice'>It has \the [gCell] loaded, at [gCell.percent()]% charge.</span>")
		else
			to_chat(user,"<span class='notice'>It isn't loaded.</span>")

/obj/machinery/gunnery/magazine/laser/get_cell()
	return gCell

/obj/machinery/gunnery/magazine/laser/Initialize()
	..()
	gCell = new /obj/item/weapon/cell/high(src)

/obj/machinery/gunnery/magazine/laser/gunneryGetAmmo(use)
	if(use)
		if(drain_setting && gCell.checked_use(drain_setting))
			return 1
		return 0
	if(gCell)
		return "[gCell.percent()]%"
	else
		return "NO CELL"

/obj/machinery/gunnery/magazine/laser/gunneryAmmoEffect(atom/target)
	var/turf/T = target
	if(T)
		T.hotspot_expose(700, 5)
	for(var/mob/living/L in range(target,3))
		T = get_turf(L)
		if(T)
			T.hotspot_expose(700, 5)
		L.take_overall_damage(0,40+drain_setting/25)
	return 1

/obj/machinery/gunnery/magazine/laser/attackby(obj/item/I, mob/user)
	if(isMultitool(I))
		if(gCell)
			drain_setting = min(gCell.maxcharge,max(0,input(user,"Input power usage (in kilowatts, 0-[gCell.maxcharge])","Power Setting") as num|null))
		else
			to_chat(user,"There is no cell in \the [src].")
		return
	if(istype(I,/obj/item/weapon/cell))
		if(gCell)
			to_chat(user,"There's already \the [gCell] in there!")
			return
		if(user.unEquip(I, src))
			gCell = I
			gunneryGetAmmo(0)
			drain_setting = 100
			return
		return
	..()

/obj/machinery/gunnery/magazine/laser/attack_hand(mob/user as mob)
	if(gCell)
		to_chat(user,"You pull out \the [gCell].")
		ammunition = "NO CELL"
		user.put_in_hands(gCell)
		gCell = null
	..()


/obj/machinery/gunnery/magazine/laser/xray
	name = "X-Ray Emitter"
	icon_state = "laserbattery-x"
	desc = "A modified capacitor that alters the laser emitter array to deliver a concentrated blast of x-rays. Has a lower range than ordinary lasers."
	rangemod = 0

/obj/machinery/gunnery/magazine/laser/xray/gunneryAmmoEffect(atom/target)
	var/decidedrange = 1+round(2*drain_setting/500,1)
	world << decidedrange
	world << 25+drain_setting/4
	for(var/mob/living/M in range(target,decidedrange))
//		M.apply_effect(25+drain_setting/4, IRRADIATE, M.getarmor(null, "rad")) //PIL_MERGE_NOTE: getarmor is no longer a valid proc
		M.take_overall_damage(0, 10+drain_setting/20)
	return 1

/obj/machinery/gunnery/magazine/laser/emp
	name = "EMP Emitter"
	icon_state = "laserbattery-e"
	desc = "A modified capacitor that replaces the laser emitter array with one that focuses an EMP into an area. Has a vastly lower range than ordinary lasers."
	rangemod = -1

/obj/machinery/gunnery/magazine/laser/emp/gunneryAmmoEffect(atom/target)
	empulse(target, 2, 4)
	return 1



/obj/machinery/gunnery/barrel/laser
	name = "Laser Focusing Array"
	desc = "A series of complex lenses, mirrors, and circuitry that focus a laser."
	icon_state = "laserbarrel"
	guntype = "laser"
	rangemod = 1