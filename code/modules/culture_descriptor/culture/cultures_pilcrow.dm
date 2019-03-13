/*
#define CULTURE_TROLL_RUST     "Rustblood"
#define CULTURE_TROLL_ORANGE   "Orangeblood"
#define CULTURE_TROLL_GOLD     "Goldblood"
#define CULTURE_TROLL_LIME     "Limeblood"
#define CULTURE_TROLL_OLIVE    "Oliveblood"
#define CULTURE_TROLL_JADE     "Jadeblood"
#define CULTURE_TROLL_TEAL     "Tealblood"
#define CULTURE_TROLL_CERULEAN "Ceruleanblood"
#define CULTURE_TROLL_INDIGO   "Blueblood
#define CULTURE_TROLL_PURPLE   "Purpleblood"
#define CULTURE_TROLL_VIOLET   "Violetblood"
#define CULTURE_TROLL_FUCHSIA  "Royalblood"

#define COLOR_BLOOD_RUST       "#a10808"
#define COLOR_BLOOD_ORANGE     "#a25203"
#define COLOR_BLOOD_GOLD       "#a1a100"
#define COLOR_BLOOD_OLIVE      "#416600"
#define COLOR_BLOOD_JADE       "#078446"
#define COLOR_BLOOD_TEAL       "#008282"
#define COLOR_BLOOD_CERULEAN   "#004182"
#define COLOR_BLOOD_INDIGO     "#001583"
#define COLOR_BLOOD_PURPLE     "#440a7f"
#define COLOR_BLOOD_VIOLET     "#6a006a"
#define COLOR_BLOOD_FUCHSIA    "#99004d"
#define COLOR_BLOOD_LIME       "#859100"
*/



/decl/cultural_info/culture/troll
	name = CULTURE_TROLL_RUST
	description = "You are a lowblooded troll of rust blood. In the empire, the only ones lower on the pecking order were the \
	literal mutants who wouldn't otherwise fit into the strict caste system that held you down. It wasn't all bad, however, as \
	your blood makes you more receptive to psionic powers; in particular, receiving them."
	var/bloodcaste = COLOR_BLOOD_RUST
	var/psichance = 66
	var/psipower = 2
	var/list/psitypes = list(PSI_COERCION,PSI_PSYCHOKINESIS)
	economic_power = 0.5
	hidden_from_codex = TRUE


/decl/cultural_info/culture/troll/orange
	name = CULTURE_TROLL_ORANGE
	description = "You are a lowblooded troll of orange blood. In the empire, you were likely a lower-class worker, hunter, or soldier \
	and would not be afforded many privileges. You were still, however, above even the rust- and mutant-bloods. \
	Your blood makes you more receptive to psionic powers."
	bloodcaste = COLOR_BLOOD_ORANGE
	economic_power = 0.6
	psichance = 44
	psipower = 2

/decl/cultural_info/culture/troll/gold
	name = CULTURE_TROLL_GOLD
	description = "You are a lowblooded troll of gold blood. Due to the goldbloods' unusual psionic affinity, you were likely to end up \
	rounded up and used as a 'helmsman' for one of the empire's ships, a living battery who would psionically propel the starship through \
	the cosmos. Fortunately for you, with the empire's collapse, that is no longer quite such a danger."
	bloodcaste = COLOR_BLOOD_GOLD
	economic_power = 0.7
	psichance = 88
	psipower = 2
	psitypes = list(PSI_ENERGISTICS)

/decl/cultural_info/culture/troll/lime
	name = CULTURE_TROLL_LIME
	description = "As a limeblood, you are a rarity; the limebloods were viciously exterminated en-masse by the empire and it would be \
	a miracle for you to even be alive. Whatever circumstances lead to your continued existence are extraordinary and unusual."
	bloodcaste = COLOR_BLOOD_LIME
	economic_power = 0.1
	psichance = 100
	psipower = 5

/decl/cultural_info/culture/troll/olive
	name = CULTURE_TROLL_OLIVE
	description = "You are a lowblooded troll of olive blood, and were just bordering middle-class in the empire. Whatever your circumstances, \
	you had it better than some, but still worse than others."
	bloodcaste = COLOR_BLOOD_OLIVE
	economic_power = 0.8
	psichance = 22
	psipower = 1


/decl/cultural_info/culture/troll/jade
	name = CULTURE_TROLL_JADE
	description = "As a jadeblooded troll, you are in a unique position; the jadebloods were a unique class in the empire and were kept in charge \
	of ensuring the species' continued existence by tending to the mother grub and the caverns it lived in. Additionally, the jadebloods are the few \
	who could bear the light of alternia's sun, allowing them the privilege of walking upon the surface during the day."
	bloodcaste = COLOR_BLOOD_JADE
	economic_power = 1
	psichance = 15
	psipower = 1
	psitypes = list(PSI_REDACTION)

/decl/cultural_info/culture/troll/teal
	name = CULTURE_TROLL_TEAL
	description = "As a tealblooded troll, you were likely some form of administrator, lawyer, or otherwise in a management position in the empire, although \
	there were likely many other opportunities available to you. At the bottom border of the literal blueblood class, you were afforded privileges that many \
	others were not. Unfortunately, as blood shifts into blue it moves away from psionic power, and you likely have no powers to speak of. If any, they are \
	subtle and largely psychological in effect."
	bloodcaste = COLOR_BLOOD_TEAL
	economic_power = 1
	psichance = 5
	psipower = 1
	psitypes = list(PSI_COERCION)

/decl/cultural_info/culture/troll/cerulean
	name = CULTURE_TROLL_CERULEAN
	description = "Ceruleanbloods lived a comfortable existence in the empire, disregarding the constant backstabbing and intrigue. Solidly in the upper class, \
	ceruleanbloods were amongst those given the larger houses and better positions. Unfortuantely, while you had social standing and clout, you were unlikely \
	to have psionic power, or any unusual abilities at all."
	bloodcaste = COLOR_BLOOD_CERULEAN
	economic_power = 1.3
	psichance = 3
	psipower = 1
	psitypes = list(PSI_COERCION)

/decl/cultural_info/culture/troll/indigo
	name = CULTURE_TROLL_INDIGO
	description = "As an indigoblooded troll, you represented the highest caste you could be born into before reaching the purplebloods and seadwellers, and on land \
	had the potential to command the most social power, if you could stand the constant intrigue and betrayal. You likely lost a lot after the collapse of the empire \
	and unlike the lowbloods you don't have even an ounce of psionic power to show for it."
	bloodcaste = COLOR_BLOOD_INDIGO
	economic_power = 1.4
	psichance = 1
	psipower = 1
	psitypes = list(PSI_COERCION)

/decl/cultural_info/culture/troll/purple
	name = CULTURE_TROLL_PURPLE
	description = "The purplebloods were an unusual caste in the empire, largely used by the seadwellers to subjugate the lower-blooded castes and to ensure that the \
	'hemospectrum' continued to function. Unlike the blueblooded castes, the purplebloods were not necessarily upper class but still commanded large amounts of power. \
	The oldest of the purplebloods could end up recruited by the empress herself to do her bidding, and were often exceptionally brutal assassins, executioners, and \
	soldiers."
	bloodcaste = COLOR_BLOOD_PURPLE
	economic_power = 1
	psichance = 100
	psipower = 5
	psitypes = list(PSI_COERCION)

/decl/cultural_info/culture/troll/violet
	name = CULTURE_TROLL_VIOLET
	description = "You were royalty, one step away from the highest point on the hemospectrum, and then it all collapsed beneath you. As a seadweller you have the ability \
	to breathe water and an exceptionally long lifespan, although psionics have remained entirely out of your grasp until very recently, with recent developments in psionic \
	technology and understanding giving you some degree of promise. Regardless, in the empire you likely lived beneath the waves, managing a massive corporation populated by \
	the lowbloods, commanding vast amounts of wealth and power. These days, all you have is your money, if that."
	bloodcaste = COLOR_BLOOD_VIOLET
	economic_power = 1.5
	psichance = 0
	psipower = 0
	psitypes = list(PSI_COERCION)

/decl/cultural_info/culture/troll/fuchsia
	name = CULTURE_TROLL_FUCHSIA
	description = "At the very peak of the hemospectrum sat the fuchsiabloods, the potential emperors and empresses who could influence troll society as a whole through their \
	edicts and commands - IF they rose to power. Throughout history, the fuchsiablooded caste has been more perilous than even the position of a mutantblood, as the most bloodthirsty \
	empresses and emperors have secured their position firmly by executing any potential upstart they can find. Regardless, you managed to persevere, and the \
	collapse of the empire has extended your potential lifespan - by many millenia."
	bloodcaste = COLOR_BLOOD_FUCHSIA
	economic_power = 2
	psichance = 0
	psipower = 0
	psitypes = list(PSI_COERCION)


//	language = LANGUAGE_GALCOM
//	default_language = LANGUAGE_GALCOM
