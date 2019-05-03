
//obj/effect/overmap/ship/landable/airskiff
//	shuttle = "Airskiff"// Name of assotiated shuttle. Must be autodock.
//	var/obj/effect/shuttle_landmark/ship/landmark       // Record our open space landmark for easy reference.
//	var/status = SHIP_STATUS_LANDED
//	icon_state = "shuttle"
//	moving_state = "shuttle_moving"




/datum/shuttle/autodock/overmap/exploration
	name = "Airskiff"
	shuttle_area =  /area/ship/airship/shuttle/skiff
	current_location = "nav_airship_dock_port"
	knockdown = 0
	range = 1
	ceiling_type = /turf/simulated/floor/shuttle_ceiling/sky

/*
	name = "Charon"
	move_time = 90
	shuttle_area = list(/area/exploration_shuttle/cockpit, /area/exploration_shuttle/atmos, /area/exploration_shuttle/power, /area/exploration_shuttle/crew, /area/exploration_shuttle/cargo, /area/exploration_shuttle/airlock)
	dock_target = "calypso_shuttle"
	current_location = "nav_hangar_calypso"
	landmark_transition = "nav_transit_calypso"

	fuel_consumption = 4
	logging_home_tag = "nav_hangar_calypso"
	logging_access = access_expedition_shuttle_helm
	ceiling_type = /turf/simulated/floor/shuttle_ceiling/torch
*/

/datum/shuttle/autodock/ferry/lift
	name = "Cargo Lift"
	shuttle_area = /area/ship/airship/shuttle/lift
	warmup_time = 3	//give those below some time to get out of the way
	waypoint_station = "nav_airship_lift_bottom"
	waypoint_offsite = "nav_airship_lift_top"
	sound_takeoff = 'sound/effects/lift_heavy_start.ogg'
	sound_landing = 'sound/effects/lift_heavy_stop.ogg'
	ceiling_type = null
	knockdown = 0



/obj/machinery/computer/shuttle_control/lift
	name = "cargo lift controls"
	shuttle_tag = "Cargo Lift"
	ui_template = "shuttle_control_console_lift.tmpl"
	icon_state = "tiny"
	icon_keyboard = "tiny_keyboard"
	icon_screen = "lift"
	density = 0

/obj/machinery/computer/shuttle_control/explore/airskiff
	name = "airskiff console"
	shuttle_tag = "Airskiff"



/obj/effect/shuttle_landmark/airship/nearby
	name = "Nearby (Port)"
	landmark_tag = "nav_airship_nearby1"

/obj/effect/shuttle_landmark/airship/nearbytwo
	name = "Nearby (Starboard)"
	landmark_tag = "nav_airship_nearby2"

/obj/effect/shuttle_landmark/port_dock
	name = "Dock (Port)"
	landmark_tag = "nav_airship_dock_port"

/obj/effect/shuttle_landmark/starboard_dock
	name = "Dock (Starboard)"
	landmark_tag = "nav_airship_dock_starboard"

/obj/effect/shuttle_landmark/loading_dock
	name = "Dock (Loading)"
	landmark_tag = "nav_airship_dock_cargo"



/obj/effect/shuttle_landmark/lift/top
	name = "Deck 3"
	landmark_tag = "nav_airship_lift_top"
	flags = SLANDMARK_FLAG_AUTOSET

/obj/effect/shuttle_landmark/lift/mid
	name = "Deck 2"
	landmark_tag = "nav_airship_lift_mid"
	flags = SLANDMARK_FLAG_AUTOSET

/obj/effect/shuttle_landmark/lift/bottom
	name = "Deck 1"
	landmark_tag = "nav_airship_lift_bottom"
	base_area = /area/ship/airship/cargo
	base_turf = /turf/simulated/floor/plating
