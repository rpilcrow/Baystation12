/area/ship/brick
	name = "\improper Generic Ship"
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambigen12.ogg')


/area/ship/brick/upper
	name = "\improper Upper"
	icon_state = "red2"

/area/ship/brick/upper/hall
	name = "\improper Upper Hallways"
	icon_state = "red2"

/area/ship/brick/upper/hall/right
	name = "\improper Upper Starboard Hallways"
	icon_state = "hallC1"

/area/ship/brick/upper/hall/left
	name = "\improper Upper Port Hallways"
	icon_state = "hallC2"

/area/ship/brick/upper/cargo
	name = "\improper Upper Cargo"
	icon_state = "quartoffice"
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/ship/brick/upper/bridge
	name = "\improper Bridge"
	icon_state = "bridge"
	req_access = list(access_heads)

/area/ship/brick/upper/bridge/quarters
	name = "\improper Captain's Quarters"
	icon_state = "captain"
	req_access = list(access_captain)

/area/ship/brick/upper/bridge/comms
	name = "\improper Comms Center"
	icon_state = "centcom"

/area/ship/brick/upper/dorms
	name = "\improper Dormitories"
	icon_state = "crew_quarters"

/area/ship/brick/upper/kitchen
	name = "\improper Mess Hall"
	icon_state = "kitchen"

/area/ship/brick/upper/engi
	name = "\improper Engineering"
	icon_state = "engine"
	area_flags = AREA_FLAG_RAD_SHIELDED
	req_access = list(access_engine)

/area/ship/brick/upper/engi/atmos
	name = "\improper Atmospherics"
	icon_state = "atmos"

/area/ship/brick/upper/science
	name = "\improper Research"
	icon_state = "research"


/area/ship/brick/lower
	name = "\improper Lower"
	icon_state = "red2"

/area/ship/brick/lower/hall
	name = "\improper Lower Hallways"
	icon_state = "hallC3"


/area/ship/brick/lower/cargo
	name = "\improper Lower Cargo"
	icon_state = "quartstorage"
	area_flags = AREA_FLAG_RAD_SHIELDED



/area/ship/brick/lower/medical
	name = "Medbay"
	icon_state = "medbay"

/area/ship/brick/lower/security
	name = "\improper Brig"
	icon_state = "brig"
	req_access = list(access_security)

/area/ship/brick/lower/mining
	name = "Minerals Processing"
	icon_state = "mining"

/area/ship/brick/lower/unused
	name = "\improper Unused Compartment"
	icon_state = "green"

/area/ship/brick/lower/unused/one
	name = "\improper Unused Compartment A"
	icon_state = "conference"

/area/ship/brick/lower/unused/two
	name = "\improper Unused Compartment B"
	icon_state = "chem"

/area/ship/brick/thrusters
	icon_state = "engine"
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambieng1.ogg')
	req_access = list(access_engine)

/area/ship/brick/thrusters/upperleft
	name = "\improper Upper Port Thruster"

/area/ship/brick/thrusters/upperright
	name = "\improper Upper Starboard Thruster"

/area/ship/brick/thrusters/lowerleft
	name = "\improper Lower Port Thruster"

/area/ship/brick/thrusters/lowerright
	name = "\improper Lower Starboard Thruster"

/area/ship/brick/lower/hangar
	name = "\improper Docking Hangar"
	icon_state = "hangar"

/area/ship/brick/maintenance
	name = "\improper Maintenance"
	icon_state = "maintcentral"
	turf_initializer = /decl/turf_initializer/maintenance
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambimo1.ogg','sound/ambience/ambimo2.ogg')
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/ship/brick/maintenance/upperleft
	name = "\improper Upper Maintenance"
	icon_state = "pmaint"

/area/ship/brick/maintenance/lowerleft
	name = "\improper Lower Port Maintenance"
	icon_state = "pmaint"

/area/ship/brick/maintenance/lowerright
	name = "\improper Lower Starboard Maintenance"
	icon_state = "smaint"


/area/ship/scrap/shuttle/outgoing
	name = "\improper Exploration Shuttle"
	icon_state = "tcomsatcham"
	base_turf = /turf/simulated/floor/plating

/area/ship/brick/shuttle/outgoing
	name = "\improper FTV Quoth"
	icon_state = "tcomsatcham"
	base_turf = /turf/simulated/floor/plating