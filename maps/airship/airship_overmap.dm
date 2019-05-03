/obj/effect/overmap/ship/airship
	name = "PAS Corvidium"
	color = "#ff6e00"
	start_x = 4
	start_y = 4
	base = 1
	vessel_mass = 2500
	max_speed = 1/(2 SECONDS)
	burn_delay = 1 SECONDS

//	initial_generic_waypoints = list("nav_brick_port_dock", "nav_brick_starboard_dock", "nav_brick_nearby")
	initial_generic_waypoints = list("nav_airship_nearby1","nav_airship_nearby2","nav_airship_dock_starboard","nav_airship_dock_port","nav_airship_dock_cargo")
//	initial_restricted_waypoints = list(
//		"Airskiff" = list("nav_airship_dock_port"),
//	)


//	initial_restricted_waypoints = list(
//		"FTV Quoth" = list("brick_dock_port"),
//	)

///obj/effect/overmap/ship/landable/quoth
//	name = "FTV Quoth"
//	shuttle = "FTV Quoth"
//	max_speed = 1/(10 SECONDS)
//	burn_delay = 2 SECONDS
//	vessel_mass = 2000
//	fore_dir = NORTH