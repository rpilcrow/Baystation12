///decl/hierarchy/skill
//	default_max = SKILL_MAX          //Makes the skill capped at this value in selection unless overriden at job level.


/decl/hierarchy/skill/medical/medical
	difficulty = SKILL_AVERAGE

/decl/hierarchy/skill/medical/virology
	difficulty = SKILL_AVERAGE


/decl/hierarchy/skill/get_cost(var/level)


	switch(difficulty) //GURPS-style skill values: 1/2/4/8 for Easy, 2/4/8/12 for Avg. 4/8/12/16 for Hard.
		if(SKILL_AVERAGE)
			switch(level)
				if(SKILL_BASIC,SKILL_ADEPT)
					return 2
				if(SKILL_EXPERT,SKILL_PROF)
					return 4
		if(SKILL_HARD)
			if(level > SKILL_NONE)
				return 4
			return 0

		else
			switch(level)
				if(SKILL_BASIC)
					return 1
				if(SKILL_ADEPT)
					return 1
				if(SKILL_EXPERT)
					return 2
				if(SKILL_PROF)
					return 4
	return 0


/*
	switch(level)
		if(SKILL_BASIC, SKILL_ADEPT)
			return difficulty
		if(SKILL_EXPERT, SKILL_PROF)
			return 2*difficulty
		else
			return 0
*/