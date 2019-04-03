/atom/movable
	var/throw_delay = 2

/mob
	var/middlemode = 0
	var/obj/screen/middlejump = null

/mob/proc/update_middlemode(var/newmode = MIDDLE_SWAP)
	middlemode = newmode
	if(middlejump)
		middlejump.icon_state = "jump[middlemode == MIDDLE_JUMP ? 1 : 0]"
	return 1

/mob/living/carbon/human
	does_spin = 0
	throw_delay = 1

/mob/living/carbon/human/verb/jump_at(atom/A as mob|obj|turf in view())
	set name = "Jump Towards"
	set category = "IC"

	if(!isturf(src.loc))// || !(A in view(src.loc)))
		return 0

	if(stat || world.time < last_special || restrained() || stunned || lying)
		return 0

	last_special = world.time + 10

	face_atom(A)
	visible_message("\The [src] jumps towards \the [A]!","You jump towards \the [A]!")

	playsound(src,'sound/effects/footstep/jump1.ogg',100)



	var/throw_range = max(get_skill_value(SKILL_HAULING),2)
	if(!throw_range)
		throw_range = 2

	throw_at(A, throw_range, 5)

//	update_middlemode(MIDDLE_SWAP)

	/*
	var/throw_range = 7

	var/skill_mod = 0.2

	skill_mod += 0.8 * (get_skill_value(SKILL_HAULING) - SKILL_MIN)/(SKILL_MAX - SKILL_MIN)
	throw_range *= skill_mod

	//actually throw it!
	src.visible_message("<span class='warning'>[message]</span>", range = min(itemsize*2,world.view))

	throw_at(A, throw_range * skill_mod, 5)
	*/

	return 1