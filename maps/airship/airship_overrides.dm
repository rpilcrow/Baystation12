world
	turf = /turf/space/air

/datum/controller/subsystem/skybox //hoo boy
//	name = "Space skybox"
//	init_order = SS_INIT_SKYBOX
//	flags = SS_NO_FIRE
//	var/BGrot
	BGcolor = COLOR_WHITE
	BGpath = 'icons/turf/skybox_air.dmi' //Path to our background. Lets us use anything we damn well please. Skyboxes need to be 736x736
	BGstate = "sky"
	use_stars = FALSE
	//star_path = 'icons/turf/skybox.dmi'
	//star_state = "stars"
//	list/skyboxes = list() //Keep track of all existing skyboxes.


/area/has_gravity()
	return 1

/area/space/has_gravity()
	return 1

has_gravity(atom/AT, turf/T)
	return 1

/area/space
	name = "\improper Sky"
	has_gravity = 1



/mob/check_solid_ground()
	if(!lastarea)
		lastarea = get_area(src)
	if(!lastarea || !lastarea.has_gravity)
		return 0

	return 1

/turf/space/air
//	plane = SPACE_PLANE
	icon = 'icons/turf/space.dmi'

	name = "sky"
	desc = "Clouds stretch for miles upon miles; a white blanket beneath which rages an endless storm. Don't fall."
	icon_state = "map"
//	dynamic_lighting = 0
//	temperature = T20C
//	thermal_conductivity = OPEN_HEAT_TRANSFER_COEFFICIENT
//	var/static/list/dust_cache
//	initial_gas = list("gas = " (MOLES_CELLSTANDARD*1))
//	initial_gas = list("hydrogen" = MOLES_CELLSTANDARD*0.25, "oxygen" = MOLES_CELLSTANDARD*0.4, "nitrogen" = MOLES_CELLSTANDARD*0.35)
	initial_gas = list("oxygen" = MOLES_O2STANDARD, "nitrogen" = MOLES_N2STANDARD) //TODO: slightly hazardous atmosphere?

	/*
	potential atmospheres:

	//livable: perfectly ordinary
	//nitrogen only: vox enjoy this
	//nitrous oxide: eh
	//phoron: no
	//carbon + nitrogen: smoky. vox also enjoy this
	//low oxygen (1-10%): allows for 'farming' oxy from the atmos, but outside is still bad for breathing

	*/

/turf/space/air/CanZPass(atom/A, direction)
	if(locate(/obj/structure/catwalk, src))
		if(z == A.z)
			if(direction == DOWN)
				return 0
		else if(direction == UP)
			return 0
	return 1

/turf/space/air/proc/skyfall_checks(var/atom/movable/mover) //this was very briefly just called 'obliterate' and contained just the part after mover.can_fall()
	if(QDELETED(mover))
		return FALSE

	var/area/area = get_area(src)
	if(!area.has_gravity())
		return FALSE
	if(mover.throwing)
		return FALSE

	if(mover.can_fall())
		if(GetBelow(src))
			mover.fall()
			visible_message("<span class='warning'>\The [mover] falls into \the [src]!</span>")
			return TRUE
		else
			if(mover.can_fall())
				spawn(0)
					if(QDELETED(mover))
						return FALSE
					//for(var/atom/A in recursive_content_check(mover, sight_check = FALSE, include_mobs = FALSE)) //stops a ton of Entered() checks, and we're obliterating mover anyhow.
					//	qdel(A)
					mover.visible_message("<span class='danger'>\The [mover] falls into \the [src] and disappears!</span>","<span class='danger'>You fall into \the [src], never to be seen again.</span>")
					log_debug("[mover] fell into \the [src] at [x], [y], [z]")
					//world.log << "[mover] fell into \the [src] at [x], [y], [z]"
					qdel(mover)
					return 2
	return FALSE



/turf/space/air/Entered(var/atom/movable/mover)
	..()
	skyfall_checks(mover)

// Called when thrown object lands on this turf.
/turf/space/air/hitby(var/atom/movable/AM, var/speed)
	. = ..()
	skyfall_checks(AM)


/turf/space/air/examine(mob/user, distance, infix, suffix)
	if(..(user, 2))
		var/depth = 1
		for(var/T = GetBelow(src); isopenspace(T); T = GetBelow(T))
			depth += 1
		to_chat(user, "It is about [depth] level\s deep.")



/turf/space/air/update_starlight()
	return

/turf/simulated/Initialize() //open up spaces above all floor/walls, so we can shine light down OR just have an open-air airship. also works automatically when building.
	..()
	if(z in GLOB.using_map.station_levels)
		var/turf/T = GetAbove(src)
		if(T)
			if(istype(T,/turf/space))
				T.ChangeTurf(/turf/simulated/open)
		else
			if(config.starlight)
				set_light(min(0.1*config.starlight, 1), 1, 3, l_color = SSskybox.BGcolor)

/*
/turf/simulated/open

/turf/simulated/open/Initialize()
	. = ..()
	update_starlight()

/turf/simulated/open/proc/update_starlight()
	if(!config.starlight)
		return
	if(HasAbove(z))
		return
	set_light(min(0.1*config.starlight, 1), 1, 3, l_color = SSskybox.BGcolor)
*/
//	var/turf/X = src
//	var/turf/T
	/*
	for(var/i = 1 to world.maxz)
		T = GetBelow(X)
//		if(istype(T,/turf/space))
//			break
		if(istype(T,/turf/simulated/open))
			X = T
			continue
		else
			world.log << "found something"
			set_light(min(0.1*config.starlight, 1), 1, 3, l_color = SSskybox.BGcolor)
			return 1
	*/
//	set_light(0)

/obj/effect/overmap_event
	icon = 'icons/obj/overmap_pilcrow.dmi'

/obj/effect/overmap
	icon = 'icons/obj/overmap_pilcrow.dmi'

/datum/overmap_event/meteor
	name = "debris field"
	events = list(/datum/event/meteor_wave/overmap)
	count = 7

/datum/overmap_event/dust
	name = "dust cloud"
	events = list(/datum/event/dust)
	count = 7



/datum/computer_file/program/merchant //wild capitalism
	required_access = null

/turf/simulated/wall //landlubbers go home
	name = "bulkhead"

/turf/simulated/floor
	name = "bare deck"

/turf/simulated/floor/tiled
	name = "deck"

/decl/flooring/tiling
	name = "deck"

/turf/simulated/wall/r_wall/hull
	color = COLOR_DARK_BROWN

/obj/machinery/door/airlock/hatch/autoname

/obj/machinery/door/airlock/hatch/autoname/Initialize()
	. = ..()
	var/area/A = get_area(src)
	SetName("hatch ([A.name])")

/obj/machinery/door/airlock/hatch/autoname/general
	stripe_color = COLOR_CIVIE_GREEN

/obj/machinery/door/airlock/hatch/autoname/maintenance
	stripe_color = COLOR_AMBER

/obj/machinery/door/airlock/hatch/autoname/command
	stripe_color = COLOR_COMMAND_BLUE

/obj/machinery/door/airlock/hatch/autoname/engineering
	stripe_color = COLOR_AMBER

/obj/machinery/door/airlock/hatch/autoname/science
	stripe_color = COLOR_PALE_PURPLE_GRAY

/obj/machinery/door/airlock/hatch/autoname/security
	stripe_color = COLOR_RED

/obj/machinery/door/airlock/hatch/autoname/medical
	stripe_color = COLOR_WHITE

/obj/machinery/door/airlock/hatch/autoname/cargo
	stripe_color = COLOR_BROWN


/obj/machinery/door/airlock/glass/autoname

/obj/machinery/door/airlock/glass/autoname/Initialize()
	. = ..()
	var/area/A = get_area(src)
	SetName("hatch ([A.name])")

/obj/machinery/door/airlock/glass/autoname/general
	stripe_color = COLOR_CIVIE_GREEN

//make nabbers work again

/datum/species/nabber
	available_cultural_info = list(
		TAG_CULTURE = list(
			CULTURE_NABBER_A
		),
		TAG_HOMEWORLD = list(
			HOME_SYSTEM_SERPENTIDS
		),
		TAG_FACTION = list(
			FACTION_XYNERGY
		),
		TAG_RELIGION =  list(
			RELIGION_OTHER
		)
	)

/decl/cultural_info/culture/nabber/a
	name = CULTURE_NABBER_A
	valid_jobs = list(/datum/job/assistant, /datum/job/doctor, /datum/job/engineer, /datum/job/scientist, /datum/job/officer)