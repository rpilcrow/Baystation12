GLOBAL_VAR_INIT(bluespace_distortion_variants, 2)

/datum/event/bluespace_distortion
	startWhen		= 4	//When in the lifetime to call start().
	announceWhen	= 0	//When in the lifetime to call announce().
	endWhen			= 25

	severity		= 0 //Severity. Lower means less severe, higher means more severe. Does not have to be supported. Is set on New().
	affecting_z
	var/variant = 0
	var/bluedata = 0
	var/delaymult = 5

//Called first before processing.
//Allows you to setup your event, such as randomly
//setting the startWhen and or announceWhen variables.
//Only called once.
/datum/event/bluespace_distortion/setup()
	variant = pick(1,2)
	if(!variant)
		log_debug("Bluespace distortion called setup() but picked 0 for variant.")
		kill()
		return

	switch(variant)
		if(1)
			endWhen = 26 //four procs of teleswap
			delaymult = 4
		if(2)
			endWhen = 16 //~three procs of shunt
			bluedata = pick(GLOB.cardinal)
			delaymult = 5
		if(3)
			endWhen = 16

	delaymult = delaymult*(4-severity) //sev 1: delaymult*3, sev 2: delaymult*2, sev 3: delaymult

	return

//Called when the tick is equal to the startWhen variable.
//Allows you to start before announcing or vice versa.
//Only called once.
/datum/event/bluespace_distortion/start()
	for(var/atom/A in GLOB.bluespace_collectors)
		if(A.z in affecting_z)
			var/obj/machinery/power/bluespacecollector/BS = A
			BS.start_pulses()


/datum/event/bluespace_distortion/proc/teleswap()
	if(prob(25+bluedata))
		var/list/victims = list()
		var/swaps = 1
		bluedata = 0

		for(var/mob/living/L in GLOB.living_mob_list_)
			if(L.z in affecting_z)
				if(L.buckled)
					continue
				victims |= L

		if(victims.len > 1)
			swaps = min(rand(1,round(victims.len/2)),rand(1,round(victims.len/2))) //lean on the low side, so if we have 10 mobs we'll average about 1-2 swaps
			log_debug("swapcount is [swaps], victims.len = [victims.len]")
			while(swaps && victims.len)
				var/atom/movable/A = pick_n_take(victims)
				var/atom/movable/B = pick_n_take(victims)
				var/atom/cached_loc
				var/datum/effect/effect/system/spark_spread/sparks
				if(A && B)
					cached_loc = A.loc

					B.visible_message("<span class='danger'>[B] vanishes in a flash of blue light, and [A] is suddenly in their place!</span>","<span class='danger'>A flash of blue blinds you, and you're suddenly standing elsewhere!</span>","You hear a crackle.")
					A.visible_message("<span class='danger'>[A] vanishes in a flash of blue light, and [B] is suddenly in their place!</span>","<span class='danger'>A flash of blue blinds you, and you're suddenly standing elsewhere!</span>","You hear a crackle.")

					sparks = new /datum/effect/effect/system/spark_spread()
					sparks.set_up(3, 0, get_step(A,0))
					sparks.start()

					sparks = new /datum/effect/effect/system/spark_spread()
					sparks.set_up(3, 0, get_step(B,0))
					sparks.start()

					playsound(get_step(A,0),'sound/effects/phasein.ogg',70,0)
					playsound(get_step(B,0),'sound/effects/phasein.ogg',70,0)

					A.forceMove(B.loc)
					B.forceMove(cached_loc)
				else
					log_debug("teleswap() tick [activeFor] with bluedata [bluedata] somehow did not have A && B. A ([A]), B ([B]), victims.len = [victims.len]")
					break
				swaps--
		else
			bluedata = 0
	else
		bluedata += 25 //over three procs: 25 50 75 for 9.375% chance of not firing.
		for(var/mob/living/L in GLOB.living_mob_list_)
			if(L.z in affecting_z)
				if(L.buckled)
					continue
				if(prob(75))
					to_chat(L,"<span class='warning'>The air crackles around you!</span>")
					var/datum/effect/effect/system/spark_spread/sparks = new /datum/effect/effect/system/spark_spread()
					sparks.set_up(3, 0, L.loc)
					sparks.start()

/datum/event/bluespace_distortion/proc/mass_shunt()
//	var/list/victims = list() //this is gonna be a big one
	var/shuntdata = rand(3,7)
	var/atom/target
	var/inversesev = 4-severity

	for(var/area/A) //throw objects first so we can pelt everyone with them
		if(!is_station_area(A))
			//world.log << "area: [A] not station"
			continue
		//world.log << "area: [A] is station"
		for(var/obj/O in A.contents)
			if(O.anchored || prob(25*inversesev))
				continue
			target = get_edge_target_turf(A,bluedata)
			O.throw_at(target, 4, shuntdata)

	for(var/mob/living/L in GLOB.living_mob_list_)
		if(L.z in affecting_z)
			if(L.buckled)
				continue
			if(!istype(L.loc,/turf))
				continue
			to_chat(L,"<span class='warning'>You're flung across \the [L.loc] with great force!</span>")
			L.playsound_local(L, 'sound/effects/EMPulse.ogg', 75, 1)
			target = get_edge_target_turf(L,bluedata)
			if(prob(33*inversesev))
				L.Weaken(1)
			else
				L.Stun(1)
			L.throw_at(target, 3, shuntdata)

	bluedata = turn(bluedata,pick(45,-45))


/datum/event/bluespace_distortion/proc/energize_collectors()
	for(var/atom/A in GLOB.bluespace_collectors)
		if(A.z in affecting_z)
			var/obj/machinery/power/bluespacecollector/BS = A
			BS.get_pulsed(severity,variant)
	return 1

/datum/event/bluespace_distortion/announce()
	command_announcement.Announce("ANOMALOUS SPACIAL ACTIVITY WARNING: The [location_name()] has entered a bluespace distortion field of wavelength #[rand(100,999)]. All crewmembers must cease all EVA activities and brace themselves.", "[location_name()] Sensor Array", zlevels = affecting_z)
	return

/datum/event/bluespace_distortion/tick()
	switch(variant)
		if(1)
			if(!(activeFor % delaymult)) //every 4 seconds, check for a teleswap
				teleswap()
		if(2)
			if(!(activeFor % delaymult)) //every 5s
				mass_shunt()
	energize_collectors()
	return

//Called on or after the tick is equal or more than endWhen
//You can include code related to the event ending.
//Do not place spawn() in here, instead use tick() to check for
//the activeFor variable.
//For example: if(activeFor == myOwnVariable + 30) doStuff()
//Only called once.
/datum/event/bluespace_distortion/end()
	command_announcement.Announce("The [location_name()] has cleared the bluespace distortion.", "[location_name()] Sensor Array", zlevels = affecting_z)
	for(var/atom/A in GLOB.bluespace_collectors)
		if(A.z in affecting_z)
			var/obj/machinery/power/bluespacecollector/BS = A
			BS.end_pulses()



/datum/event/bluespace_distortion/overmap
	var/blueprob = 33

/datum/event/bluespace_distortion/overmap/setup()
	..()
	blueprob = blueprob*(4-severity)

/datum/event/bluespace_distortion/overmap/mass_shunt()
	if(prob(blueprob))
		..()

/datum/event/bluespace_distortion/overmap/teleswap()
	if(prob(blueprob))
		..()






/datum/event/energized_cloud
	startWhen		= 1	//When in the lifetime to call start().
	announceWhen	= 0	//When in the lifetime to call announce().
	endWhen			= 120

	severity		= 0 //Severity. Lower means less severe, higher means more severe. Does not have to be supported. Is set on New().
	affecting_z

/datum/event/energized_cloud/announce()
	command_announcement.Announce("SPACIAL ACTIVITY NOTICE: The [location_name()] has entered an energized bluespace cloud. Collector adjustments recommended.", "[location_name()] Sensor Array", zlevels = affecting_z)
	return

/datum/event/energized_cloud/start()
	for(var/atom/A in GLOB.bluespace_collectors)
		if(A.z in affecting_z)
			var/obj/machinery/power/bluespacecollector/BS = A
			BS.start_pulses()

/datum/event/energized_cloud/tick()
	for(var/atom/A in GLOB.bluespace_collectors)
		if(A.z in affecting_z)
			var/obj/machinery/power/bluespacecollector/BS = A
			BS.get_pulsed(severity,404)


/datum/event/energized_cloud/end()
	command_announcement.Announce("The [location_name()] has cleared the energized cloud.", "[location_name()] Sensor Array", zlevels = affecting_z)
	for(var/atom/A in GLOB.bluespace_collectors)
		if(A.z in affecting_z)
			var/obj/machinery/power/bluespacecollector/BS = A
			BS.end_pulses()