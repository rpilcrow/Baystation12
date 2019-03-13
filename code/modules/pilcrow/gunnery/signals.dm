/obj/item/gunnery/signal
	name = "orbital signal flare"
	desc = "When you activate this, it will appear as a targeting beacon for orbital guns until its battery runs out. Make a quick exit."
	icon_state = "flare0"
	force = 0
	throwforce = 0
	w_class = ITEM_SIZE_SMALL
	item_state = "flare"
	var/obj/item/weapon/cell/gCell
	var/on = 0


/obj/item/gunnery/signal/attack_self(mob/user)
	if(on)
		user.visible_message("[user] deactivates \the [src].","You deactivate \the [src].")
		on = 0
		update_icon()
		STOP_PROCESSING(SSobj,src)
	else
		if(gCell && gCell.check_charge(1))
			user.visible_message("[user] activates \the [src]!","You activate \the [src].")
			on = 1
			update_icon()
			START_PROCESSING(SSobj,src)
		else
			user.visible_message("[user] tries to activate \the [src], but it doesn't respond.","You try to activate \the [src], but it doesn't respond.")
	..()

/obj/item/gunnery/signal/Initialize()
	..()
	gunnerypieces += src
	gCell = new /obj/item/weapon/cell/device/standard (src)

/obj/item/gunnery/signal/examine(mob/user, distance = -1)
	..()
	if(gCell)
		if(on)
			var/atom/exaloc = get_turf(src)
			if(exaloc)
				to_chat(user,"The readout displays '[exaloc.x], [exaloc.y], [exaloc.z]'")
			to_chat(user,"It's [gCell.percent()]% charged.")
		else
			to_chat(user,"It's [gCell.percent()]% charged.")
	else
		to_chat(user,"It doesn't have a cell.")


/obj/item/gunnery/signal/Destroy()
	gunnerypieces -= src
	on = 0
	STOP_PROCESSING(SSobj,src)
	. = ..()

/obj/item/gunnery/signal/get_cell()
	return gCell

/obj/item/gunnery/signal/attack_hand(mob/user as mob)
	if(gCell && user.get_inactive_hand() == src)
		to_chat(user,"You remove \the [gCell].")
		user.put_in_hands(gCell)
		gCell = null
	else
		return ..()

/obj/item/gunnery/signal/attackby(obj/item/I,mob/user)
	if(istype(I,/obj/item/weapon/cell/device))
		if(gCell)
			to_chat(user,"There's already \the [gCell] in there!")
			return
		if(user.unEquip(I, src))
			gCell = I
			return
		return
	..()

/obj/item/gunnery/signal/Process()
	if(gCell && on)
		if(!gCell.checked_use(1))
			on = 0
			update_icon()
			STOP_PROCESSING(SSobj,src)
			visible_message("\The [src]'s light dies out.")
	else
		on = 0
		update_icon()
		STOP_PROCESSING(SSobj,src)
		visible_message("\The [src]'s light dies out.")

/obj/item/gunnery/signal/on_update_icon()
	..()
	icon_state = "flare[on]"