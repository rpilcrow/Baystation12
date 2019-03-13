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
		TAG_CULTURE = CULTURE_TROLL_RUST,
		TAG_HOMEWORLD = HOME_SYSTEM_OTHER,
		TAG_FACTION = FACTION_OTHER
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
		TAG_CULTURE = CULTURE_TROLL_JADE,
		TAG_HOMEWORLD = HOME_SYSTEM_OTHER,
		TAG_FACTION = FACTION_OTHER
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
		TAG_CULTURE = CULTURE_TROLL_TEAL,
		TAG_HOMEWORLD = HOME_SYSTEM_OTHER,
		TAG_FACTION = FACTION_OTHER
	)

	oxy_mod =   1.0
	toxins_mod =   0.8
	flash_mod = 1.3
	brute_mod = 0.8
	burn_mod =  1.1
	darksight_range = 5
	blood_volume = 800 //fuckers bleed for a while
	rarity_value = 6

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

	available_cultural_info = list(
		TAG_CULTURE = list(
			CULTURE_TROLL_VIOLET,
			CULTURE_TROLL_FUCHSIA
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
		TAG_CULTURE = CULTURE_TROLL_VIOLET,
		TAG_HOMEWORLD = HOME_SYSTEM_OTHER,
		TAG_FACTION = FACTION_OTHER
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
		if(psi)
			to_chat(src,"You already have psychic powers!")
			return
		var/decl/cultural_info/culture/troll/CASTE = SSculture.get_culture(client.prefs.cultural_info[TAG_CULTURE])
		if(istype(CASTE))
			if(CASTE.psipower && CASTE.psitypes.len)
				var/to_get = input("Select a Power (or click Cancel to have none at all); you have a [CASTE.psichance]% chance to gain it, at up to rank [CASTE.psipower]. You only get to choose once.","Psionic Power") as null|anything in CASTE.psitypes
				if(to_get && prob(CASTE.psichance))
					set_psi_rank(to_get, rand(1,CASTE.psipower))
				else
					to_chat(src,"Unfortunately, you didn't get any psychic powers!")


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

/*

/datum/species/wookiee
	name = "Wookiee"
	description = "."

	icobase =     'icons/mob/human_races/species/troll/body.dmi'
	preview_icon= 'icons/mob/human_races/species/troll/preview.dmi'
	deform = 'icons/mob/human_races/species/troll/deformed_body.dmi'

	oxy_mod =   1.2
	toxins_mod =   1.1
	flash_mod = 1.0
	brute_mod = 0.8
	burn_mod =  0.8
	darksight_range = 3
	darksight_tint = DARKTINT_GOOD
	rarity_value = 8

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

	inherent_verbs = list(/mob/living/carbon/human/proc/tie_hair)

	available_cultural_info = list(
		TAG_CULTURE = list(
			CULTURE_TROLL_RUST,
			CULTURE_TROLL_ORANGE,
			CULTURE_TROLL_GOLD,
			CULTURE_TROLL_OLIVE
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
		TAG_CULTURE = CULTURE_TROLL_RUST,
		TAG_HOMEWORLD = HOME_SYSTEM_OTHER,
		TAG_FACTION = FACTION_OTHER
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

*/


