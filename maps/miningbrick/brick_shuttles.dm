/obj/machinery/computer/shuttle_control/explore/bearcat
	name = "exploration shuttle console"
	shuttle_tag = "Exploration Shuttle"

/datum/shuttle/autodock/overmap/exploration
	name = "Exploration Shuttle"
	shuttle_area = /area/ship/scrap/shuttle/outgoing
	dock_target = "bearcat_shuttle"
	current_location = "nav_bearcat_port_dock_shuttle"

/obj/effect/shuttle_landmark/docking_arm_starboard
	name = "Bearcat Starboard-side Docking Arm"
	docking_controller = "bearcat_starboard_dock"

/obj/effect/shuttle_landmark/docking_arm_starboard/pod
	landmark_tag = "nav_bearcat_starboard_dock_pod"

/obj/effect/shuttle_landmark/docking_arm_port
	name = "Hangar"
	docking_controller = "bearcat_dock_port"
	base_turf = /turf/simulated/floor/plating

/obj/effect/shuttle_landmark/docking_arm_port/shuttle
	landmark_tag = "nav_bearcat_port_dock_shuttle"

/obj/effect/shuttle_landmark/below_deck_bow
	name = "Near CSV Bearcat Bow"
	landmark_tag = "nav_bearcat_below_bow"

/obj/effect/shuttle_landmark/below_deck_starboardastern
	name = "Near CSV Bearcat Starboard Astern"
	landmark_tag = "nav_bearcat_below_starboardastern"

/*/obj/machinery/computer/shuttle_control/explore/brick
	name = "shuttle console"
	shuttle_tag = "FTV Quoth"

/datum/shuttle/autodock/overmap/quoth
	name = "FTV Quoth"
	shuttle_area = /area/ship/brick/shuttle/outgoing
	dock_target = "quoth_shuttle"
	//current_location = "nav_hangar_quoth"
	current_location = "brick_dock_port"

//	landmark_transition = "nav_transit_quoth"
//	warmup_time = 5
//	move_time = 30
//	fuel_consumption = 2
//	logging_home_tag = "nav_hangar_guppy"
//	logging_access = access_guppy_helm
	skill_needed = SKILL_NONE
//	ceiling_type = /turf/simulated/floor/shuttle_ceiling/torch


/obj/effect/shuttle_landmark/brick/hangar
	name = "Hangar"
	landmark_tag = "brick_dock_port"
	//landmark_tag = "nav_hangar_quoth"
	base_area = /area/ship/brick/shuttle/outgoing
	base_turf = /turf/simulated/floor/plating
*/

/obj/effect/shuttle_landmark/brick/nearby
	name = "Nearby Main Ship"
	landmark_tag = "nav_brick_nearby"