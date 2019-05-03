//hacky atmos shield projector to cover doorways
//for now: just generates a shield at no cost
/obj/machinery/atmos_protector
	name = "Atmos Protector"
	desc = "A floor-mounted projector that uses shielding technology to prevent airflow within a small area."
	icon = 'icons/obj/pilcrow.dmi'
	icon_state = "atmos1"
//	icon = 'icons/obj/machinery/shielding.dmi'
//	icon_state = "shield_normal"
	density = 0
	power_channel = ENVIRON
	idle_power_usage = 10
	active_power_usage = 0
	use_power = 1
	layer = 0.4

/obj/machinery/atmos_protector/CanPass(var/atom/movable/mover, var/turf/target, var/height=0, var/air_group=0)
//	if(use_power)
	if(air_group)
		return 0
	else
		return ..()


/obj/machinery/atmos_protector/c_airblock(turf/other)
	return BLOCKED

//obj/effect/pilshield
