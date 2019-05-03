/obj/item/clothing/suit/cloak
	name = "cloak"
	desc = "A heavy and warm cloak often used to protect oneself from the elements."
	species_restricted = null
	icon_state = "cloak-dyable"
	item_state = "labcoat"
	body_parts_covered = UPPER_TORSO||LOWER_TORSO|ARMS
	cold_protection = UPPER_TORSO||LOWER_TORSO|ARMS
	min_cold_protection_temperature = T0C - 20
	siemens_coefficient = 0.7
	color = "#404040"
	slot_flags = SLOT_OCLOTHING|SLOT_BACK

/obj/item/clothing/suit/cloak/royal
	name = "royal cloak"
	desc = "This heavy, red velvet cloak signifies that you are a person of high status and importance. Or that you're trying to look like one, at least."
	icon_state = "cloak-royal"
	color = COLOR_WHITE

/obj/item/clothing/suit/cloak/blackred
	desc = "This cloak has a soft red inlay, giving it comfort and style."
	icon_state = "cloak-br"
	color = COLOR_WHITE

/obj/item/clothing/suit/storage/hooded/cloak
	name = "hooded cloak"
	desc = "A heavy and warm cloak often used to protect oneself from the elements. This one has a hood attached and storage for tiny items."
	icon_state = "cloak-dyable"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS
	min_cold_protection_temperature = ARMOR_MIN_COLD_PROTECTION_TEMPERATURE
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 10, rad = 0)
	action_button_name = "Toggle Cloak Hood"
	hoodtype = /obj/item/clothing/head/cloakhood
	allowed = list (/obj/item/weapon/pen, /obj/item/weapon/paper, /obj/item/device/flashlight,/obj/item/weapon/storage/fancy/cigarettes, /obj/item/weapon/storage/box/matches, /obj/item/weapon/reagent_containers/food/drinks/flask)
	siemens_coefficient = 0.7
	color = "#404040"

/obj/item/clothing/head/cloakhood
	name = "cloak hood"
	desc = "A hood attached to a heavy cloak."
	icon_state = "generic_hood"
	body_parts_covered = HEAD
	min_cold_protection_temperature = ARMOR_MIN_COLD_PROTECTION_TEMPERATURE
	cold_protection = HEAD
	flags_inv = HIDEEARS | BLOCKHAIR