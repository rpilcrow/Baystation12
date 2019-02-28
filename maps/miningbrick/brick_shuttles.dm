/obj/machinery/computer/shuttle_control/explore/brick
	name = "shuttle console"
	shuttle_tag = "FTV Quoth"

/datum/shuttle/autodock/overmap/quoth
	name = "FTV Quoth"
	shuttle_area = /area/ship/brick/shuttle/outgoing
	dock_target = "quoth_shuttle"
	current_location = "nav_hangar_quoth"
//	landmark_transition = "nav_transit_quoth"
//	warmup_time = 5
	move_time = 30
//	fuel_consumption = 2
//	logging_home_tag = "nav_hangar_guppy"
//	logging_access = access_guppy_helm
	skill_needed = SKILL_NONE
//	ceiling_type = /turf/simulated/floor/shuttle_ceiling/torch


/obj/effect/shuttle_landmark/brick/hangar
	name = "Hangar"
	landmark_tag = "nav_hangar_quoth"
	base_area = /area/ship/brick/shuttle/outgoing
	base_turf = /turf/simulated/floor/plating

/obj/effect/shuttle_landmark/brick/nearby
	name = "Nearby Main Ship"
	landmark_tag = "nav_brick_nearby"