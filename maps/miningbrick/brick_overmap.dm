/obj/effect/overmap/ship/brick
	name = "FTV Raven"
	color = "#00ffff"
	start_x = 4
	start_y = 4
	base = 1
	vessel_mass = 5000
	max_speed = 1/(2 SECONDS)
	burn_delay = 2 SECONDS

//	initial_generic_waypoints = list("nav_brick_port_dock", "nav_brick_starboard_dock", "nav_brick_nearby")
	initial_generic_waypoints = list("nav_brick_nearby")
	initial_restricted_waypoints = list(
		"FTV Quoth" = list("brick_dock_port"),
	)

/obj/effect/overmap/ship/landable/quoth
	name = "FTV Quoth"
	shuttle = "FTV Quoth"
	max_speed = 1/(10 SECONDS)
	burn_delay = 2 SECONDS
	vessel_mass = 2000
	fore_dir = NORTH