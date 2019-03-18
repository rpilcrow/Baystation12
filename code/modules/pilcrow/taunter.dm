/obj/item/device/taunter
	name = "T4-NT 'Taunter'"
	desc = "A strange little device that <b>attracts the attention</b> of most hostile and potentially hostile creatures within sight. Use carefully."
	icon = 'icons/obj/pilcrow.dmi'
	icon_state = "bait0"
	var/next_use

/obj/item/device/taunter/attack_self(mob/living/user)
	if(next_use > world.time || !istype(user))
		return
	next_use = world.time+30
	flick("bait2",src)
	playsound(user.loc,'sound/machines/defib_SafetyOn.ogg',70,0)
	for(var/mob/living/simple_animal/hostile/L in oview(user,7))
		if(L.target_mob == user) //my work here is done
			continue //but you didn't do anything!
		if(istype(L,/mob/living/simple_animal/hostile/retaliate))
			var/mob/living/simple_animal/hostile/retaliate/R = L
			R.enemies |= weakref(user)
		if(L.ValidTarget(user))
			L.target_mob = user
			L.face_atom(user)
			//L.stance = HOSTILE_STANCE_ATTACK
			L.kick_stance()
			//to_chat(user,"\The [L]'s attention is turned towards you!")

/obj/item/device/shuffler
	name = "R3-SHUF"
	desc = "This device forces nearby hostile creatures to <b>reconsider their targets</b>, potentially going after other targets. Of no use when you are the only applicable target."
	icon = 'icons/obj/pilcrow.dmi'
	icon_state = "change0"
	var/next_use

/obj/item/device/shuffler/attack_self(mob/living/user)
	if(next_use > world.time || !istype(user))
		return
	next_use = world.time+30
	flick("change2",src)
	playsound(user.loc,'sound/machines/defib_SafetyOff.ogg',70,0)
	for(var/mob/living/simple_animal/hostile/L in oview(user,7))
		if(L.target_mob == user)
			L.target_mob = L.FindTarget()
