/obj/effect/landmark/corpse/pil/pariah
	name = "Pariah"
	corpse_outfits = list(/decl/hierarchy/outfit/psipariah)
	skin_tones_per_species = list(SPECIES_HUMAN = list(3))

/decl/hierarchy/outfit/psipariah
	name = "Pariah"
	uniform = /obj/item/clothing/under/color/black
	shoes = /obj/item/clothing/shoes/black
//	gloves = /obj/item/clothing/gloves/thick
	mask = /obj/item/clothing/mask/gas/half
	head = /obj/item/clothing/head/chaplain_hood
//	l_ear = /obj/item/device/radio/headset
//	glasses = /obj/item/clothing/glasses/thermal/plain/monocle
//	suit = /obj/item/clothing/suit/chaplain_hoodie
//	r_pocket = /obj/item/weapon/bikehorn
//	r_hand = /obj/item/weapon/material/twohanded/fireaxe

//	id_slot = slot_wear_id
//	id_type = /obj/item/weapon/card/id/centcom/station
//	id_pda_assignment = "Tunnel Clown!"

/obj/item/clothing/under/rank/guard/nanotrasen/pmc
	name = "pmc uniform"
	desc = "Clothing worn by soldiers working for a PMC."

/obj/item/clothing/mask/gas/alt
	icon_state = "gas_alt"
	item_state = "gas_alt"

/obj/effect/landmark/corpse/pil/pmc
	name = "PMC Soldier"
	corpse_outfits = list(/decl/hierarchy/outfit/pmcsoldier)
	skin_tones_per_species = list(SPECIES_HUMAN = list(3))

/decl/hierarchy/outfit/pmcsoldier
	name = "PMC Soldier"
	uniform = /obj/item/clothing/under/rank/guard/nanotrasen/pmc
	shoes = /obj/item/clothing/shoes/black
	gloves = /obj/item/clothing/gloves/thick
	mask = /obj/item/clothing/mask/gas/alt
	head = /obj/item/clothing/head/helmet
	suit = /obj/item/clothing/suit/armor/pcarrier/medium

/obj/item/projectile/beam/pariah
	damage = 10
	armor_penetration = 10

/mob/living/simple_animal/hostile/psipariah
	name = "pariah"
	desc = "Whoever this person is, they're out of their mind."
	icon = 'icons/mob/pilcrow.dmi'
	icon_state = "pariah"
	icon_living = "pariah"
	icon_dead = "pariah_dead"
	speak = list("...","Hhh..","lllp.","HHh.","Hhhh..","llllp.","llp.","...")
	speak_chance = 5
	turns_per_move = 5
	response_help = "pushes"
	response_disarm = "shoves"
	response_harm = "hits"
	speed = 8
	stop_automated_movement_when_pulled = 0
	maxHealth = 100
	health = 100
	can_escape = 1

	harm_intent_damage = 7
	melee_damage_lower = 5
	melee_damage_upper = 9
	attacktext = "psionically slashed"
	attack_sound = 'sound/hallucinations/far_noise.ogg'

	unsuitable_atmos_damage = 15

	faction = "psionic"

/mob/living/simple_animal/hostile/psipariah/ranged
	icon_state = "pariah3"
	icon_living = "pariah3"
	icon_dead = "pariah_dead"
	projectilesound = 'sound/weapons/laser2.ogg'
	ranged = 1
	rapid = 1
	sa_accuracy = 75
	projectiletype = /obj/item/projectile/beam/pariah

/mob/living/simple_animal/hostile/psipariah/New()
	..()
	maxHealth = rand(30,90)
	health = maxHealth

/mob/living/simple_animal/hostile/psipariah/ranged/Life()
	. = ..()
	if(!.)
		return 0
	if(stance == HOSTILE_STANCE_ATTACK || stance == HOSTILE_STANCE_ATTACKING)
		step(src,pick(GLOB.cardinal))

/mob/living/simple_animal/hostile/psipariah/death(gibbed, deathmessage, show_dead_message)
	..(gibbed, deathmessage, show_dead_message)
	if(prob(66))
		new /obj/effect/landmark/corpse/pil/pariah (loc)
	else
		visible_message("<span class='danger'>The [src] explodes in a cloud of gore!</span>")
		playsound(src.loc, 'sound/effects/splat.ogg', 50, 1)
		new /obj/effect/gibspawner/human (loc)
	qdel(src)
	return



/mob/living/simple_animal/hostile/voxslug/limbexploder
	name = "slug"
	desc = "."
	icon_state = "voxslug"
	icon_living = "voxslug"
	item_state = "voxslug"
	icon_dead = "voxslug_dead"
	health = 15
	maxHealth = 15
	melee_damage_lower = 5
	melee_damage_upper = 10
//	holder_type = /obj/item/weapon/holder/voxslug
//	faction = SPECIES_VOX
	latch_bp = BP_L_ARM

/mob/living/simple_animal/hostile/voxslug/limbexploder/New()
	..()
	latch_bp = pick(BP_L_ARM,BP_R_ARM,BP_L_LEG,BP_R_LEG)

/mob/living/simple_animal/hostile/voxslug/limbexploder/attach(mob/living/carbon/human/H)
	. = ..()
	if(!.)
		latch_bp = pick(BP_L_ARM,BP_R_ARM,BP_L_LEG,BP_R_LEG)

/*
//todo:
//get limb
//check limb damage
//if above a certain number, explode the limb
//on explode, drop us on the floor and throw us away
//alternatively kill the limb exploder
/mob/living/simple_animal/hostile/voxslug/limbexploder/implant_effect(var/mob/living/L)
	if(istype(L))
		var/obj/item/organ/external/E = H.organs_by_name[latch_bp]

		if(prob(1))
			to_chat(L, "<span class='warning'>You feel strange as \the [src] pulses...</span>")
		var/datum/reagents/R = L.reagents
		R.add_reagent(/datum/reagent/toxin, 0.5)*/


/mob/living/simple_animal/hostile/pmc
	name = "pmc soldier"
	desc = "A hostile-looking soldier. This one's wielding a machete."
	icon = 'icons/mob/pilcrow.dmi'
	icon_state = "pmcm"
	icon_living = "pmcm"
	icon_dead = "pmc_dead"
	speak = list("Could really go for a pizza.","Ugh.","Anyone see anything?","I'm fuckin' bored.","Could go for a cigarette.","Anyone got a light?","Why are we here, again?","Damnit.","Fuck.")
	emote_hear = list("mutters into his radio","coughs","sighs","whistles","yawns")
	emote_see = list("adjusts his radio","adjusts his pants","adjusts his helmet","checks his gun","scratches his ass","stares at something")
	speak_chance = 5

	turns_per_move = 5
	response_help = "pushes"
	response_disarm = "shoves"
	response_harm = "hits"
	speed = 8
	stop_automated_movement_when_pulled = 0
	maxHealth = 100
	health = 100
	can_escape = 1

	harm_intent_damage = 7
	melee_damage_lower = 7
	melee_damage_upper = 17
	attacktext = "slashed"
	attack_sound = 'sound/weapons/rapidslice.ogg'

	unsuitable_atmos_damage = 15

	var/chatty = 1

	faction = "pmc"
	var/weapondrop = /obj/item/weapon/material/hatchet/machete


/mob/living/simple_animal/hostile/pmc/New()
	. = ..()
	if(prob(10))
		chatty = 0
		speak = list()


/mob/living/simple_animal/hostile/pmc/ranged
	melee_damage_lower = 5
	melee_damage_upper = 9
	attacktext = "strikes"
	attack_sound = 'sound/weapons/genhit2.ogg'
	projectilesound = 'sound/weapons/laser.ogg'
	ranged = 1
	rapid = 0
	sa_accuracy = 75
	projectiletype = /obj/item/projectile/beam/smalllaser
	weapondrop = /obj/item/weapon/gun/energy/laser/old

/mob/living/simple_animal/hostile/pmc/ranged/ballistic
	desc = "A hostile-looking soldier. This one's wielding a rifle."
	icon_state = "pmcr"
	icon_living = "pmcr"
	projectilesound = 'sound/weapons/gunshot/gunshot3.ogg'
	projectiletype = /obj/item/projectile/bullet/rifle
	rapid = 1
	sa_accuracy = 75
	weapondrop = /obj/item/weapon/gun/projectile/automatic/assault_rifle

/mob/living/simple_animal/hostile/pmc/ranged/laser
	desc = "A hostile-looking soldier. This one's wielding a laser."
	projectilesound = 'sound/weapons/laser.ogg'
	icon_state = "pmcl"
	icon_living = "pmcl"
	rapid = 1
	projectiletype = /obj/item/projectile/beam/pariah
	weapondrop = /obj/item/weapon/gun/energy/laser/old

/mob/living/simple_animal/hostile/pmc/ranged/laser/New()
	. = ..()
	if(prob(25))
		weapondrop = /obj/item/weapon/gun/energy/laser

/mob/living/simple_animal/hostile/pmc/FindTarget()
	. = ..()
	if(.)
		if(!ranged)
			custom_emote(1,"focuses on [.]")
			if(chatty && prob(75))
				say(pick("Hostile spotted!","We've got hostiles!","Incoming!","Buckle up, hostiles!","Found one!","You, halt!","Get down, or I'll put you down!","Unknown contact!","Contact!"))
		else
			if(prob(15))
				custom_emote(1,"aims his weapon at [.]")
			if(chatty && prob(25))
				say(pick("Drop!","Get down, or I'll put you down!","You're going down!","Firing!","Supressing fire!","Take 'em down!","Clear!","Drop it!","Incoming!"))
		speak_chance = 0

/mob/living/simple_animal/hostile/pmc/LostTarget()
	. = ..()
	speak_chance = 5
	if(chatty && prob(75))
		say(pick("Lost 'em.","Looks like they got away.","I'm not chasing.","Fuck.","They're gone.","Can't see anything else.","No more targets.","Area's clear.","That's it.","Phew."))

/mob/living/simple_animal/hostile/pmc/ranged/Life()
	. = ..()
	if(!.)
		return 0
	if(stance == HOSTILE_STANCE_ATTACK || stance == HOSTILE_STANCE_ATTACKING)
		step(src,pick(GLOB.cardinal))


/mob/living/simple_animal/hostile/pmc/death(gibbed, deathmessage, show_dead_message)
	..(gibbed, deathmessage, show_dead_message)
	new /obj/effect/landmark/corpse/pil/pmc (loc)
	if(ispath(weapondrop))
		new weapondrop (loc)
	qdel(src)
	return