/obj/machinery/gunnery/core/ballistic
	name = "Rail Cannon Receiver"
	desc = "A large cannon that fires kinetic projectiles at speeds sufficient to make them explode upon impact. Do not miss."
	icon_state = "railcore"
	guntype = "ballistic"

/obj/machinery/gunnery/core/ballistic/gunneryAimOffset(atom/target)
	var/aoffset = 0
	if(istype(gMag,/obj/machinery/gunnery/magazine/ballistic))
		var/obj/machinery/gunnery/magazine/ballistic/M = gMag

		if(M.current_round && M.current_round.acc_offset)
			aoffset = M.current_round.acc_offset
			var/atom/a = locate(target.x+rand(-aoffset,aoffset),target.y+rand(-aoffset,aoffset),target.z)
			if(a)
				target = a
	return target

/obj/machinery/gunnery/core/ballistic/getBoom()
	playsound(loc, schutsound, 75, 1)
	var/obj/machinery/gunnery/magazine/ballistic/bMag
	if(istype(gMag, /obj/machinery/gunnery/magazine/ballistic))
		bMag = gMag
	for(var/mob/living/M in GLOB.player_list)
		if(map_sectors["[M.z]"] == map_sectors["[z]"])
			if(!(M.z == z && get_dist(M,src) <= 7))
				M.playsound_local(src, 'sound/effects/explosionfar.ogg', 50, 1)

			if(bMag && bMag.current_round)
				switch(bMag.current_round.recoil)
					if(1) //screenshake
						spawn()
							shake_camera(M, 2, 1)
					if(2) //startrek
						M.apply_effect(rand(1,3),WEAKEN)
						spawn()
							shake_camera(M, 3, 2)
						to_chat(M,"<b>The ground lurches under you!</b>")

	return 1


//obj/machinery/gunnery/core/ballistic/getBoom()
//	..()
	//if(gMag.current_round.recoil)
	//	world << "Boom!"

/obj/machinery/gunnery/magazine/ballistic
	name = "Rail Cannon Magazine"
	desc = "Holds one round and must be reloaded between shots."
	icon_state = "railmag"
	ammunition = 0
	guntype = "ballistic"
	var/obj/item/gunnery/ballistic/current_round

/obj/machinery/gunnery/magazine/ballistic/examine(mob/user, distance = -1)
	..()
	if(user)
		if(current_round)
			to_chat(user,"<span class='notice'>It has \the [current_round] loaded.</span>")
		else
			to_chat(user,"<span class='notice'>It isn't loaded.</span>")


/obj/machinery/gunnery/magazine/ballistic/Destroy()
	current_round.loc = loc
	current_round = null
	. = ..()

/obj/machinery/gunnery/magazine/ballistic/gunneryGetAmmo(use)
	if(use)
		if(current_round)
			return 1
		return 0
	else
		if(current_round)
			return current_round.name
		else
			return "NO SHELL"

/obj/machinery/gunnery/magazine/ballistic/attackby(obj/item/I, mob/user)
/*	if(isCrowbar(I) && current_round)
		to_chat(user,"You pull out \the [current_round].")
		ammunition = 0
		current_round.loc = loc
		current_round = null
		return*/
	if(istype(I,/obj/item/gunnery/ballistic))
		if(current_round)
			to_chat(user,"There's already \the [current_round] in there!")
			return
		if(user.unEquip(I, src))
			current_round = I
			return
	..()

/obj/machinery/gunnery/magazine/ballistic/attack_hand(mob/user as mob)
	if(current_round)
		to_chat(user,"You pull out \the [current_round].")
		user.put_in_hands(current_round)
		current_round = null
	..()

/obj/machinery/gunnery/magazine/ballistic/gunneryAmmoEffect(var/atom/target)
	if(current_round && target)
		return current_round.gunneryGetShootEffect(target)
	return 0


/obj/machinery/gunnery/barrel/ballistic
	name = "Rail Cannon Barrel"
	icon_state = "railbarrel"
	guntype = "ballistic"


/obj/item/gunnery/ballistic
	name = "kinetic rail shell"
	desc = "A large projectile designed to impact a target at significant velocity and then immediately dump all of its kinetic energy."
	icon_state = "hb"
	w_class = ITEM_SIZE_HUGE
	force = 10
	throwforce = 7
	var/spent = 0
	var/recoil = 1
	var/acc_offset = 1

/obj/item/gunnery/ballistic/proc/gunneryGetShootEffect(var/atom/target)
	if(!spent)
		gunneryOnImpact(target)
		spent = 1
		icon_state = "[icon_state]-e"
		name = "spent [name]"
		return 1
	else
		playsound(loc, 'sound/weapons/guns/selector.ogg', 75, 1)
		return 0

/obj/item/gunnery/ballistic/proc/gunneryOnImpact(var/atom/target)
	explosion(target, 0, 1, 3, 5)

/obj/item/gunnery/ballistic/explosive
	name = "heat rail shell"
	desc = "A hyperballistic projectile designed to explode violently on impact, causing mass carnage."
	icon_state = "hbhe"
	acc_offset = 2

/obj/item/gunnery/ballistic/explosive/gunneryOnImpact(atom/target)
	explosion(target, 1, 3, 5, 7)

/obj/item/gunnery/ballistic/precision
	name = "precision rail shell"
	desc = "A rarely used but incredibly accurate shell that guides itself into the target. Will instantly destroy most living creatures."
	icon_state = "hbpr"
	acc_offset = 0

/obj/item/gunnery/ballistic/precision/gunneryOnImpact(atom/target)
	for(var/mob/living/L in target)
		L.gib()
	playsound(target,'sound/effects/meteorimpact.ogg',75,1)
	target.ex_act(3)


/obj/item/gunnery/ballistic/nuclear
	name = "nuclear rail shell"
	desc = "Creates a small nuclear reaction on impact, obliterating everything on the impact site. Causes massive amounts of radiation."
	icon_state = "hbnk"
	recoil = 2
	acc_offset = 5

/obj/item/gunnery/ballistic/nuclear/gunneryOnImpact(atom/target)
	SSradiation.radiate(target, rand(90,200))
	explosion(target,7,10,14,18)


/obj/item/gunnery/ballistic/cluster
	name = "cluster rail shell"
	desc = "A hyperballistic projectile designed to spread out into a cloud of shrapnel shortly before impact, maximizing surface area."
	icon_state = "hbcl"
	acc_offset = 1
	var/fragments = 7
	var/frag_offset = 3

/obj/item/gunnery/ballistic/cluster/gunneryOnImpact(atom/target)
	explosion(target, 0, 1, 2, 4)
	var/atom/ntarget
	for(var/i, i<fragments, i++)
		ntarget = locate(target.x+rand(-frag_offset,frag_offset),target.y+rand(-frag_offset,frag_offset),target.z)
		if(ntarget)
			explosion(ntarget, 0, 1, 1, 2)
	for(var/mob/living/M in range(target,3))
		M.apply_damage(rand(15,30),BRUTE, null,0,DAM_SHARP)


/*
/obj/item/gunnery/ballistic/practice
	name = "practice rail shell"
	desc = "This hyperballistic shell does not actually fire a projectile, but still detonates a charge. It will report on the estimated location of the shot, had it been real."
	acc_offset = 0

/obj/item/gunnery/ballistic/practice/attack_self(mob/user)
	acc_offset = input(user,"Please choose a number to offset accuracy by.","Accuracy Offset") as num|null
	if(isnull(acc_offset))
		acc_offset = 0
	to_chat(user,"You set \the [src]'s offset to [acc_offset].")
	..()

/obj/item/gunnery/ballistic/practice/attackby(obj/item/I, mob/user)
	if(istype(I,/obj/item/gunnery/ballistic))
		var/obj/item/gunnery/ballistic/B = I
		acc_offset = B.acc_offset
		to_chat(user,"\The [src] scans \the [I].")
		return
	..()

/obj/item/gunnery/ballistic/practice/examine(mob/user, distance = -1)
	..()
	var/dat = "Its offset is [acc_offset]"
	switch(acc_offset)
		if(0)
			dat += ", mimicing a precision shell."
		if(1)
			dat += ", mimicing a cluster or kinetic shell."
		if(2)
			dat += ", mimicing a HEAT shell."
		if(5)
			dat += ", mimicing a nuclear round."
		else
			dat+= "."
	to_chat(user, dat)

/obj/item/gunnery/ballistic/practice/gunneryOnImpact(atom/target)
	loc.visible_message("<b>\The [src]</b> beeps, \"Estimated location of theoretical splashdown: [target.x], [target.y].\"")
*/
