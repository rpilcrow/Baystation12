/obj/item/organ/internal/eyes/darkling
//	name = "eyeballs"
	eye_colour = list(255,255,255)
	innate_flash_protection = FLASH_PROTECTION_MODERATE
	var/flashlight = 0
	eye_icon = 'icons/mob/human_races/species/dark/eyes.dmi'//'icons/mob/human_races/species/default_eyes.dmi'
	apply_eye_colour = FALSE
	action_button_name = "Eye Glow"

/obj/item/organ/internal/eyes/darkling/refresh_action_button()
	. = ..()
	if(.)
		action.button_icon_state = "dark-eyes"
		if(action.button) action.button.UpdateIcon()

/obj/item/organ/internal/eyes/darkling/attack_self(var/mob/user)
	. = ..()
	if(.)

		//FLASHLIGHT

		if(is_bruised())
			to_chat(user,"You can't light up your eyes.")
			return
		if(flashlight)
			user.visible_message("[user]'s eyes stop glowing as brightly.","Your eyes dim.")
			set_light(0)
		else
			user.visible_message("[user]'s eyes light up","Your eyes light up, illuminating the area.")
			set_light(0.6, 1, 5, 2, "#ffffff")
		flashlight = !flashlight
		return

/obj/item/organ/internal/eyes/darkling/take_internal_damage()
	. = ..()
	if(flashlight && is_bruised())
		if(istype(loc,/mob/living))
			loc.visible_message("[loc]'s eyes stop glowing as brightly.","<span class='danger>You can't maintain your light!</span>")
		set_light(0)


/obj/item/organ/internal/shocker
	name = "electrical lump"
	desc = "A large chunk of flesh that crackles with innate electricity."
	icon_state = "cell"
	max_damage = 45
	parent_organ = BP_CHEST
	organ_tag = BP_ZAPPER
	dead_icon = "cell-d"
	var/charge = 3
	var/maxcharge = 3
	var/next_charge = 0
	var/datum/effect/effect/system/spark_spread/sprk = new /datum/effect/effect/system/spark_spread
	action_button_name = "Trigger Shock"

/obj/item/organ/internal/shocker/Destroy()
	QDEL_NULL(sprk)
	..()

/obj/item/organ/internal/shocker/refresh_action_button()
	. = ..()
	if(.)
		action.button_icon_state = "dark-zap"
		if(action.button) action.button.UpdateIcon()

/obj/item/organ/internal/shocker/Process()
	..()
	if(charge < maxcharge && !is_bruised() && next_charge < world.time)
		charge++
		next_charge = world.time+15 SECONDS

/obj/item/organ/internal/shocker/attack_self(var/mob/user)
	. = ..()
	if(.)
		//ZAP

		/*
		//let this stand eternal as a testament to how much of a fucking flatbrain i am

		var/mob/living/carbon/human/H
		if(istype(user,/mob/living/carbon/human))
			H = user
			var/obj/item/organ/internal/shocker/E = H.internal_organs_by_name[BP_SHOCKER]
			if(!E)
				return
			if(E.is_bruised())
				to_chat(user,"<span class='danger'>Your eyes are too damaged!</span>")
				return
			else
				E.take_general_damage(rand(1,4)) //avg. 3-4 uses
		*/
		//we're using charge now, anyhow


		if(charge)
			charge--
			next_charge = world.time+25 SECONDS
		else
			to_chat(user,"<span class='danger'>You don't have enough charge!</span>")
			return

		playsound(user, 'sound/effects/sparks4.ogg', 100, 1)
		new /obj/effect/temporary(get_step(user,0), 0.7 SECONDS,'icons/effects/effects.dmi',"electricity_constant")
		sprk.set_up(3, 0, get_step(user,0))
		sprk.start()

		user.visible_message("<span class='danger'>[user] releases an electrical burst!</span>","<span class='warning'>You release an electrical burst! ([charge]/[maxcharge] charges left)</span>","You hear the crackle of electricity.")

		for(var/mob/living/O in orange(1,user))
			//if(O == user)
			//	continue
			//if (get_dist(H, O) > 2)
			//	continue
			//var/flash_time = 6
			if (istype(O, /mob/living/carbon/human))
				O.stun_effect_act(1,45)
			else
				O.stun_effect_act(2)
			new /obj/effect/temporary(get_step(O,0), 0.75 SECONDS,'icons/effects/effects.dmi',"sparks")
			sprk.set_up(1, 0, get_step(O,0))
			sprk.start()

/*				var/mob/living/carbon/human/V = O
				if(!V.eyecheck() <= 0)
					continue
				flash_time = round(V.species.flash_mod * flash_time)
				if(flash_time <= 0)
					continue
				var/obj/item/organ/internal/eyes/E = V.internal_organs_by_name[BP_EYES]
				if(!E)
					continue
				if(E.is_bruised() && prob(E.damage + 50))
					//V.flash_eyes()
					E.damage += rand(1, 5)
			if(!O.blinded)
				O.flash_eyes()
				O.eye_blurry += flash_time
				O.confused += (flash_time + 2)
				O.Stun(flash_time / 2)

				O.Weaken(2)
			else
*/
	//	if(!charge)
	//		to_chat(user,"<span class='warning'>Your zapper is out of charge.</span>")

/obj/item/organ/internal/shocker/take_internal_damage()
	. = ..()
	if(is_bruised() && charge)
		charge--
		if(owner)
			to_chat(owner,"<span class='warning'>You feel something spark inside you.</span>")
			if(!charge)
				to_chat(owner,"<span class='warning'>You are out of charge!</span>")