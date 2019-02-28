#if !defined(using_map_DATUM)
	#include "brick_unit_testing.dm"

//	#include "../../code/datums/music_tracks/businessend.dm"
//	#include "../../code/datums/music_tracks/salutjohn.dm"

	#include "brick_areas.dm"
	#include "brick_jobs.dm"
	#include "brick_lobby.dm"
	#include "brick_shuttles.dm"
	#include "brick_overmap.dm"
	#include "brick_overrides.dm"
	#include "brick_loadouts.dm"
	#include "brick-1.dmm"
	#include "brick-2.dmm"

	#define using_map_DATUM /datum/map/miningbrick

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Brick

#endif


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


//wild capitalism
/datum/computer_file/program/merchant
	required_access = null