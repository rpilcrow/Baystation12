/datum/map/airship
	name = "Airship"
	full_name = "Airship"
	path = "overmap_example"

	station_name  = "PAS Corvidium"
	station_short = "Corvidium"

	dock_name     = "Homeland Skyport"
	boss_name     = "PLC Merchant Navy"
	boss_short    = "Merchant Admiral"
	company_name  = "Legit Cargo Ltd."
	company_short = "LC"
	overmap_event_areas = 11
	planet_size = list(129,129)

	default_law_type = /datum/ai_laws/corporate

	evac_controller_type = /datum/evacuation_controller/lifepods
	lobby_icon = 'maps/airship/airship_lobby.dmi'
	lobby_screens = list("marbleyarns.deviantart.com")

	allowed_spawns = list("Cryogenic Storage")
	default_spawn = "Cryogenic Storage"
	use_overmap = 1
	num_exoplanets = 1
//	away_site_budget = 3
	welcome_sound = 'sound/AI/animes.ogg' //sound/voice/bsecureday.ogg

	emergency_shuttle_leaving_dock = "Attention all hands: the escape pods have been launched, maintaining burn for %ETA%."

	emergency_shuttle_called_message = "Attention all hands: emergency evacuation procedures are now in effect. Escape pods will launch in %ETA%"
	emergency_shuttle_called_sound = sound('sound/AI/torch/abandonship.ogg', volume = 45)

	emergency_shuttle_recall_message = "Attention all hands: emergency evacuation sequence aborted. Return to normal operating conditions."

	starting_money = 5000
	department_money = 0
	salary_modifier = 0.2

/datum/map/airship/map_info(victim)
	to_chat(victim, "You're aboard the <b>[station_name],</b> you're on a fuckin' airship, dude!.")

/datum/map/airship/setup_map()
	..()
	SStrade.traders += new /datum/trader/xeno_shop
	SStrade.traders += new /datum/trader/medical
	SStrade.traders += new /datum/trader/mining