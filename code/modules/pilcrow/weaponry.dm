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

/obj/item/weapon/gun/energy/laser/old
	name = "old laser carbine"
	desc = "A Hephaestus Industries G40E carbine that's seen more than a few years of use. While its components are degraded and the blast it emits is weaker, it's still formidable."
	projectile_type = /obj/item/projectile/beam
	fire_delay = 15


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