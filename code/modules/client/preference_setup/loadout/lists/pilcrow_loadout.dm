
/////////////////////////////////////
//UNIQUE ITEMS///////////////////////

/datum/gear/unique
	sort_category = "Unique"
	category = /datum/gear/unique

/datum/gear/unique/pblaster
	display_name = "Pilcrow's Blaster"
	path = /obj/item/weapon/gun/energy/pilcrow
	cost = 4

/datum/gear/unique/pmachete
	display_name = "Pilcrow's Machete"
	path = /obj/item/weapon/material/hatchet/machete/pilcrow
	cost = 2


/////////////////////////////////////
//UTILITY ITEMS//////////////////////

/datum/gear/utility/pilammo
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
	sord["butterfly knife"] = /obj/item/weapon/material/knife/folding/combat/balisong
	sord["kitchen knife"] = /obj/item/weapon/material/knife
	sord["butterknife"] = /obj/item/weapon/material/knife/table
	sord["baseball bat"] = /obj/item/weapon/material/twohanded/baseballbat
	sord["longsword"] = /obj/item/weapon/material/sword/longsword
//	sord["swordcane"] = /obj/item/weapon/cane/concealed/sword //PIL_MERGE_NOTE: invalid type
	gear_tweaks += new/datum/gear_tweak/path(sord)

/datum/gear/utility/bshield
	display_name = "budget personal shield"
	cost = 2
	sort_category = "Utility"
	path = /obj/item/device/personal_shield/budget
/*
/datum/gear/utility/pshield
	display_name = "personal shield"
	cost = 6
	sort_category = "Utility"
	path = /obj/item/device/personal_shield
*/
/datum/gear/utility/flashlight
	display_name = "flashlight"
	cost = 1
	sort_category = "Utility"
	path = /obj/item/device/flashlight

/datum/gear/utility/maglight
	display_name = "flashlight (maglight)"
	cost = 2
	sort_category = "Utility"
	path = /obj/item/device/flashlight/maglight

/datum/gear/suit/cloak
	display_name = "dyable cloak"
	path = /obj/item/clothing/suit/storage/hooded/cloak
	cost = 1
	flags = GEAR_HAS_COLOR_SELECTION