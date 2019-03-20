//PIL_EDIT: overhauled a LOT of this.
/obj/item/device/personal_shield
	name = "personal shield"
	desc = "Truly a lifesaver; this device protects the user from fast-moving objects such as bullets, and can absorb beams. It will do nothing against low-velocity impacts."
	icon = 'icons/obj/pilcrow.dmi'
	icon_state = "shield0"
	var/uses = 5
	var/maxuses = 5
	var/obj/aura/personal_shield/device/shield
	slot_flags = SLOT_BELT

/obj/item/device/personal_shield/budget
	name = "budget personal shield"
	desc = "This device will protect the user from a single fast-moving object such as a bullet or a beam before it needs recalibrating. It will do nothing against low-velocity impacts."
	uses = 1
	maxuses = 1

/obj/item/device/personal_shield/deluxe
	name = "power shield"
	desc = "This device protects the user from a large amount of fast-moving objects such as bullets and laserbeams. It will do nothing against low-velocity impacts."
	uses = 10
	maxuses = 10

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
//	world << "newloc [NewLoc] oldloc? [loc]"
//	if(NewLoc != loc)
	QDEL_NULL(shield)
	update_icon()
	return ..()

/obj/item/device/personal_shield/forceMove(atom/destination)
	if(loc != destination)
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







////////////////////////////////////
//POWERSHIELD///////////////////////

/obj/item/device/powershield
	name = "powershield"
	desc = "This shield surrounds you in a sheath of energy that staves off incoming attacks."
	icon = 'icons/obj/pilcrow.dmi'
	icon_state = "shield0"
//	var/shieldmode = 1|2|4
	var/panel_state = 0
	var/obj/item/weapon/cell/sCell
	var/obj/aura/personal_shield/powershield/shield
	slot_flags = SLOT_BELT

/obj/item/device/powershield/Initialize()
	..()
	sCell = new /obj/item/weapon/cell/high(src)

/obj/item/device/powershield/examine(mob/user, distance = -1)
	..()
	if(user)
		if(sCell)
			to_chat(user,"\The [sCell] is installed and its charge meter reads '<b>[round(sCell.percent(), 0.1)]%</b> ([sCell.charge]Wh)'")
			if(!sCell.check_charge(100))
				to_chat(user,"<span class='warning'>It won't activate in this state, it requires [100-sCell.charge]Wh more charge!</span>")
		else
			to_chat(user,"There is <b>no cell</b> installed.")
		if(panel_state)
			to_chat(user,"<span class='warning'>Its maintenance panel is open. It cannot activate in this state.</span>")
		else
			to_chat(user,"Its maintenance panel is closed.")



/obj/item/device/powershield/attack_self(var/mob/living/user)
	if(panel_state)
		to_chat(user,"<span class='warning'>\The [src]'s maintenance panel is open!</span>")
		return
	if(sCell && sCell.check_charge(100))
		if(!shield)
			shield = new(user,src)
			update_icon()
		else
			user.visible_message("<span class='notice'>[user] deactivates their [src].</span>","<span class='notice'>You deactivate \the [src].</span>")
			QDEL_NULL(shield)
			update_icon()
	else
		to_chat(user,"<span class='warning'>Not enough charge! It requires [100-sCell.charge] more Wh!</span>")

/obj/item/device/powershield/Move()
	QDEL_NULL(shield)
	update_icon()
	return ..()

/obj/item/device/powershield/forceMove(atom/destination)
	if(loc != destination)
		QDEL_NULL(shield)
	update_icon()
	return ..()

/obj/item/device/powershield/proc/check_charge(var/amount)
	if(panel_state)
		return 0
	if(sCell)
		return sCell.check_charge(amount)
	return 0

/obj/item/device/powershield/proc/take_charge(var/amount)

	//PROTECT CONDITIONS
	//at least 100Wh in battery
	//panel closed
	//
	//SHIELD FAILURE CONDITIONS
	//under 100Wh in battery after drain

	if(!amount)
		return 1

	if(sCell)
		sCell.use(amount)
		if(!sCell.check_charge(100))
			shield_failure()
			return 0
		return 1
	shield_failure()
	return 0

/obj/item/device/powershield/proc/shield_failure()
	if(shield)
		QDEL_NULL(shield)
		playsound(loc,'sound/mecha/internaldmgalarm.ogg',25,1)
		loc.visible_message("<span class='danger'>\The [src] shuts down!</span>")
	update_icon()


/obj/item/device/powershield/on_update_icon()
	if(sCell && sCell.check_charge(100))
		icon_state = "shield[shield ? 1 : 0]"
	else
		icon_state = "shield-b"

/obj/item/device/powershield/Destroy()
	QDEL_NULL(shield)
	return ..()

//PIL_EDIT
/obj/item/device/powershield/attackby(obj/item/I, mob/user)
	if(isScrewdriver(I))
		if(shield)
			to_chat(user,"<span class='warning'>Turn off \the [src], first!</span>")
			return 0
		playsound(src.loc, 'sound/items/Screwdriver.ogg', 50, 1)
		if(do_after(user,10))
			panel_state = !panel_state
			//playsound(src.loc, 'sound/items/Screwdriver2.ogg', 50, 1)
			to_chat(user,"<span class='notice'>You [panel_state ? "open" : "close"] the [src]'s panel.</span>")
			update_icon()
			return 1
	if(istype(I,/obj/item/weapon/cell))
		if(!panel_state)
			to_chat(user,"<span class='warning'>\The [src]'s maintenance panel is closed!</span>")
			return
		if(sCell)
			to_chat(user,"There's already \the [sCell] in there!")
			return
		if(user.unEquip(I, src))
			sCell = I
			update_icon()
			return
		return
	..()

/obj/item/device/powershield/attack_hand(mob/user as mob)
	if(sCell && panel_state && user.get_inactive_hand() == src)
		to_chat(user,"You remove \the [sCell].")
		user.put_in_hands(sCell)
		sCell = null
		if(shield)
			QDEL_NULL(shield)
		update_icon()
	else
		return ..()

