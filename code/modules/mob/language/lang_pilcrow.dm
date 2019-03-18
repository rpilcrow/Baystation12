/datum/language/shryiiwook
	name = LANGUAGE_WOOKIEE
	desc = "Also known as Wookieespeak, Shryiiwook consists largely of growls and roars, and is the only language most Wookiees can speak."
	speech_verb = "growls"
	ask_verb = "rumbles"
	exclaim_verb = "roars"
	whisper_verb = "mutters"
	colour = "rough"
	key = "w"
	flags = 0
	native = 1
	space_chance = 20
	syllables = list("R","r","RR","rr","L","LL","l","u","U")
	partial_understanding = list(LANGUAGE_VOX = 10,LANGUAGE_ROOTLOCAL = 20,LANGUAGE_ALIUM = 50)
	shorthand = "WK"

/datum/language/alternian
	name = LANGUAGE_TROLL
	desc = "The language of the troll empire, now fading into obscurity. It sounds remarkably similar to certain earth-spoken languages, but feels.. upside down, or backwards."
	colour = "changeling"
	key = "z"
	flags = WHITELISTED
	space_chance = 100
	syllables = list("merol", "muspi", "rolod", "tis", "tema", "rutetcesnoc", "gnicsipida", "tile",
					 "des", "od", "domsuie", "ropmet", "tnudidicin", "tu", "erobal", "te", "erolod",
					 "angam", "auqila", "tu", "mine", "da", "minim", "mainev", "suiq", "durtson",
					 "noitaticrexe", "ocmallu", "sirobal", "nisi", "ut", "aliquip", "ex", "ea", "odommoc",
					 "taquesnoc", "duis", "aute", "irure", "dolor", "in", "tiredenheper", "in",
					 "voluptate", "velit", "esse", "cillum", "dolore", "eu", "taiguf", "nulla",
					 "pariatur", "reutpecxe", "sint", "occaecat", "cupidatat", "non", "proident", "sunt",
					 "in", "alpuc", "qui", "aiciffo", "deserunt", "tillom", "anim", "di", "tse", "murobal")
	partial_understanding = list(LANGUAGE_SOL_COMMON = 22)
	shorthand = "AT"

/datum/language/alternian/get_random_name()
	var/dat = ""
	. = ""
	var/pkx = 0


	for(var/i = 1 to 4)
		pkx = rand(1,5)
		switch(pkx)
			if(1)
				dat += "[pick(GLOB.full_consonant)][pick(GLOB.full_vowel)][pick(GLOB.full_consonant)]"
			if(2)
				dat += "[pick(GLOB.full_vowel)][pick(GLOB.full_consonant)][pick(GLOB.full_vowel)]"
			if(3)
				dat += "[pick(GLOB.full_vowel)][pick(GLOB.full_vowel)][pick(GLOB.full_consonant)]"
			if(4)
				dat += "[pick(GLOB.full_consonant)][pick(GLOB.full_vowel)][pick(GLOB.full_vowel)]"
			if(5)
				dat += "[pick(GLOB.full_vowel)][pick(GLOB.full_consonant)][pick(GLOB.full_consonant)]"
		if(i == 2)
			. += capitalize(dat)
			dat = ""
		if(i == 4)
			. += " [capitalize(dat)]"
			dat = ""
