/datum/map/miningbrick
	name = "Brick"
	full_name = "Brick"
	path = "overmap_example"

	station_name  = "FTV Raven"
	station_short = "Raven"

	dock_name     = "FTS Tough Customer"
	boss_name     = "FTU Merchant Navy"
	boss_short    = "Merchant Admiral"
	company_name  = "Legit Cargo Ltd."
	company_short = "LC"
	overmap_event_areas = 11

	default_law_type = /datum/ai_laws/corporate

	evac_controller_type = /datum/evacuation_controller/lifepods
	lobby_icon = 'maps/miningbrick/brick_lobby.dmi'
	lobby_screens = list("industrial-mrrainbowwj") //PIL_EDIT: removed 'spess'

	allowed_spawns = list("Cryogenic Storage")
	default_spawn = "Cryogenic Storage"
	use_overmap = 1
	num_exoplanets = 4
	welcome_sound = 'sound/effects/cowboysting.ogg'

	emergency_shuttle_leaving_dock = "Attention all hands: the escape pods have been launched, maintaining burn for %ETA%."

	emergency_shuttle_called_message = "Attention all hands: emergency evacuation procedures are now in effect. Escape pods will launch in %ETA%"
	emergency_shuttle_called_sound = sound('sound/AI/torch/abandonship.ogg', volume = 45)

	emergency_shuttle_recall_message = "Attention all hands: emergency evacuation sequence aborted. Return to normal operating conditions."

	starting_money = 5000
	department_money = 0
	salary_modifier = 0.2

/datum/map/miningbrick/map_info(victim)
	to_chat(victim, "You're aboard the <b>[station_name],</b> an independent vessel affiliated with Free Trade Union, on a SPACE FRONTIER. No major corporation or government has laid claim on the planets in this sector, so their exploitation is entirely up to you - mine, poach and deforest all you want.")

/datum/map/miningbrick/setup_map()
	..()
	SStrade.traders += new /datum/trader/xeno_shop
	SStrade.traders += new /datum/trader/medical
	SStrade.traders += new /datum/trader/mining