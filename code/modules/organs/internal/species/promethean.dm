/obj/item/organ/internal/brain/slime
	name = "slime core"
	desc = "A complex, organic knot of jelly and crystalline particles."
	icon = 'icons/mob/slimes.dmi'
	icon_state = "green slime extract"
	parent_organ = BP_CHEST
	relative_size = 100
//	var/nutrition = 0


/obj/item/organ/internal/brain/slime/can_recover()
	return 0

//obj/item/organ/internal/brain/slime/attackby(obj/item/I,mob/user)
//	if(isWrench(I))
//
//	. = ..()
