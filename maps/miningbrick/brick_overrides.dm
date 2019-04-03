
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