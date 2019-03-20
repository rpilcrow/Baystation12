

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
	desc = "While not a necessarily new concept, the Saito Arms 'Riveter Mk44' takes automatic revolvers to the next level by allowing for an instantaneous dump of its entire 7-round cylinder."
	firemodes = list(
		list(mode_name="semi", burst=1, fire_delay=6, one_hand_penalty=0, burst_accuracy=null, dispersion=null),
		list(mode_name="three-shot burst", burst=3, fire_delay=null, one_hand_penalty=0, burst_accuracy=list(1,0,-1), dispersion=list(0.0, 0.6, 1.0)),
		list(mode_name="seven-shot burst", burst=7, fire_delay=null, one_hand_penalty=4, burst_accuracy=list(1,0,-1,-1,-2,-2,-3), dispersion=list(0.0, 0.4, 0.6, 0.8, 1.0)),
		)
	max_shells = 7
	accuracy = 1
	bulk = 1

/obj/item/weapon/gun/projectile/revolver/mega
	name = "Wristbreaker 15"
	icon = 'icons/obj/guns/pilcrow.dmi'
	icon_state = "thic"
	caliber = CALIBER_ANTIMATERIAL
	ammo_type = /obj/item/ammo_casing/shell //obj/item/ammo_casing/pistol
	desc = "The Saito Arms 'WB-15' is a .15mmR antimateriel revolver, designed to deliver maximum force to a single target. Brace with both hands, or else."
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
	item_state = "machete"
	slot_flags = SLOT_BELT
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
	name = "silver longsword"
	default_material = MATERIAL_SILVER

/obj/item/weapon/material/sword/longsword/titanium
	name = "titanium longsword"
	default_material = MATERIAL_TITANIUM



/obj/item/weapon/cane/concealed/sword
	desc = "A cane used by a true gentleman. There's a seam near the end."
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
	item_state = "machete"
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
	item_state = "machete"
//	force_divisor = 0.2
	thrown_force_divisor = 0.50
	attack_verb = list("slashed", "cut")

/obj/item/weapon/material/hatchet/machete/pilcrow/Initialize()
	. = ..()
	icon_state = "machete_pil"