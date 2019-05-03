/datum/species/troll
	name = "Troll (Lowblood)"
	description = "Hailing from a dead empire, these gray-skinned folk are used to a life of constant \
	backstabbing, trickery, deceit, and murder. As a result, they are resistant to injury and often \
	have sharp wits. The blistering sun of their home planet lead them to evolve nocturnally, leading \
	to a vulnerability to bright lights.<br/><br/> \
	Troll blood comes in a variety of different shades, and their irses fill in with that colour \
	as they reach maturity. The sclera of their eyes are a bright orange colour, matching their \
	yellow-orange horns. They often have very sharp teeth."

	icobase =     'icons/mob/human_races/species/troll/body.dmi'
	preview_icon= 'icons/mob/human_races/species/troll/preview.dmi'
	deform = 'icons/mob/human_races/species/troll/deformed_body.dmi'

	oxy_mod =   1.0
	toxins_mod =   0.9
	flash_mod = 1.1
	brute_mod = 1.0
	burn_mod =  1.0
	darksight_range = 3
	darksight_tint = DARKTINT_GOOD
	rarity_value = 1

	blood_volume = 700 //almost unathi-tier. trolls bleed a LOT before they actually die.

	blood_color = COLOR_BLOOD_RUST
	flesh_color = "#a3a3a3"
	taste_sensitivity = TASTE_SENSITIVE //licc

//	descriptors = list(
//		/datum/mob_descriptor/height,
//		/datum/mob_descriptor/build,
//		)

	appearance_flags = HAS_LIPS | HAS_UNDERWEAR | HAS_EYE_COLOR | HAS_HAIR_COLOR
	spawn_flags = SPECIES_CAN_JOIN | SPECIES_IS_WHITELISTED

	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch, /datum/unarmed_attack/bite/sharp)
	assisted_langs = list(LANGUAGE_NABBER)
	min_age = 17
	max_age = 100
	hidden_from_codex = TRUE
	bandages_icon = 'icons/mob/bandage.dmi'

	gluttonous = GLUT_TINY

	sexybits_location = BP_GROIN

	inherent_verbs = list(/mob/living/carbon/human/proc/tie_hair, /mob/living/carbon/human/proc/troll_choose_psionics)

	available_cultural_info = list(
		TAG_CULTURE = list(
			CULTURE_TROLL_RUST,
			CULTURE_TROLL_ORANGE,
			CULTURE_TROLL_GOLD,
			CULTURE_TROLL_OLIVE
		),
		TAG_HOMEWORLD = list(
			HOME_SYSTEM_ALTERNIA,
			HOME_SYSTEM_OTHER
		),
		TAG_FACTION = list(
			FACTION_TROLL_EMPIRE,
			FACTION_TROLL_REBEL,
			FACTION_TROLL_CIV
		)
	)

	default_cultural_info = list(
		TAG_CULTURE = CULTURE_TROLL_RUST,
		TAG_HOMEWORLD = HOME_SYSTEM_ALTERNIA,
		TAG_FACTION = FACTION_TROLL_REBEL
	)

	has_organ = list(
		BP_HEART =    /obj/item/organ/internal/heart,
		BP_STOMACH =  /obj/item/organ/internal/stomach,
		BP_LUNGS =    /obj/item/organ/internal/lungs,
		BP_LIVER =    /obj/item/organ/internal/liver,
		BP_KIDNEYS =  /obj/item/organ/internal/kidneys,
		BP_BRAIN =    /obj/item/organ/internal/brain,
		BP_EYES =     /obj/item/organ/internal/eyes
		)



/////////////////////////////////////////
//BLOOD COLOURS//////////////////////////
/////////////////////////////////////////
//JADE///////////////////////////////////

/datum/species/troll/jadeblood
	name = "Troll (Jadeblood)"
	blood_color = COLOR_BLOOD_JADE
	max_age = 444

	available_cultural_info = list(
		TAG_CULTURE = list(
			CULTURE_TROLL_JADE
		),
		TAG_HOMEWORLD = list(
			HOME_SYSTEM_ALTERNIA,
			HOME_SYSTEM_OTHER
		),
		TAG_FACTION = list(
			FACTION_TROLL_EMPIRE,
			FACTION_TROLL_REBEL,
			FACTION_TROLL_CIV
		)
	)

	default_cultural_info = list(
		TAG_CULTURE = CULTURE_TROLL_JADE,
		TAG_HOMEWORLD = HOME_SYSTEM_ALTERNIA,
		TAG_FACTION = FACTION_TROLL_CIV
	)

	oxy_mod =   1.0
	toxins_mod =   1.0
	flash_mod = 1.0
	brute_mod = 1.0
	burn_mod =  1.0
	darksight_range = 6
	rarity_value = 6

/////////////////////////////////////////
//HIGH///////////////////////////////////

/datum/species/troll/highblood
	name = "Troll (Highblood)"
	blood_color = COLOR_BLOOD_TEAL
	max_age = 888

	available_cultural_info = list(
		TAG_CULTURE = list(
			CULTURE_TROLL_TEAL,
			CULTURE_TROLL_CERULEAN,
			CULTURE_TROLL_INDIGO
		),
		TAG_HOMEWORLD = list(
			HOME_SYSTEM_ALTERNIA,
			HOME_SYSTEM_OTHER
		),
		TAG_FACTION = list(
			FACTION_TROLL_EMPIRE,
			FACTION_TROLL_REBEL,
			FACTION_TROLL_CIV
		)
	)

	default_cultural_info = list(
		TAG_CULTURE = CULTURE_TROLL_TEAL,
		TAG_HOMEWORLD = HOME_SYSTEM_ALTERNIA,
		TAG_FACTION = FACTION_TROLL_EMPIRE
	)

	oxy_mod =   1.0
	toxins_mod =   0.8
	flash_mod = 1.3
	brute_mod = 0.8
	burn_mod =  1.1
	darksight_range = 5
	blood_volume = 800 //fuckers bleed for a while
	rarity_value = 6
	strength = STR_HIGH

/////////////////////////////////////////
//SEA////////////////////////////////////

/datum/species/troll/seadweller
	name = "Troll (Seadweller)"
	blood_color = COLOR_BLOOD_VIOLET
	max_age = 2000 //they can get way older, but whatever
	oxy_mod =   1.0
	toxins_mod =   0.8
	flash_mod = 1.3
	brute_mod = 0.8
	burn_mod =  1.1
	darksight_range = 5
	water_soothe_amount = 5
	blood_volume = 900
	rarity_value = 8
	inherent_verbs = list(/mob/living/carbon/human/proc/tie_hair)
	strength = STR_VHIGH

//	icobase =     'icons/mob/human_races/species/troll/seadweller.dmi'

	available_cultural_info = list(
		TAG_CULTURE = list(
			CULTURE_TROLL_VIOLET,
			CULTURE_TROLL_FUCHSIA
		),
		TAG_HOMEWORLD = list(
			HOME_SYSTEM_ALTERNIA,
			HOME_SYSTEM_OTHER
		),
		TAG_FACTION = list(
			FACTION_TROLL_EMPIRE,
			FACTION_TROLL_REBEL,
			FACTION_TROLL_CIV
		)
	)

	default_cultural_info = list(
		TAG_CULTURE = CULTURE_TROLL_VIOLET,
		TAG_HOMEWORLD = HOME_SYSTEM_ALTERNIA,
		TAG_FACTION = FACTION_TROLL_EMPIRE
	)

	has_organ = list(
		BP_HEART =    /obj/item/organ/internal/heart,
		BP_STOMACH =  /obj/item/organ/internal/stomach,
		BP_LUNGS =    /obj/item/organ/internal/lungs/gills,
		BP_LIVER =    /obj/item/organ/internal/liver,
		BP_KIDNEYS =  /obj/item/organ/internal/kidneys,
		BP_BRAIN =    /obj/item/organ/internal/brain,
		BP_EYES =     /obj/item/organ/internal/eyes
		)






/////////////////////////////////////////
//PROCS AND ABILITIES////////////////////

/*
/datum/species/troll/handle_environment_special(var/mob/living/carbon/human/H)
	if(H.InStasis() || H.stat == DEAD || H.isSynthetic())
		return
	var/light_amount = 0
	if(isturf(H.loc))
		var/turf/T = H.loc
		light_amount = T.get_lumcount() * 10
	if(light_amount > 4)
		//var/obj/item/organ/external/itburns = H.get_organ(BP_HEAD)
		var/obj/item/organ/internal/eyes/itburns = H.get_organ(BP_EYES)
		if(itburns)
			itburns.add_pain(3)
			if(prob(5))
				to_chat(H,"<span class='warning'>The light is too bright.</span>")
*/
//thinking about making them build up pain if they're in too bright light
//probably too much overhead for something too annoying



/datum/species/troll/get_bodytype(var/mob/living/carbon/human/H)
	return SPECIES_HUMAN

//datum/species/troll/handle_pre_spawn(var/mob/living/carbon/human/H)
//	..()

//datum/species/troll/handle_post_spawn(var/mob/living/carbon/human/H)
//	..()
/*	if(H.client)
		var/decl/cultural_info/culture/troll/CASTE = SSculture.get_culture(H.client.prefs.cultural_info[TAG_CULTURE])
		if(istype(CASTE))
			if(CASTE.psipower && CASTE.psitypes.len && prob(CASTE.psichance))
				H.set_psi_rank(pick(CASTE.psitypes), rand(0,CASTE.psipower))

	if(H.cultural_info.len)
		world.log << "cultural info for [H.name] was [H.cultural_info.len]"
	else
		world.log << "no cultural info found"*/


/datum/species/troll/get_blood_colour(var/mob/living/carbon/human/H)
	var/decl/cultural_info/culture/troll/CASTE
	if(H.cultural_info.len)
		CASTE = H.cultural_info[TAG_CULTURE]
	return (istype(CASTE) ? CASTE.bloodcaste : ..())


/mob/living/carbon/human/proc/troll_choose_psionics()

	set name = "Select Psi Powers"
	set category = "Abilities"

	if(stat || world.time < last_special)
		return

	last_special = world.time + 10

	if(client)
		verbs -= /mob/living/carbon/human/proc/troll_choose_psionics
		//if(psi)
		//	to_chat(src,"You already have psychic powers!")
		//	return
		var/decl/cultural_info/culture/troll/CASTE = SSculture.get_culture(client.prefs.cultural_info[TAG_CULTURE])
		if(istype(CASTE))
			if(CASTE.psipower && CASTE.psitypes.len)
				var/to_get = input("Select a Power (or click Cancel to gain none at all); you have a [CASTE.psichance]% chance to gain it, at up to rank [CASTE.psipower]. You only get to choose once.","Psionic Power") as null|anything in CASTE.psitypes
				if(to_get && prob(CASTE.psichance))
					set_psi_rank(to_get, rand(1,CASTE.psipower),take_larger = TRUE)
				else
					to_chat(src,"Unfortunately, you didn't get any psychic powers!")
			else
				to_chat(src,"Unfortunately, you can't gain any psychic powers from your blood!")


/*
/datum/species/troll/pseudo
	name = "Azrin (Teal)"
	blood_color = BLOOD_COLOR_TEAL
	description = "WiP"

/datum/species/troll/pseudo/jade
	name = "Azrin (Jade)"
	blood_color = BLOOD_COLOR_JADE

/datum/species/troll/pseudo/fuchsia
	name = "Azrin (Fuchsia)"
	blood_color = BLOOD_COLOR_FUCHSIA
*/




/////////////////////////////////////////
//WOOKIEE////////////////////////////////



/datum/species/wookiee
	name = "Wookiee"
	description = "Averaging at nearly 7', Wookiees are one of the biggest and strongest in the galaxy, and are \
	almost unstoppable in combat thanks to their great strength and resilient hide. They are resistant to both heat \
	and cold. Due to the structure of their vocal cords, they are limited to speaking only their \
	own language, Shyriiwook, which is somewhat difficult for other species to speak. Fortunately, there is no such \
	limitation on understanding the language."

	icobase =     'icons/mob/human_races/species/wookiee/body.dmi' //ehhhh. kinda hacky sprites for now.
	preview_icon= 'icons/mob/human_races/species/wookiee/preview.dmi'
	deform =      'icons/mob/human_races/species/wookiee/body.dmi'

	natural_armour_values = list(melee = 30, bullet = 0, laser = 0, energy = 0, bomb = 30, bio = 65, rad = 30)

	//STRONG VS: BRUTE, STUNS
	//WEAK VS: OXY, BURN
	//AVG VS: TOX
	oxy_mod =       1.20
	brute_mod =     0.75
	burn_mod =      1.50 //fwoosh
	toxins_mod =    1.00
	stun_mod =      0.75
	paralysis_mod = 0.50
	weaken_mod =    0.75

	heat_discomfort_level = 340
	cold_discomfort_level = 250
	cold_level_1 = 223 //-50C
	cold_level_2 = 180
	cold_level_3 = 120
	heat_level_1 = 380
	heat_level_2 = 420

	strength = STR_VHIGH
	slowdown = 0.7

	darksight_range = 3
	darksight_tint = DARKTINT_GOOD
	rarity_value = 12

	blood_volume = 800

	blood_color = COLOR_BLOOD_RUST
	flesh_color = "#513725"

	descriptors = list(
		/datum/mob_descriptor/height = 1,
		/datum/mob_descriptor/build = 2
		)

	max_pressure_diff = 70

	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_TONE_GRAV
	spawn_flags = SPECIES_CAN_JOIN | SPECIES_NO_FBP_CONSTRUCTION | SPECIES_NO_FBP_CHARGEN

	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/claws/strong, /datum/unarmed_attack/punch, /datum/unarmed_attack/bite/strong)

	assisted_langs = list(	LANGUAGE_NABBER,
							LANGUAGE_GALCOM,
							LANGUAGE_SOL_COMMON,
							LANGUAGE_UNATHI,
							LANGUAGE_SKRELLIAN,
							LANGUAGE_ROOTLOCAL,
							LANGUAGE_LUNAR,
							LANGUAGE_GUTTER,
							LANGUAGE_CULT,
							LANGUAGE_INDEPENDENT,
							LANGUAGE_SPACER,
							LANGUAGE_ADHERENT,
							LANGUAGE_VOX,
							LANGUAGE_YEOSA,
							LANGUAGE_LEGALESE,
							LANGUAGE_TROLL) //EVERYTHING

	min_age = 17
	max_age = 300
	hidden_from_codex = FALSE
	bandages_icon = 'icons/mob/bandage.dmi'

	gluttonous = GLUT_TINY

	sexybits_location = BP_GROIN

	has_organ = list(
		BP_HEART =    /obj/item/organ/internal/heart,
		BP_STOMACH =  /obj/item/organ/internal/stomach,
		BP_LUNGS =    /obj/item/organ/internal/lungs,
		BP_LIVER =    /obj/item/organ/internal/liver,
		BP_KIDNEYS =  /obj/item/organ/internal/kidneys,
		BP_BRAIN =    /obj/item/organ/internal/brain,
		BP_EYES =     /obj/item/organ/internal/eyes
		)

	hud_type = /datum/hud_data/wookiee


	available_cultural_info = list(
		TAG_CULTURE = list(
			CULTURE_WOOKIEE
		),
		TAG_HOMEWORLD = list(
			HOME_SYSTEM_OTHER
		),
		TAG_FACTION = list(
			FACTION_SOL_CENTRAL,
			FACTION_INDIE_CONFED,
			FACTION_NANOTRASEN,
			FACTION_FREETRADE,
			FACTION_OTHER
		)
	)
	default_cultural_info = list(
		TAG_CULTURE = CULTURE_WOOKIEE,
		TAG_HOMEWORLD = HOME_SYSTEM_OTHER,
		TAG_FACTION = FACTION_OTHER
	)


/datum/species/wookiee/handle_post_spawn(var/mob/living/carbon/human/H)
	..()
	H.default_language = LANGUAGE_WOOKIEE

/datum/species/wookiee/get_hair_styles(var/mob/living/carbon/human/H)
	return list()

/datum/species/wookiee/get_bodytype(var/mob/living/carbon/human/H)
	return SPECIES_HUMAN

/datum/hud_data/wookiee
	has_pressure = 1  // Draw the pressure indicator.
	has_bodytemp = 1  // Draw the bodytemp indicator.

	//equip_slots = list() // Checked by mob_can_equip().

	// Contains information on the position and tag for all inventory slots
	// to be drawn for the mob. This is fairly delicate, try to avoid messing with it
	// unless you know exactly what it does.
	gear = list(
		"o_clothing" =   list("loc" = ui_iclothing, "name" = "Suit",         "slot" = slot_wear_suit, "state" = "suit",   "toggle" = 1),
		"mask" =         list("loc" = ui_glasses,   "name" = "Mask",         "slot" = slot_wear_mask, "state" = "mask",   "toggle" = 1),
		"r_ear" =        list("loc" = ui_oclothing, "name" = "Headset",      "slot" = slot_r_ear,     "state" = "ears",   "toggle" = 1),
		"head" =         list("loc" = ui_mask,      "name" = "Hat",          "slot" = slot_head,      "state" = "hair",   "toggle" = 1),
		"suit storage" = list("loc" = ui_sstore1,   "name" = "Suit Storage", "slot" = slot_s_store,   "state" = "suitstore"),
		"back" =         list("loc" = ui_back,      "name" = "Back",         "slot" = slot_back,      "state" = "back"),
		"id" =           list("loc" = ui_id,        "name" = "ID",           "slot" = slot_wear_id,   "state" = "id"),
		"belt" =         list("loc" = ui_belt,      "name" = "Belt",         "slot" = slot_belt,      "state" = "belt")
		)

//		"storage1" =     list("loc" = ui_storage1,  "name" = "Left Pocket",  "slot" = slot_l_store,   "state" = "pocket"),
//		"storage2" =     list("loc" = ui_storage2,  "name" = "Right Pocket", "slot" = slot_r_store,   "state" = "pocket"),




/datum/species/darkling
	name = SPECIES_DARK
	description = "<b>WIP:</b> Noctites are a race of shadowy beings with glowing white eyes and the ability to discharge electricity. <br>\
	They have excellent nightvision, resistance to damage from bright lights such flashes, and they can use their electrical charge to either \
	illuminate their eyes, or to release a burst of electricity in a short range around them, stunning nearby people.<br>\
	Since there are few ways to distinguish between Noctites, they often wear colourful, distinctive clothes to separate themselves from eachother, and some will \
	even go as far as to decorate themselves in colourful inks and paints.<br><br>\
	<b>NOTE:</b> Your shock ability has three charges."
	icobase =     'icons/mob/human_races/species/dark/body.dmi'
	preview_icon= 'icons/mob/human_races/species/dark/preview.dmi'
	deform = 	  'icons/mob/human_races/species/dark/deformed.dmi'
	organs_icon = 'icons/mob/human_races/species/dark/organs.dmi'

	//strength = STR_LOW

	brute_mod =      1.1
	burn_mod =       0.9
	oxy_mod =        1
	toxins_mod =     1
	radiation_mod =  1
	flash_mod =      0
	metabolism_mod = 1
	stun_mod =       1
	paralysis_mod =  1
	weaken_mod =     1
	siemens_coefficient = 0.25
	darksight_range = 4
	darksight_tint = DARKTINT_GOOD
	rarity_value = 5
	health_hud_intensity = 10

	slowdown = -0.25
	cold_level_1 = 233
	cold_level_2 = 180
	cold_level_3 = 100
	cold_discomfort_level = 260
	heat_discomfort_strings = list(
		"You feel uncomfortably warm.",
		"Your skin prickles in the heat."
		)
	cold_discomfort_strings = list(
		"You feel chilly.",
		"You shiver suddenly.",
		"The cold seeps beneath your skin."
		)

//	blood_volume = 600

	base_color = COLOR_BLACK
	blood_color = COLOR_BLACK
	flesh_color = "#202020"
	taste_sensitivity = TASTE_DULL

	descriptors = list(
		/datum/mob_descriptor/height = -1,
		/datum/mob_descriptor/build = -1,
		)

	appearance_flags = HAS_LIPS | HAS_UNDERWEAR
	spawn_flags = SPECIES_CAN_JOIN | SPECIES_IS_WHITELISTED | SPECIES_NO_FBP_CHARGEN

	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch, /datum/unarmed_attack/bite/sharp)
	assisted_langs = list(LANGUAGE_NABBER)
	min_age = 17
	max_age = 100
	hidden_from_codex = TRUE
	bandages_icon = 'icons/mob/bandage.dmi'

	gluttonous = GLUT_TINY

	inherent_verbs = list(/mob/living/carbon/human/proc/tie_hair)

	available_cultural_info = list(
		TAG_CULTURE = list(
			CULTURE_OTHER,
			CULTURE_HUMAN_SPACER,
			CULTURE_HUMAN_SPAFRO
		),
		TAG_HOMEWORLD = list(
			HOME_SYSTEM_OTHER
		),
		TAG_FACTION = list(
			FACTION_OTHER
		)
	)

	default_cultural_info = list(
		TAG_CULTURE = CULTURE_OTHER,
		TAG_HOMEWORLD = HOME_SYSTEM_OTHER,
		TAG_FACTION = FACTION_OTHER
	)


	has_limbs = list(
		BP_CHEST =  list("path" = /obj/item/organ/external/chest/unbreakable/darkling),
		BP_GROIN =  list("path" = /obj/item/organ/external/groin/unbreakable),
		BP_HEAD =   list("path" = /obj/item/organ/external/head/unbreakable/darkling),
		BP_L_ARM =  list("path" = /obj/item/organ/external/arm/unbreakable),
		BP_R_ARM =  list("path" = /obj/item/organ/external/arm/right/unbreakable),
		BP_L_LEG =  list("path" = /obj/item/organ/external/leg/unbreakable),
		BP_R_LEG =  list("path" = /obj/item/organ/external/leg/right/unbreakable),
		BP_L_HAND = list("path" = /obj/item/organ/external/hand/unbreakable),
		BP_R_HAND = list("path" = /obj/item/organ/external/hand/right/unbreakable),
		BP_L_FOOT = list("path" = /obj/item/organ/external/foot/unbreakable),
		BP_R_FOOT = list("path" = /obj/item/organ/external/foot/right/unbreakable)
		)

	has_organ = list(
		BP_HEART =    /obj/item/organ/internal/heart,
		BP_STOMACH =  /obj/item/organ/internal/stomach,
		BP_LUNGS =    /obj/item/organ/internal/lungs,
		BP_LIVER =    /obj/item/organ/internal/liver,
		//BP_KIDNEYS =  /obj/item/organ/internal/kidneys,
		BP_ZAPPER =   /obj/item/organ/internal/shocker,
		BP_BRAIN =    /obj/item/organ/internal/brain,
		BP_EYES =     /obj/item/organ/internal/eyes/darkling
		)

	reagent_tag = IS_DARKLING

/datum/species/darkling/get_bodytype(var/mob/living/carbon/human/H)
	return SPECIES_HUMAN