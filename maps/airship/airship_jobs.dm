/datum/map/airship
	allowed_jobs = list(/datum/job/captain, /datum/job/chief_engineer, /datum/job/doctor, /datum/job/hop, /datum/job/assistant, /datum/job/engineer, /datum/job/hos, /datum/job/officer, /datum/job/scientist, /datum/job/psi) ///PIL_EDIT: removed datum/job/cyborg,
	species_to_job_whitelist = list(
		/datum/species/vox = list(/datum/job/assistant, /datum/job/doctor, /datum/job/engineer, /datum/job/scientist,/datum/job/officer,/datum/job/psi)
	)

/datum/job/captain
	supervisors = "the Merchant Code and your conscience"
	outfit_type = /decl/hierarchy/outfit/job/airship/captain
	min_skill = list(SKILL_PILOT = SKILL_BASIC,
					SKILL_BUREAUCRACY = SKILL_BASIC,
					SKILL_FINANCE = SKILL_BASIC)
	max_skill = list(SKILL_PILOT = SKILL_MAX,
					SKILL_COMBAT = SKILL_MAX,
					SKILL_WEAPONS = SKILL_MAX)
	psi_latency_chance = 5

/datum/job/captain/equip(var/mob/living/carbon/human/H)
	. = ..()
	if(H.client)
		H.client.verbs += /client/proc/rename_ship
		H.client.verbs += /client/proc/rename_company

/client/proc/rename_ship()
	set name = "Rename Ship"
	set category = "Captain's Powers"

	var/sprefix = sanitize(input(src, "What is the vessel prefix? Zero to four letters ie, FTV, NSV, HWS, etc.", "Vessel Prefix", "PAS"), 4)
	if(sprefix)
		sprefix += " "
	var/ship = sanitize(input(src, "What is your ship called?", "Ship name", GLOB.using_map.station_short), MAX_NAME_LEN)
	if(!ship)
		return
	GLOB.using_map.station_short = ship
	GLOB.using_map.station_name = "[sprefix][ship]"
	var/obj/effect/overmap/ship/airship/B = locate() in world
	if(B)
		B.SetName(GLOB.using_map.station_name)
	command_announcement.Announce("Attention all hands on deck, the ship has been re-christened to [GLOB.using_map.station_name]! Thank you for your attention.", "Ship re-christened")
//	verbs -= /client/proc/rename_ship //PIL-EDIT: verb no longer removes itself; you can do this as many times as desired

/client/proc/rename_company()
	set name = "Rename Company"
	set category = "Captain's Powers"
	var/company = sanitize(input(src, "What should your enterprise be called?", "Company name", GLOB.using_map.company_name), MAX_NAME_LEN)
	if(!company)
		return
	var/company_s = sanitize(input(src, "What's the short name for it?", "Company name", GLOB.using_map.company_short), MAX_NAME_LEN)
	if(company != GLOB.using_map.company_name)
		if (company)
			GLOB.using_map.company_name = company
		if(company_s)
			GLOB.using_map.company_short = company_s
		command_announcement.Announce("Congratulations to all employees of [capitalize(GLOB.using_map.company_name)] on the new name. Their rebranding has changed the [GLOB.using_map.company_short] market value by [0.01*rand(-10,10)]%.", "Company name change approved")
//	verbs -= /client/proc/rename_company //PIL_EDIT

/datum/job/captain/get_access()
	return get_all_station_access()

/datum/job/chief_engineer
	title = "Chief Engineer"
	supervisors = "the Captain"
	department_flag = ENG
	outfit_type = /decl/hierarchy/outfit/job/airship/chief_engineer
	min_skill = list(SKILL_ATMOS = SKILL_BASIC,
					SKILL_CONSTRUCTION = SKILL_BASIC,
					SKILL_ENGINES = SKILL_BASIC,
					SKILL_ELECTRICAL = SKILL_BASIC)
	max_skill = list(SKILL_PILOT = SKILL_MAX,
					SKILL_ATMOS = SKILL_MAX,
					SKILL_CONSTRUCTION = SKILL_MAX,
					SKILL_ENGINES = SKILL_MAX,
					SKILL_ELECTRICAL = SKILL_MAX)
	psi_latency_chance = 5

/datum/job/doctor
	title = "Doc"
	supervisors = "the Captain and your idea of Hippocratic Oath"
	outfit_type = /decl/hierarchy/outfit/job/airship/doc
	alt_titles = list(
		"Surgeon")
	total_positions = 1
	spawn_positions = 1
	hud_icon = "hudmedicaldoctor"
	max_skill = list(SKILL_MEDICAL = SKILL_MAX,
					SKILL_ANATOMY = SKILL_MAX,
					SKILL_CHEMISTRY = SKILL_MAX,
					SKILL_VIROLOGY = SKILL_MAX)
	min_skill = list(SKILL_MEDICAL = SKILL_BASIC,
					SKILL_ANATOMY = SKILL_BASIC,
					SKILL_CHEMISTRY = SKILL_BASIC,
					SKILL_VIROLOGY = SKILL_BASIC)
	psi_latency_chance = 7

/datum/job/hop
	title = "First Mate"
	supervisors = "the Captain and the Merchant Code"
	outfit_type = /decl/hierarchy/outfit/job/airship/mate
	hud_icon = "hudheadofpersonnel"
	max_skill = list(SKILL_PILOT = SKILL_MAX,
					SKILL_COMBAT = SKILL_MAX,
					SKILL_WEAPONS = SKILL_MAX)
	min_skill = list(SKILL_PILOT = SKILL_BASIC,
					SKILL_BUREAUCRACY = SKILL_BASIC,
					SKILL_FINANCE = SKILL_BASIC)
	psi_latency_chance = 5

/datum/job/assistant
	title = "Deck Hand"
	supervisors = "literally everyone, you bottom feeder"
	outfit_type = /decl/hierarchy/outfit/job/airship/hand
	alt_titles = list(
		"Cook" = /decl/hierarchy/outfit/job/airship/hand/cook,
		"Cargo Hand",
		"Passenger")
	hud_icon = "hudcargotechnician"
	max_skill = list(SKILL_COOKING = SKILL_MAX,
					SKILL_COMBAT = SKILL_DEFAULT,
					SKILL_BOTANY = SKILL_MAX,
					SKILL_HAULING = SKILL_MAX)
	psi_latency_chance = 5

/datum/job/engineer
	title = "Junior Engineer"
	supervisors = "Chief Engineer"
	total_positions = 2
	spawn_positions = 2
	hud_icon = "hudengineer"
	max_skill = list(SKILL_PILOT = SKILL_MAX,
					SKILL_ATMOS = SKILL_MAX,
					SKILL_CONSTRUCTION = SKILL_MAX,
					SKILL_ENGINES = SKILL_MAX,
					SKILL_ELECTRICAL = SKILL_MAX)
	min_skill = list(SKILL_ATMOS = SKILL_BASIC,
					SKILL_CONSTRUCTION = SKILL_BASIC,
					SKILL_ENGINES = SKILL_BASIC,
					SKILL_ELECTRICAL = SKILL_BASIC)
	psi_latency_chance = 5

/datum/job/cyborg
	supervisors = "your laws and the Captain"
	outfit_type = /decl/hierarchy/outfit/job/airship/hand/engine
	total_positions = 1
	spawn_positions = 1

/datum/job/scientist
	supervisors = "the Captain and your questionable code of ethics"
	total_positions = 1
	spawn_positions = 1
	psi_latency_chance = 10
	max_skill = list(SKILL_SCIENCE = SKILL_MAX,
					SKILL_DEVICES = SKILL_MAX,
					SKILL_CHEMISTRY = SKILL_MAX)
	min_skill = list(SKILL_SCIENCE = SKILL_BASIC,
					SKILL_DEVICES = SKILL_BASIC,
					SKILL_CHEMISTRY = SKILL_BASIC)

/datum/job/hos
	title = "Lieutenant"
	hud_icon = "hudheadofsecurity"
	supervisors = "the Captain and their laws"
	outfit_type = /decl/hierarchy/outfit/job/airship/security/head

	min_skill = list(   SKILL_EVA         = SKILL_BASIC,
	                    SKILL_COMBAT      = SKILL_BASIC,
	                    SKILL_WEAPONS     = SKILL_ADEPT,
	                    SKILL_FORENSICS   = SKILL_BASIC)

	max_skill = list(SKILL_HAULING = SKILL_MAX,
					SKILL_COMBAT = SKILL_MAX,
	                SKILL_WEAPONS = SKILL_MAX,
	                SKILL_FORENSICS = SKILL_MAX)

	psi_latency_chance = 5


/datum/job/officer
	title = "Soldier"
	hud_icon = "hudsecurity"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Security Chief and the Captain"
	selection_color = "#601c1c"
	outfit_type = /decl/hierarchy/outfit/job/airship/security
	psi_latency_chance = 7
	max_skill = list(SKILL_HAULING = SKILL_MAX,
					SKILL_COMBAT = SKILL_MAX,
					SKILL_WEAPONS = SKILL_MAX,
					SKILL_FORENSICS = SKILL_MAX)
	min_skill = list(SKILL_HAULING = SKILL_BASIC,
					SKILL_COMBAT = SKILL_BASIC,
					SKILL_WEAPONS = SKILL_BASIC,
					SKILL_FORENSICS = SKILL_BASIC)


/datum/job/psi
	title = "Psion"
	department = "Science"
	department_flag = SCI
	hud_icon = "hudvirologist"
	supervisors = "the Captain and your morals"
	psi_faculties = list(PSI_COERCION = PSI_RANK_OPERANT,PSI_PSYCHOKINESIS = PSI_RANK_OPERANT,PSI_REDACTION = PSI_RANK_OPERANT,PSI_ENERGISTICS = PSI_RANK_OPERANT)
	total_positions = 1
	spawn_positions = 1
	selection_color = "#7F546F"
	economic_power = 1
	access = list(access_robotics, access_tox, access_tox_storage, access_research, access_xenobiology, access_xenoarch)
	minimal_access = list(access_tox, access_tox_storage, access_research, access_xenoarch)
	minimal_player_age = 12
	outfit_type = /decl/hierarchy/outfit/job/airship/psionic
	max_skill = list(SKILL_SCIENCE = SKILL_MAX,
					SKILL_DEVICES = SKILL_MAX)
	min_skill = list(SKILL_SCIENCE = SKILL_BASIC,
					SKILL_DEVICES = SKILL_BASIC)


/datum/job/psi/equip(var/mob/living/carbon/human/H)
	. = ..()
	if(H.client)
		H.verbs += /mob/living/carbon/human/proc/psiPowerPicker

/mob/living/carbon/human/proc/psiPowerPicker()

	set name = "Select Psionic Powers"
	set category = "Abilities"

	if(stat || world.time < last_special)
		return

	last_special = world.time + 10

	if(client)
		verbs -= /mob/living/carbon/human/proc/psiPowerPicker
		var/to_get = input("Select a Power to be set to Rank 3 to 4 (or click Cancel to have a random one at Rank 3-5) You only get to choose once.","Psionic Power") as null|anything in list(PSI_COERCION,PSI_PSYCHOKINESIS,PSI_REDACTION,PSI_ENERGISTICS)
		if(to_get)
			set_psi_rank(to_get, rand(3,4),take_larger = TRUE)
		else
			to_chat(src,"No power selected; choosing at random.")
			to_get = pick(PSI_COERCION,PSI_PSYCHOKINESIS,PSI_REDACTION,PSI_ENERGISTICS)
			set_psi_rank(to_get, rand(3,5),take_larger = TRUE)




// OUTFITS
#define AIRSHIP_OUTFIT_JOB_NAME(job_name) ("Brick - Job - " + job_name)

/decl/hierarchy/outfit/job/airship
	hierarchy_type = /decl/hierarchy/outfit/job/airship
	pda_type = /obj/item/modular_computer/pda
	pda_slot = slot_l_store
	l_ear = null
	r_ear = null

/decl/hierarchy/outfit/job/airship/captain
	name = AIRSHIP_OUTFIT_JOB_NAME("Captain")
	uniform = /obj/item/clothing/under/casual_pants/classicjeans
	shoes = /obj/item/clothing/shoes/black
	pda_type = /obj/item/modular_computer/pda/captain
	r_pocket = /obj/item/device/radio
	id_type = /obj/item/weapon/card/id/gold


/decl/hierarchy/outfit/job/airship/captain/post_equip(var/mob/living/carbon/human/H)
	..()
	var/obj/item/clothing/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/toggleable/hawaii/random/eyegore = new()
		if(uniform.can_attach_accessory(eyegore))
			uniform.attach_accessory(null, eyegore)
		else
			qdel(eyegore)

/decl/hierarchy/outfit/job/airship/chief_engineer
	name = AIRSHIP_OUTFIT_JOB_NAME("Chief Engineer")
	uniform = /obj/item/clothing/under/rank/chief_engineer
	glasses = /obj/item/clothing/glasses/welding/superior
	suit = /obj/item/clothing/suit/storage/hazardvest
	gloves = /obj/item/clothing/gloves/thick
	shoes = /obj/item/clothing/shoes/workboots
	pda_type = /obj/item/modular_computer/pda/heads/ce
	l_hand = /obj/item/weapon/wrench
	belt = /obj/item/weapon/storage/belt/utility/full
	id_type = /obj/item/weapon/card/id/engineering/head
	r_pocket = /obj/item/device/radio
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/airship/doc
	name = AIRSHIP_OUTFIT_JOB_NAME("Ship's Doc")
	uniform = /obj/item/clothing/under/det/black
	suit = /obj/item/clothing/suit/storage/toggle/labcoat
	shoes = /obj/item/clothing/shoes/laceup
	pda_type = /obj/item/modular_computer/pda/medical

/decl/hierarchy/outfit/job/airship/mate
	name = AIRSHIP_OUTFIT_JOB_NAME("First Mate")
	uniform = /obj/item/clothing/under/suit_jacket/checkered
	shoes = /obj/item/clothing/shoes/laceup
	glasses = /obj/item/clothing/glasses/sunglasses/big
	pda_type = /obj/item/modular_computer/pda/cargo
	l_hand = /obj/item/weapon/material/clipboard

/decl/hierarchy/outfit/job/airship/hand
	name = AIRSHIP_OUTFIT_JOB_NAME("Deck Hand")

/decl/hierarchy/outfit/job/airship/hand/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(list(/obj/item/clothing/under/overalls,/obj/item/clothing/under/focal,/obj/item/clothing/under/hazard,/obj/item/clothing/under/rank/cargotech,/obj/item/clothing/under/color/black,/obj/item/clothing/under/color/grey,/obj/item/clothing/under/casual_pants/track, ))

/decl/hierarchy/outfit/job/airship/hand/cook
	name = AIRSHIP_OUTFIT_JOB_NAME("Cook")
	head = /obj/item/clothing/head/chefhat
	suit = /obj/item/clothing/suit/chef/classic

/decl/hierarchy/outfit/job/airship/hand/engine
	name = AIRSHIP_OUTFIT_JOB_NAME("Junior Engineer")
	head = /obj/item/clothing/head/hardhat
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/airship/hand/engine/pre_equip(mob/living/carbon/human/H)
	..()
	if(prob(50))
		suit = /obj/item/clothing/suit/storage/hazardvest

/decl/hierarchy/outfit/job/airship/doc/scientist
	name = AIRSHIP_OUTFIT_JOB_NAME("Scientist")
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/science
	pda_type = /obj/item/modular_computer/pda/science
	l_hand = /obj/item/weapon/material/clipboard

/decl/hierarchy/outfit/job/airship/security
	name = AIRSHIP_OUTFIT_JOB_NAME("Guard")
	uniform = /obj/item/clothing/under/rank/security/navyblue
	l_pocket = /obj/item/device/flash
	r_pocket = /obj/item/weapon/handcuffs
	head = /obj/item/clothing/head/helmet
	suit = /obj/item/clothing/suit/armor/pcarrier/medium
	belt = /obj/item/weapon/gun/energy/taser
	id_type = /obj/item/weapon/card/id/security
	pda_type = /obj/item/modular_computer/pda/security
	backpack_contents = list(/obj/item/weapon/handcuffs = 1)

/decl/hierarchy/outfit/job/airship/security/head
	name = AIRSHIP_OUTFIT_JOB_NAME("Security Chief")
	uniform = /obj/item/clothing/under/rank/head_of_security/navyblue
	belt = /obj/item/weapon/gun/energy/gun

/decl/hierarchy/outfit/job/airship/psionic
	name = AIRSHIP_OUTFIT_JOB_NAME("Psion")
	uniform = /obj/item/clothing/under/wetsuit
	//head = /obj/item/clothing/head/helmet/space/psi_amp/lesser