

//////////////////////////////////////
//ENERGY//////////////////////////////

/obj/item/weapon/gun/energy/pilcrow
	name = "PL-R Custom Blaster"
	desc = "A custom-made dual-mode blaster utilizing a beam stunner and a weak plasma caster both drawing from the same energy cell. Can fire in bursts; if it shoots ya, it's gonna hurt."
	icon = 'icons/obj/guns/pilcrow.dmi'
	icon_state = "blaster100"
	modifystate = "blaster"
	item_state = "laser"
	max_shots = 18 //roughly equivalent dam + cap as a doublestack pistol magazine.
	projectile_type = /obj/item/projectile/beam/pilcrow
	combustion = 0
	dispersion = list(0.2)

	firemodes = list(
		list(mode_name="kill", projectile_type=/obj/item/projectile/beam/pilcrow, burst=1, burst_accuracy=list(0), dispersion=list(0.2),charge_cost = 20,modifystate="blaster"),
		list(mode_name="burst", projectile_type=/obj/item/projectile/beam/pilcrow, burst=3, burst_accuracy=list(0,-1,-1), dispersion=list(0.2, 0.3, 0.6),charge_cost = 20,modifystate="blaster"),
		list(mode_name="stun", projectile_type=/obj/item/projectile/beam/stun, burst=1, burst_accuracy=list(0), dispersion=list(0), charge_cost = 60,modifystate="blasterstun"),
		)

/obj/effect/projectile/pulse/muzzle/impact
	icon_state = "impact_pl"

/obj/item/projectile/beam/pilcrow
	name = "plasma bolt"
	icon_state = "pulse1_bl"
	damage = 30
	damage_type = BURN
	check_armour = "energy"
	distance_falloff = 3
	fire_sound = 'sound/weapons/taser2.ogg'
	muzzle_type = /obj/effect/projectile/pulse/muzzle
	tracer_type = null
	impact_type = /obj/effect/projectile/pulse/muzzle/impact


/obj/item/weapon/gun/energy/laser/lasgun
	name = "lasgun"
	desc = "A Hephaestus Industries G40E carbine modified to fire far more shots than is normal."
	projectile_type = /obj/item/projectile/beam/smalllaser
	max_shots = 50
	firemodes = list(
		list(mode_name="semi", burst=1, burst_accuracy=list(0), dispersion=list(0.2)),
		list(mode_name="burst", burst=3, burst_accuracy=list(0,-1,-1), dispersion=list(0.2, 0.3, 0.6)),
		list(mode_name="auto",burst=5, burst_accuracy=list(0,-1,-1,-2), dispersion=list(0.2, 0.3, 0.6, 0.8, 1.0))
		)


/obj/item/weapon/gun/energy/laser/old
	name = "old laser carbine"
	desc = "A Hephaestus Industries G40E carbine that's seen more than a few years of use. While its components are degraded and the blast it emits is weaker, it's still formidable."
	projectile_type = /obj/item/projectile/beam
	fire_delay = 15


//////////////////////////////////////
//BALLISTIC///////////////////////////

/obj/item/weapon/gun/projectile/pistol/ntsp
	name = "burst pistol"
	desc = "The NT10-SP is an old, NanoTrasen-produced pistol designed before the Mk58. While it has no fancy electronics, it does have a 2-round burst fire mode. Best fired with both hands in burst mode."
	icon = 'icons/obj/guns/nt10-2.dmi'
	icon_state = "nt10"
	safety_icon = "safety"
	magazine_type = /obj/item/ammo_magazine/pistol/rubber
	accuracy = 0
	fire_delay = 5
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 1)

	firemodes = list(
		list(mode_name="semi", burst=1, fire_delay=6, one_hand_penalty=0, burst_accuracy=null, dispersion=null),
		list(mode_name="burst", burst=2, fire_delay=null, one_hand_penalty=1, burst_accuracy=list(-1,-2), dispersion=list(0.0, 0.6)),
		)

/obj/item/weapon/gun/projectile/pistol/ntsp/lethal
	magazine_type = /obj/item/ammo_magazine/pistol


/obj/item/weapon/gun/projectile/revolver/auto
	name = "autorevolver"
	icon = 'icons/obj/guns/pilcrow.dmi'
	icon_state = "auto"
	caliber = CALIBER_PISTOL
	ammo_type = /obj/item/ammo_casing/pistol
	desc = "While not a necessarily new concept, the Saito Arms 'Riveter Mk44' takes automatic revolvers to the next level by allowing for an instantaneous magdump of its entire 7-round cylinder. Unfortunately it lacks an extractor, requiring manual removal of each casing."
	firemodes = list(
		list(mode_name="semi", burst=1, fire_delay=6, one_hand_penalty=0, burst_accuracy=null, dispersion=null),
		list(mode_name="three-shot burst", burst=3, fire_delay=null, one_hand_penalty=0, burst_accuracy=list(1,0,-1), dispersion=list(0.0, 0.6, 1.0)),
		list(mode_name="seven-shot burst", burst=7, fire_delay=null, one_hand_penalty=4, burst_accuracy=list(1,0,-1,-1,-2,-2,-3), dispersion=list(0.0, 0.4, 0.6, 0.8, 1.0)),
		)
	max_shells = 7
	accuracy = 1
	bulk = 1

/obj/item/ammo_magazine/speedloader/autorevolver
	name = "10mm speedloader"
	desc = "A seven-round speed loader for the Riveter Mk44."
	icon = 'icons/obj/pilcrow.dmi'
	icon_state = "slmk44"
	caliber = CALIBER_PISTOL
	ammo_type = /obj/item/ammo_casing/pistol
	matter = list(MATERIAL_STEEL = 1260)
	max_ammo = 7
	multiple_sprites = 1

/obj/item/weapon/gun/projectile/revolver/mega
	name = "antimateriel revolver"
	icon = 'icons/obj/guns/pilcrow.dmi'
	icon_state = "thic"
	caliber = CALIBER_ANTIMATERIAL
	ammo_type = /obj/item/ammo_casing/shell //obj/item/ammo_casing/pistol
	desc = "The Saito Arms Wristbreaker 59 is a .15mmR antimateriel revolver, designed to deliver maximum force to a single target no matter the obstacles in your way. Brace with both hands - you'll need the grip."
	one_hand_penalty = 6
	accuracy = 2
	bulk = 3
	max_shells = 5

/*
/obj/item/projectile/energy/pilcrow
	name = "plasma bolt"
	icon_state = "pulse1_bl"
	damage = 30
	damage_type = BURN
	check_armour = "energy"
	distance_falloff = 3
	fire_sound = 'sound/weapons/taser2.ogg'
	muzzle_type = /obj/effect/projectile/pulse/muzzle
	tracer_type = null
	impact_type = /obj/effect/projectile/pulse/muzzle/impact
*/








//////////////////////////////////////
//MELEE///////////////////////////////


/obj/item/weapon/material/sword/replica/officersword/pilcustom
	name = "officer's sword"
	desc = "A polished officer's sword, pilfered from somebody with rank."


/obj/item/weapon/material/sword/longsword
	name = "longsword"
	desc = "A sturdy, classic weapon."
	icon_state = "longsword"
	item_state = "longsword"
	slot_flags = SLOT_BELT|SLOT_BACK
	w_class = ITEM_SIZE_LARGE
	force_divisor = 0.3 // 18 when wielded with hardnes 60 (steel)
	thrown_force_divisor = 0.5 // 10 when thrown with weight 20 (steel)
	sharp = 1
	edge = 1
	attack_verb = list("slashed", "stabbed", "sliced", "cut")
	hitsound = 'sound/weapons/rapidslice.ogg'
	base_parry_chance = 40
	melee_accuracy_bonus = 10

/obj/item/weapon/material/sword/longsword/silver
	desc = "A sturdy, classic weapon, this one made from silver; perfect for slaying mythical shapeshifters."
	default_material = MATERIAL_SILVER

/obj/item/weapon/material/sword/longsword/titanium
	desc = "A sturdy, classic weapon, this one made from titanium."
	default_material = MATERIAL_TITANIUM



/obj/item/weapon/cane/concealed/sword
	desc = "A cane used by a true gentleman."
	icon_state = "swordcane-sheath1"
	concealed_type = /obj/item/weapon/material/sword/canesword
	w_class = ITEM_SIZE_NORMAL

/obj/item/weapon/cane/concealed/sword/on_update_icon()
	if(concealed_blade)
		icon_state = initial(icon_state)
		item_state = initial(item_state)
	else
		icon_state = "swordcane-sheath0"
		item_state = "foldcane"


/obj/item/weapon/material/sword/canesword
	name = "swordcane"
	icon_state = "swordcane-blade"
	item_state = "longsword"
	desc = "A slender, sharp blade withdrawn from its concealed sheath."
	force_divisor = 0.3 // 18 when wielded with hardnes 60 (steel)
	thrown_force_divisor = 0.75 // 15 when thrown with weight 20 (steel)
	sharp = 1
	edge = 1
	attack_verb = list("slashed", "stabbed", "sliced", "cut")
	hitsound = 'sound/weapons/rapidslice.ogg'
	base_parry_chance = 50
	melee_accuracy_bonus = 10
	applies_material_colour = 0

/obj/item/weapon/material/hatchet/machete/pilcrow
	name = "billhook"
	desc = "A long, sturdy billed blade designed to rip and tear. The words '<i>live like a windrammer as you fuck</i>' are inscribed on the handle."
	item_state = "machete_pil"
//	force_divisor = 0.2
	thrown_force_divisor = 0.50
	attack_verb = list("slashed", "cut")

/obj/item/weapon/material/hatchet/machete/pilcrow/Initialize()
	. = ..()
	icon_state = "machete_pil"


/obj/item/weapon/material/flicksword
	name = "flicksword"
	desc = "A defensive tool when folded in, and a lethal weapon when flicked out. Does extra damage when striking just after flicking it out."
	icon = 'icons/obj/pilcrow.dmi'
	icon_state = "flicksword0"
	item_state = "machete"
	hitsound = 'sound/weapons/rapidslice.ogg'
	sharp = 0
	edge = 0
	force_divisor = 0.2
	thrown_force_divisor = 0.5
	var/fstate = 0
	var/nextflick = 0
	base_parry_chance = 80

/obj/item/weapon/material/flicksword/attack_self(mob/user)
//	. = ..()
//	if(.)
	if(fstate)
		playsound(user, 'sound/machines/click.ogg', 25, 1, -1)
		to_chat(user,"\The [src] folds in.")
		sharp = 0
		edge = 0
		base_parry_chance = 80
	else
		if(nextflick > world.time)
			return
		else
			playsound(user, 'sound/weapons/handcuffs.ogg', 75, 1, -1)
			to_chat(user,"You flick out \the [src].")
			nextflick = world.time + 1 SECOND
			sharp = 1
			edge = 1
			base_parry_chance = 25
	fstate = !fstate
	update_icon()

/obj/item/weapon/material/flicksword/on_update_icon()
	..()
	icon_state = "flicksword[fstate]"

/obj/item/weapon/material/flicksword/apply_hit_effect(mob/living/target, mob/living/user, var/hit_zone)

	var/power = force
	var/sndpower = 40
	if(fstate)
		power += 3
		sndpower += 10
	if(nextflick > world.time)
		power *= 2
		sndpower += 25
		nextflick = world.time
	if(MUTATION_HULK in user.mutations)
		power *= 2

	if(hitsound)
		playsound(loc, hitsound, sndpower, 1, -1)

	return target.hit_with_weapon(src, user, power, hit_zone)



/obj/item/blurryizer
	name = "blurryizer"
	desc = "blurs itself"
	icon = 'icons/obj/pilcrow.dmi'
	icon_state = "bait0"
	force = 0
	throwforce = 0
	w_class = ITEM_SIZE_SMALL
	item_state = "flare"
	var/on = 0
	var/ov_alph = 75

/obj/item/blurryizer/attack_self(mob/user)
	on = !on
	update_icon()

/obj/item/blurryizer/on_update_icon()
	overlays.Cut()
	if(on)
		var/icon/I = new(icon,icon_state)
		I.Scale(34,34)
		var/image/nim = image(I)
		nim.pixel_x = -1
		nim.pixel_y = -1
		nim.alpha = ov_alph
		overlays += nim
/*		for(var/num = 1 to 4)
			var/image/nim = image(src)
			nim.alpha = ov_alph
			switch(num)
				if(1)
					nim.pixel_x = 1
					nim.pixel_y = 1
				if(2)
					nim.pixel_x = 1
					nim.pixel_y = -1
				if(3)
					nim.pixel_x = -1
					nim.pixel_y = 1
				if(4)
					nim.pixel_x = -1
					nim.pixel_y = -1
			overlays += nim*/




/obj/item/throwballer
	name = "throwing device"
	desc = "speak shit get hit"
	icon = 'icons/obj/pilcrow.dmi'
	icon_state = "bait0"
	force = 0
	throwforce = 0
	w_class = ITEM_SIZE_SMALL
	item_state = "flare"
	var/throwdir = EAST


/obj/item/throwballer/attack_self(mob/user)
	for(var/obj/item/I in view(user,7))
		spawn()
			I.throw_at(get_edge_target_turf(I,throwdir),7,5)
	throwdir = turn(throwdir,180)



