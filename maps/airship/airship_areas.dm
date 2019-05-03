/area/ship/airship
	name = "\improper Airship"
	icon = 'icons/turf/airship_areas.dmi'
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambigen12.ogg')

/area/ship/airship/lower
/area/ship/airship/upper

/area/ship/airship/cockpit
	name = "\improper Bridge"
	icon_state = "bridge"
	req_access = list(access_heads)

/area/ship/airship/captain
	name = "\improper Captain's Quarters"
	icon_state = "captain"
	req_access = list(access_captain)

/area/ship/airship/fore
	name = "\improper Fore"
	icon_state = "fore"

/area/ship/airship/stern
	name = "\improper Stern"
	icon_state = "stern"

/area/ship/airship/deckone
	name = "\improper Deck One"
	icon_state = "deck1"
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/ship/airship/decktwo
	name = "\improper Deck Two"
	icon_state = "deck2"
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/ship/airship/cargo
	name = "\improper Cargo Bay 1"
	icon_state = "cargo"
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/ship/airship/cargo/mining
	name = "\improper Mining"
	icon_state = "tools"

/area/ship/airship/cargo/two
	name = "\improper Cargo Bay 2"

/area/ship/airship/cargo/three
	name = "\improper Cargo Bay 3"

/area/ship/airship/engineering
	name = "\improper Engineering 1"
	icon_state = "engineering"
	req_access = list(access_engine)
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/ship/airship/engineering/two
	name = "\improper Engineering 2"
	icon_state = "engineering"

/area/ship/airship/engineering/atmospherics
	name = "\improper Atmospherics"
	icon_state = "atmos"

/area/ship/airship/toolstorage
	name = "\improper Tool Storage"
	icon_state = "tools"

/area/ship/airship/janitors
	name = "\improper Janitorial Closet"
	icon_state = "janitor"

/area/ship/airship/bathroom
	name = "\improper Bathroom"
	icon_state = "bathroom"

/area/ship/airship/security
	name = "\improper Security Office"
	icon_state = "security"
	req_access = list(access_security)

/area/ship/airship/sensors
	name = "\improper Sensor Tower"
	icon_state = "sensors"

/area/ship/airship/dorms
	name = "\improper Dorms"
	icon_state = "dorms"

/area/ship/airship/medbay
	name = "\improper Medbay"
	icon_state = "medbay"

/area/ship/airship/kitchen
	name = "\improper Mess Hall"
	icon_state = "dorms"

/area/ship/airship/science
	name = "\improper Science"
	icon_state = "science"

/area/ship/airship/science/comms
	name = "\improper Server Room"
	icon_state = "engineering"

/area/ship/airship/engineering/smes
	name = "\improper SMES Shed"
	icon_state = "engineering"

/area/ship/airship/shuttle/lift
	name = "\improper Cargo Lift"
	icon_state = "lift"
	base_turf = /turf/simulated/open

 /area/ship/airship/shuttle/skiff
 	name = "\improper Airskiff"
 	icon_state = "skiff"
 	base_turf = /turf/simulated/open