/obj/machinery/gunnery/core/laser
	name = "laser emitter"
	icon_state = "lasercore"
	schutsound = 'sound/weapons/pulse.ogg'

/obj/machinery/gunnery/core/laser/gunneryReady()
	if(istype(gMag,/obj/machinery/gunnery/magazine/laser) && istype(gBarrel,/obj/machinery/gunnery/barrel/laser))
		ready = 1
	else
		ready = 0
	return ready

/obj/machinery/gunnery/core/laser/gunneryFire(var/atom/target)
	. = ..()
	if(.)
		visible_message("pew pew!")



/obj/machinery/gunnery/magazine/laser
	name = "laser battery bank"
	desc = "A bank of batteries and charging cables that deliver power to a laser system."
	icon_state = "laserbattery"
	ammunition = 1

/obj/machinery/gunnery/magazine/laser/gunneryGetAmmo()
	if(ammunition > 0)
		use_power_oneoff(ammunition KILOWATTS, EQUIP)
		return 1
	return 0

/obj/machinery/gunnery/magazine/laser/gunneryAmmoEffect(var/atom/target)
	target.visible_message("uh oh")
	var/expstr = ammunition
	spawn(10)
		explosion(get_turf(loc), min(expstr-2,-1), expstr*1, expstr*2, expstr*4)
	return 1





/obj/machinery/gunnery/barrel/laser
	name = "laser focusing array"
	icon_state = "laserbarrel"
	var/calibration = 100

/obj/machinery/gunnery/barrel/laser/gunneryAimOffset(target)
	if(prob(calibration))
		calibration--
		return target
	else
		world << "calibration failed!"
		return target