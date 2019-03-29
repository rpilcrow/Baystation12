/datum/gear/utility/guns
	display_name = "guns"
//	flags = GEAR_HAS_COLOR_SELECTION
	cost = 3
	sort_category = "Utility"
	path = /obj/item/weapon/gun/projectile/

/datum/gear/utility/guns/New()
	..()
	var/guns = list()
	guns["7mm holdout revolver"] = /obj/item/weapon/gun/projectile/revolver/holdout
	guns["7mm holdout pistol"] = /obj/item/weapon/gun/projectile/pistol/holdout
	guns["10mm pistol"] = /obj/item/weapon/gun/projectile/pistol/sec/lethal
	guns["15mm revolver"] = /obj/item/weapon/gun/projectile/revolver
	guns["12ga pump shotgun"] = /obj/item/weapon/gun/projectile/shotgun/pump
	guns["12ga double barrel"] = /obj/item/weapon/gun/projectile/shotgun/doublebarrel
	guns["retro laser pistol"] = /obj/item/weapon/gun/energy/retro
	guns["old laser carbine"] = /obj/item/weapon/gun/energy/laser/old
	guns["plasma cutter"] = /obj/item/weapon/gun/energy/plasmacutter
	gear_tweaks += new/datum/gear_tweak/path(guns)


