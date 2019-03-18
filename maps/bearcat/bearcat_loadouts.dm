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

/datum/gear/utility/pilammo //PIL_EDIT
	display_name = "spare ammo"
	cost = 1
	sort_category = "Utility"
	path = /obj/item/ammo_magazine/

/datum/gear/utility/pilammo/New()
	..()
	var/boolet = list()
	boolet["7mm speedloader"] = /obj/item/ammo_magazine/speedloader/small
	boolet["7mm magazine"] = /obj/item/ammo_magazine/pistol/small
	boolet["10mm magazine"] = /obj/item/ammo_magazine/pistol
	boolet["10mm rubber magazine"] = /obj/item/ammo_magazine/pistol/rubber
	boolet["15mm speedloader"] = /obj/item/ammo_magazine/speedloader/magnum
	boolet["4 12ga buck shells"] = /obj/item/ammo_magazine/shotholder/shell
	boolet["4 12ga slug shells"] = /obj/item/ammo_magazine/shotholder
	boolet["4 12ga beanbags"] = /obj/item/ammo_magazine/shotholder/beanbag
	gear_tweaks += new/datum/gear_tweak/path(boolet)


/datum/gear/utility/pilmelee
	display_name = "melee weapon"
	cost = 2
	sort_category = "Utility"
	path = /obj/item/weapon/

/datum/gear/utility/pilmelee/New()
	..()
	var/sord = list()
	sord["hatchet"] = /obj/item/weapon/material/hatchet
	sord["machete"] = /obj/item/weapon/material/hatchet/machete
	sord["officer's sword"] = /obj/item/weapon/material/sword/replica/officersword/pilcustom
	sord["telescopic baton"] = /obj/item/weapon/melee/telebaton
	sord["butterfly knife"] = /obj/item/weapon/material/butterfly
	sord["kitchen knife"] = /obj/item/weapon/material/knife
	sord["butterknife"] = /obj/item/weapon/material/kitchen/utensil/knife
	sord["baseball bat"] = /obj/item/weapon/material/twohanded/baseballbat
	sord["swordcane"] = /obj/item/weapon/cane/concealed/sword
	gear_tweaks += new/datum/gear_tweak/path(sord)