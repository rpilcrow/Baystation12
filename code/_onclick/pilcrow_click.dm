/mob/living/carbon/human/MiddleClickOn(var/atom/A) //jumping code here
	switch(middlemode)
		if(MIDDLE_SWAP)
			swap_hand()
		if(MIDDLE_JUMP)
			jump_at(A)
	return