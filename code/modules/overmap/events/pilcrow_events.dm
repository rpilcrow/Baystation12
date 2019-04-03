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
	name = "bluespace distortion"
	radius = 2
	count = 6
	events = list(/datum/event/bluespace_distortion)
	event_icon_states = list("bluespace1","bluespace2","bluespace3")
	opacity = 0
	difficulty = EVENT_LEVEL_MODERATE
	continuous = TRUE //if it should form continous blob, or can have gaps
	weaknesses = BSA_EMP //if the BSA can destroy them and with what
//	var/variant = 0// changes



