/*
/datum/overmap_event
	name = "map event"
	radius = 2
	count = 6
	event_icon_states = list("event")
	opacity = 1
	difficulty = EVENT_LEVEL_MODERATE
	continuous = TRUE //if it should form continous blob, or can have gaps
	weaknesses //if the BSA can destroy them and with what
*/

/datum/overmap_event/bluespace
	name = "minor bluespace distortion"
	radius = 3
	count = 9
	events = list(/datum/event/bluespace_distortion/overmap)
	event_icon_states = list("bluespace10","bluespace20","bluespace30","bluespace40","bluespace50")
	opacity = 0
	difficulty = EVENT_LEVEL_MODERATE
	continuous = TRUE //if it should form continous blob, or can have gaps
	weaknesses = BSA_EMP //if the BSA can destroy them and with what

/datum/overmap_event/bluespace/major
	name = "major bluespace distortion"
	radius = 2
	count = 6
	events = list(/datum/event/bluespace_distortion/overmap)
	event_icon_states = list("bluespace11","bluespace21","bluespace31")
	difficulty = EVENT_LEVEL_MAJOR

/datum/overmap_event/energized_cloud
	name = "energized cloud"
	radius = 2
	count = 9
	events = list(/datum/event/energized_cloud)
	event_icon_states = list("energ","energized1","energized2","energized3")
	opacity = 0
	difficulty = EVENT_LEVEL_MUNDANE
	continuous = TRUE //if it should form continous blob, or can have gaps
	weaknesses = BSA_EMP //if the BSA can destroy them and with what