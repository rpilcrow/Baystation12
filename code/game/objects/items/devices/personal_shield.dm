//PIL_EDIT: overhauled a LOT of this.
/obj/item/device/personal_shield
	name = "personal shield"
	desc = "Truly a lifesaver; this device protects the user from fast-moving objects such as bullets, and can absorb beams. It will do nothing against low-velocity impacts."
	icon = 'icons/obj/pilcrow.dmi'
	icon_state = "shield10"
	var/uses = 5
	var/maxuses = 5
	var/obj/aura/personal_shield/device/shield

/obj/item/device/personal_shield/examine(mob/user, distance = -1)
	..()
	if(user)
		if(uses)
			to_chat(user,"It has <b>[uses]</b>/[maxuses] charges left.")
		else
			to_chat(user,"It requires recalibrating using a screwdriver.")

/obj/item/device/personal_shield/attack_self(var/mob/living/user)
	if(uses && !shield)
		shield = new(user,src)
		update_icon()
	else
		user.visible_message("<span class='notice'>[user] deactivates their [src].</span>","<span class='notice'>You deactivate \the [src].</span>")
		QDEL_NULL(shield)
		update_icon()

/obj/item/device/personal_shield/Move()
	QDEL_NULL(shield)
	update_icon()
	return ..()

/obj/item/device/personal_shield/forceMove()
	QDEL_NULL(shield)
	update_icon()
	return ..()

/obj/item/device/personal_shield/proc/take_charge()
	if(!--uses)
		QDEL_NULL(shield)
		//to_chat(loc,"<span class='warning'>\The [src] is forced offline!</span>")
		playsound(loc,'sound/mecha/internaldmgalarm.ogg',25,1)
		loc.visible_message("<span class='danger'>\The [src] sparks as it's forced offline!</span>")
		update_icon()
		return

/obj/item/device/personal_shield/on_update_icon()
	if(uses)
		icon_state = "shield[shield ? 1 : 0]"
	else
		icon_state = "shield-b"

/obj/item/device/personal_shield/Destroy()
	QDEL_NULL(shield)
	return ..()

//PIL_EDIT
/obj/item/device/personal_shield/attackby(obj/item/I, mob/user)
	if(isScrewdriver(I))
		if(shield)
			to_chat(user,"<span class='warning'>Turn off \the [src], first!</span>")
			return 0
		if(uses == maxuses)
			to_chat(user,"<span class='notice'>It's already calibrated.</span>")
			return 0
		playsound(src.loc, 'sound/items/Screwdriver.ogg', 50, 1)
		if(do_after(user,50))
			playsound(src.loc, 'sound/items/Screwdriver2.ogg', 50, 1)
			to_chat(user,"<span class='notice'>You recalibrate \the [src]'s field generator.</span>")
			uses = maxuses
			update_icon()
			return 1
	..()