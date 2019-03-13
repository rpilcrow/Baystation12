/obj/machinery/traumaticpsi
	name = "strange machinery"
	desc = "It appears to be some kind of device, but there's no clear way to operate it. A readout on the front is showing a rapidly-moving sine wave."
	icon_state = "kovelai"
	icon = 'icons/obj/pilcrow.dmi'
	density = 1
	anchored = 1

	var/list/triggered = list()
	var/static/list/psi_operancy_messages = list(
		"There's something in your skull!",
		"Something is eating your thoughts!",
		"You can feel your brain being rewritten!",
		"Something is crawling over your frontal lobe!",
		"<b>THE SIGNAL THE SIGNAL THE SIGNAL THE SIGNAL THE</b>",
		"It feels like something's rooting around in your head!",
		"Something is crawling around inside your head!",
		"There's fingers pressing against the inside of your skull!",
		"Your head cracks open!",
		"it hurts it hurts it hurts it hurts it hurts it hurts it hurts it hurts",
		"it hurts it hurts it hurts it hurts it hurts it",
		"it hurts"
		)
	var/list/faculties = list(PSI_COERCION, PSI_REDACTION, PSI_ENERGISTICS, PSI_PSYCHOKINESIS, PSI_COERCION, PSI_REDACTION, PSI_ENERGISTICS, PSI_PSYCHOKINESIS)

/obj/machinery/traumaticpsi/examine(mob/user, distance = -1)
	..()
	if(istype(user,/mob/living/carbon/human))
		var/mob/living/carbon/human/H = user
		if(faculties.len)
			if(H.psi)
				to_chat(H,"Something inside it is making a shrill noise just on the edge of periphery, and it makes your head hurt the longer you look at it.")
			else
				to_chat(H,"Just looking at it gives you a headache. The more you stare, the worse it gets.")
			var/obj/item/organ/external/affecting = H.get_organ(BP_HEAD)
			if(affecting) //if you don't have a head you're- probably a slime or robit, actually.
				affecting.add_pain(5)
/*
/obj/machinery/traumaticpsi/attackby(obj/item/I, mob/user)
	if(isWrench(I))
		if(anchored)
			user.visible_message("<span class='notice'>\The [user] loosens \the [src]'s bolts with \the [I].</span>", "<span class='notice'>You loosen \the [src]'s bolts with \the [I].</span>")
			desc = "It appears to be some kind of device. Its bolts are loosened."
		else
			user.visible_message("<span class='notice'>\The [user] tightens \the [src]'s bolts with \the [I].</span>", "<span class='notice'>You tighten \the [src]'s bolts with \the [I].</span>")
			desc = "It appears to be some kind of device, fixed to the floor with loose bolts."
		anchored = !anchored
		playsound(loc, 'sound/items/Deconstruct.ogg', 50, 1)
		return
	..()*/

/obj/machinery/traumaticpsi/attack_hand(mob/user)
	set waitfor = 0

	if(!faculties.len)
		user.visible_message("<span class='notice'>[user] touches \the [src].</span>")
		return

	var/obj/item/organ/external/EX

	if(istype(user,/mob/living/carbon/human))
		var/mob/living/carbon/human/victim = user

		if(user in triggered)
			user.visible_message("<span class='notice'>[user] touches \the [src]. Energy crackles around their fingers, and then stops.</span>","<span class='warning'>You touch \the [src]. Energy crackles around your fingers and pain jolts through your arm, but nothing else happens.</span>")
			if(victim.hand)
				EX = victim.get_organ(BP_L_ARM)
			else
				EX = victim.get_organ(BP_R_ARM)
			if(EX)
				EX.add_pain(10)
			return

		triggered += victim

		user.visible_message(SPAN_DANGER("[user] touches \the [src] and is surrounded in an awful glow as the machine's surface crackles with energy!"),"<span class='notice'>You touch \the [src] and your mind starts to turn inward..</span>")

		victim.Stun(2)

		sleep(10)

		if(victim.hand)
			EX = victim.get_organ(BP_L_ARM)
		else
			EX = victim.get_organ(BP_R_ARM)

		if(EX) //your hand asplode
			if(prob(66))
				EX.droplimb(0, DROPLIMB_BLUNT, 0)
			else
				EX.take_external_damage(rand(15,25)) //i wonder if i should just deal an obnoxious amount of damage to the hand instead of obliterating the arm.
				if(victim.hand) //ECH
					EX = victim.get_organ(BP_L_HAND)
				else
					EX = victim.get_organ(BP_R_HAND)
				if(EX)
					EX.take_external_damage(rand(5,20))
		else //how the fuck did you touch it without a hand. whatever, take this for your effort.
			victim.take_overall_damage(100)



		if(victim.psi) //code here stolen shamelessly from the psi wail event.
			to_chat(victim, SPAN_DANGER("Pain travels up your arm and explodes through your body as a faintly familiar noise echoes in your mind."))
			victim.psi.backblast(rand(5,15))
			victim.Paralyse(5)
			victim.make_jittery(100)
		else
			to_chat(victim, SPAN_DANGER("You're faintly aware of a distant pain as you collapse into siezure, a haunting sound tearing through your mind!"))
			victim.seizure()
			var/new_latencies = rand(1,min(faculties.len,4))
			for(var/i = 1 to new_latencies)
				to_chat(victim, SPAN_DANGER("<font size = 3>[pick(psi_operancy_messages)]</font>"))
				victim.adjustBrainLoss(rand(1,20))
				victim.set_psi_rank(pick_n_take(faculties), 1)
				sleep(30)
			victim.psi.update()
		sleep(45)
		victim.psi.check_latency_trigger(100, "a horrific machine", redactive = TRUE) //ok that's all.

		if(!faculties.len)
			sleep(10)
			visible_message("Something inside \the [src] noisily grinds to a halt, and a noise on the edge of hearing stops.")
			icon_state = "kovelai-off"
			desc = "It appears to be some kind of device, but there's no clear way to operate it. A readout on the front is dead."
		return