/datum/map_template/ruin/exoplanet/pilruins
	name = "settle ruins 1"
	id = "pruins"
	description = "Ruins of a small settled area."
	suffixes = list("pilruins/pilruins.dmm")
	cost = 1
	template_flags = TEMPLATE_FLAG_CLEAR_CONTENTS | TEMPLATE_FLAG_NO_RUINS



//BUILDINGS///////////////////////////

/datum/map_template/ruin/exoplanet/pilruins/witchhouse
	name = "witch house"
	id = "pruins-wih"
	suffixes = list("pilruins/witchhouse.dmm")

/datum/map_template/ruin/exoplanet/pilruins/cannibal
	name = "canibal building"
	id = "pruins-cab"
	suffixes = list("pilruins/cannibal.dmm")

/datum/map_template/ruin/exoplanet/pilruins/aquarium
	name = "aquarium outpost 1"
	id = "pruins-ao1"
	suffixes = list("pilruins/aquarium.dmm")
	template_flags = TEMPLATE_FLAG_CLEAR_CONTENTS | TEMPLATE_FLAG_NO_RUINS | TEMPLATE_FLAG_NO_RADS

/datum/map_template/ruin/exoplanet/pilruins/aquarium/deadly
	name = "aquarium outpost 2"
	id = "pruins-ao2"
	suffixes = list("pilruins/daquarium.dmm")

/datum/map_template/ruin/exoplanet/pilruins/kovelai
	name = "kovelai building"
	id = "pruins-kov"
	suffixes = list("pilruins/foundation.dmm")
	cost = 2

/datum/map_template/ruin/exoplanet/pilruins/storefront
	name = "storefront"
	id = "pruins-sfr"
	suffixes = list("pilruins/storefront.dmm")
	template_flags = TEMPLATE_FLAG_CLEAR_CONTENTS | TEMPLATE_FLAG_NO_RUINS | TEMPLATE_FLAG_NO_RADS

/datum/map_template/ruin/exoplanet/pilruins/gasstation
	name = "gas station"
	id = "pruins-gst"
	suffixes = list("pilruins/gasstation.dmm")
	template_flags = TEMPLATE_FLAG_CLEAR_CONTENTS | TEMPLATE_FLAG_NO_RUINS | TEMPLATE_FLAG_NO_RADS

/datum/map_template/ruin/exoplanet/pilruins/pmccamp
	name = "pmc camp"
	id = "pruins-pmc"
	suffixes = list("pilruins/camppmc.dmm")
	template_flags = TEMPLATE_FLAG_CLEAR_CONTENTS | TEMPLATE_FLAG_NO_RUINS | TEMPLATE_FLAG_NO_RADS



//BROKEN RUINS////////////////////////

/datum/map_template/ruin/exoplanet/pilruins/broken
	name = "broken building 1"
	id = "pruins-br1"
	suffixes = list("pilruins/broken1.dmm")
	cost = 0.5
	template_flags = TEMPLATE_FLAG_CLEAR_CONTENTS | TEMPLATE_FLAG_NO_RUINS// | TEMPLATE_FLAG_ALLOW_DUPLICATES

/datum/map_template/ruin/exoplanet/pilruins/broken/semi
	name = "broken building 2"
	id = "pruins-br2"
	suffixes = list("pilruins/broken2.dmm")

/datum/map_template/ruin/exoplanet/pilruins/broken/some
	name = "broken building 3"
	id = "pruins-br3"
	suffixes = list("pilruins/broken3.dmm")

/datum/map_template/ruin/exoplanet/pilruins/broken/kinda
	name = "broken building 4"
	id = "pruins-br4"
	suffixes = list("pilruins/broken4.dmm")



//SHIPS AND SHUTTLES//////////////////

/datum/map_template/ruin/exoplanet/pilruins/mercship
	name = "wrecked merc ship"
	id = "pruins=wrm"
	suffixes = list("pilruins/mercship.dmm")
	cost = 1.5

/datum/map_template/ruin/exoplanet/pilruins/spidershuttle
	name = "spider shuttle"
	id = "pruins-sps"
	suffixes = list("pilruins/spidershuttle.dmm")
	cost = 1.5



//OTHER STUFF/////////////////////////

/datum/map_template/ruin/exoplanet/pilruins/tribalgun
	name = "tribal egun"
	id = "pruins-tre"
	suffixes = list("pilruins/tribalegun.dmm")
	cost = 0.5
	template_flags = TEMPLATE_FLAG_CLEAR_CONTENTS | TEMPLATE_FLAG_NO_RUINS// | TEMPLATE_FLAG_ALLOW_DUPLICATES

/datum/map_template/ruin/exoplanet/pilruins/sarcophagus
	name = "mecha sarcophagus"
	id = "pruins-mes"
	suffixes = list("pilruins/sarcophagus.dmm")
	cost = 1

/datum/map_template/ruin/exoplanet/pilruins/oubliette
	name = "oubliette"
	id = "pruins-oub"
	suffixes = list("pilruins/oubliette.dmm")
	cost = 0.5

/datum/map_template/ruin/exoplanet/pilruins/testing
	name = "catwalk testing"
	id = "pruins-cat"
	suffixes = list("pilruins/cattest.dmm")
	cost = 1
	template_flags = TEMPLATE_FLAG_CLEAR_CONTENTS | TEMPLATE_FLAG_NO_RUINS | TEMPLATE_FLAG_ALLOW_DUPLICATES



//AREAS///////////////////////////////

/area/map_template/aquarium
	name = "\improper Aquarium Outpost"
	icon_state = "blue"

/area/map_template/aquarium/deadly
	name = "\improper Aquarium Outpost"
	icon_state = "blue"

/area/map_template/kovelai/outer
	name = "\improper Foundation Outer Outpost"
	icon_state = "dk_yellow"

/area/map_template/kovelai/inner
	name = "\improper Foundation Inner Outpost"
	icon_state = "purple"

/area/map_template/sealedcamp
	name = "\improper Encampment"
	icon_state = "purple"

/area/map_template/storefront
	name = "\improper Storefront"
	icon_state = "purple"

/area/map_template/gasstation
	name = "\improper Refueling Station"
	icon_state = "purple"



//OBJECTS/////////////////////////////

/obj/structure/pilruin/light
	name = "glow panel"
	desc = "It glows brightly."
	density = 0
	anchored = 1
	icon = 'maps/random_ruins/exoplanet_ruins/pilruins/pil.dmi'
	icon_state = "blue"
	layer = 0.9

/obj/structure/pilruin/light/New()
	..()
	set_light(0.75, 1, 4)

/obj/random/pilruin
	name = "don't use this"
	desc = "wtf don't use this."
	icon = 'icons/effects/effects_pilcrow.dmi'
	icon_state = "pilcrow"

/obj/random/pilruin/mecha/spawn_choices()
	world.log << "LISTEN UP FUCKO, YOU'VE PUT DOWN A /obj/random/pilruin SOMEHOW, AT [x], [y], [z]. WE'RE JUST GOING TO GUESS AT WHAT YOU WANTED INSTEAD. YEE HAW."
	return typesof(/obj/random/pilruin)

/obj/random/pilruin/mecha
	name = "random mecha"
	desc = "Spawns a random mecha."
	icon_state = "mecha"

/obj/random/pilruin/mecha/spawn_choices()
	return list(/obj/mecha/combat/durand = 10,
				/obj/mecha/combat/gygax = 10,
				/obj/mecha/medical/odysseus/loaded = 10,
				/obj/mecha/working/hoverpod = 6,
				/obj/mecha/working/hoverpod/combatpod = 4,
				/obj/mecha/working/ripley = 4,
				/obj/mecha/working/ripley/firefighter = 3,
				/obj/mecha/working/ripley/mining = 3,
				/obj/mecha/combat/marauder = 2,
				/obj/mecha/combat/phazon = 1)

/obj/random/pilruin/horrible
	name = "horrible creature"
	desc = "Spawns something nasty."
	icon_state = "randomcreature"

/obj/random/pilruin/horrible/spawn_choices()
	return list(/mob/living/simple_animal/hostile/creature = 15,
				/mob/living/simple_animal/hostile/giant_spider = 5,
				/mob/living/simple_animal/hostile/giant_spider/guard = 5,
				/mob/living/simple_animal/hostile/giant_spider/hunter = 5,
				/mob/living/simple_animal/hostile/carp = 12,
				/mob/living/simple_animal/hostile/carp/pike = 3,
				/mob/living/simple_animal/hostile/retaliate/malf_drone = 5,
				/mob/living/simple_animal/hostile/bear = 2,
				/mob/living/simple_animal/crab/stowaway = 1,
				/mob/living/simple_animal/cat = 1)

/obj/random/pilruin/spider
	name = "random spider"
	desc = "creepy crawlie!"
	icon_state = "randomspider"

/obj/random/pilruin/spider/spawn_choices()
	return list(/mob/living/simple_animal/hostile/giant_spider = 15,
				/mob/living/simple_animal/hostile/giant_spider/guard = 10,
				/mob/living/simple_animal/hostile/giant_spider/hunter = 10,
				/mob/living/simple_animal/hostile/giant_spider/nurse = 5,
				/mob/living/simple_animal/hostile/giant_spider/spitter = 10)


/obj/random/pilruin/surgery
	name = "random advanced medical tech"
	desc = "doctors hate him!"
	icon_state = "surgery"

/obj/random/pilruin/surgery/spawn_choices()
	return list(/obj/item/weapon/scalpel/manager = 2,
				/obj/item/weapon/scalpel/laser1 = 1,
				/obj/item/weapon/scalpel/laser2 = 4,
				/obj/item/weapon/scalpel/laser3 = 2)

/obj/random/pilruin/pariah
	name = "random pariah"
	desc = "your head asplode"
	icon_state = "randompariah2"

/obj/random/pilruin/pariah/spawn_choices()
	return list(/mob/living/simple_animal/hostile/psipariah = 4,
				/mob/living/simple_animal/hostile/psipariah/ranged = 2,
				/obj/effect/gibspawner/human = 2,
				/obj/effect/decal/cleanable/blood = 2)

/obj/random/pilruin/pariah/guaranteed
	icon_state = "randompariah"

/obj/random/pilruin/pariah/spawn_choices()
	return list(/mob/living/simple_animal/hostile/psipariah = 2,
				/mob/living/simple_animal/hostile/psipariah/ranged = 1)

/obj/random/pilruin/pmc
	name = "random soldier"
	desc = "tango down"
	icon_state = "randompmc"

/obj/random/pilruin/pmc/spawn_choices()
	return list(/mob/living/simple_animal/hostile/pmc/ranged/laser = 2,
				/mob/living/simple_animal/hostile/pmc/ranged/ballistic = 1,
				/mob/living/simple_animal/hostile/pmc = 2)

/obj/random/pilruin/pmcranged
	name = "random ranged soldier"
	desc = "lasers vs ballistics"
	icon_state = "randompmc2"

/obj/random/pilruin/pmcranged/spawn_choices()
	return list(/mob/living/simple_animal/hostile/pmc/ranged/laser = 1,
				/mob/living/simple_animal/hostile/pmc/ranged/ballistic = 1)

/obj/random/pilruin/melee
	name = "random melee weapon"
	desc = "drive me closer, so that i can hit them with my sword"
	icon_state = "melee"
/obj/random/pilruin/melee/spawn_choices()
	return list(/obj/item/weapon/material/sword/longsword = 2,
				/obj/item/weapon/material/sword/longsword/silver = 2,
				/obj/item/weapon/material/sword/longsword/titanium = 2,
				/obj/item/weapon/material/sword/replica/officersword/pilcustom = 6,
				/obj/item/weapon/cane/concealed/sword = 6,
				/obj/item/weapon/material/hatchet/machete = 6,
				/obj/item/weapon/melee/baton/loaded = 4,
				/obj/item/weapon/melee/baton = 2,
				/obj/item/weapon/melee/classic_baton = 2,
				/obj/item/weapon/melee/telebaton = 4,
				/obj/item/weapon/material/butterfly = 4,
				/obj/item/weapon/material/butterfly/switchblade = 2,
				/obj/item/weapon/material/scythe = 6,
				/obj/item/weapon/material/hatchet = 6,
				/obj/item/weapon/material/harpoon = 5,
				/obj/item/weapon/material/harpoon/bomb = 1,
				/obj/item/weapon/material/knife = 2,
				/obj/item/weapon/material/knife/butch = 3,
				/obj/item/weapon/material/knife/hook = 1,
				/obj/item/weapon/material/twohanded/baseballbat = 1,
				/obj/item/weapon/material/twohanded/baseballbat/metal = 1,
				/obj/item/weapon/material/twohanded/baseballbat/platinum = 1,
				/obj/item/weapon/material/twohanded/baseballbat/uranium = 1,
				/obj/item/weapon/material/twohanded/baseballbat/gold = 1,
				/obj/item/weapon/material/twohanded/baseballbat/diamond = 1,
				/obj/item/weapon/material/twohanded/fireaxe = 6,
				/obj/item/weapon/material/twohanded/spear = 6,
				/obj/item/weapon/pickaxe/jackhammer = 3,
				/obj/item/weapon/pickaxe/diamond = 2,
				/obj/item/weapon/shovel = 1,
				/obj/item/toy/cultsword = 1,
				/obj/item/toy/balloon = 1,
				/obj/item/weapon/nullrod = 1,
				/obj/item/weapon/material/sword/blazing = 1,
				/obj/item/weapon/material/sword/katana = 1,
				/obj/item/weapon/circular_saw = 1,
				/obj/item/weapon/surgicaldrill = 1,
				/obj/item/weapon/melee/energy/sword = 1)

/obj/random/pilruin/weapon
	name = "random weapon"
	desc = "time for armanents"
	icon_state = "weapon"
/obj/random/pilruin/weapon/spawn_choices()
	return list(/obj/random/pilruin/melee,
				/obj/random/projectile,
				/obj/random/energy)

/obj/random/pilruin/gun
	name = "random gun"
	desc = "shall not be infringed"
	icon_state = "randomguns"
/obj/random/pilruin/gun/spawn_choices()
	return list(/obj/random/projectile,
				/obj/random/energy)

/obj/random/pilruin/wildloot
	name = "wild loot"
	desc = "it could be anything"
	icon_state = "wild"
/obj/random/pilruin/wildloot/spawn_choices()
	return list(/obj/random/pilruin/weapon = 1,
				/obj/random/maintenance/clean = 1,
				/obj/random/loot = 4)

//ITEMS///////////////////////////////

/obj/item/documents/pilruin/experiments
	name = "foundation documents"
	desc = "Classified documents detailing a number of unethical experiments performed upon small groups of people taken from various points in the galaxy. The majority of the experiments seem to be marked 'FAILURE'."
	description_antag = "Some of the experiments listed are pretty brutal. Notably, the few marked 'SUCCESS' have no procedure described beyond 'Kovelai Machine'."
//	icon_state = "docs_verified"
	icon_state = "docs_red"
//	icon_state = "docs_blue"

/obj/item/documents/pilruin/machine
	name = "foundation documents"
	desc = "Heavily redacted documents detailing the function of a 'Kovelai Machine' and its purpose."
	description_antag = "From what little you can gather, the machine is designed to activate 'previously locked' mental functions through excessive trauma to both body and mind."
	icon_state = "docs_generic"

/obj/item/documents/pilruin/research
	name = "foundation documents"
	desc = "Medical documents detailing the results of what appear to be an autopsy, featuring many diagrams and some photographs of a brain."
	description_antag = "It goes into quite some detail on several alterations that have been somehow made to the brain, as well as damage incurred by an unknown source."
	icon_state = "docs_generic"

/obj/item/documents/pilruin/containment
	name = "foundation documents"
	desc = "This document appears to describe containment procedures for subjects that have been exposed to the 'Kovelai Machine' including confinement to an isolated cell."
	description_antag = "'Nullglass' is a material used almost to excess in the document, and special attention is paid to containing 'Paramount' subjects."
	icon_state = "docs_blue"


/obj/item/documents/pilruin/spy
	name = "classified documents"
	desc = "A folder of documents, photos, and transcripts taken from a spy sattelite."
	description_antag = ""
	icon_state = "docs_generic"

/obj/item/documents/pilruin/spy/Initialize()
	. = ..()
	description_antag = "These appear to pertain to the [pick("FT","NS","NA","ND","VM","PL","PI")][pick("B","V","S")] [pick("Vigil","Focus","Skycannon","Calhoun","Freeman","Shepherd","Hyperspeed Scream")] in the [pick("remote","nearby","distant","allegedly unexplored")] [pick("Vi","Luthien","Teni","Antares","Elwyn")] system. \
	<br>The documents mostly detail crew activities, security vulnerabilities, new discoveries, and command heirarchy. [pick("Its purpose doesn't seem to be clear.","It looks like a lot of shady things are happening there.","It looks largely civilian.","A number of targets have been marked on the maps.")]"

/obj/item/documents/pilruin/unethical
	name = "experiment notes"
	desc = "Detailed logs on a series of medical experiments performed in a small facility."
	description_antag = "Most of these experiments seem to have involved inflicting massive trauma to the brain in various disturbing but calculated and precise ways. None of them are listed as successful in any capacity."
	icon_state = "docs_generic"

/obj/item/documents/pilruin/security
	name = "classified documents"
	desc = "A set of documents detailing security procedures, partrol routes, and sleeping shifts, as well as standing orders to shoot anybody and anything who comes into sight and doesn't register on IFF as approved."
	description_antag = ""
	icon_state = "docs_generic"

/obj/item/documents/pilruin/security/Initialize()
	. = ..()
	description_antag = "The documents appear to belong to a PMC called [pick("Star","Astral","Black","Steel","Silver","White")][pick(" Raven","raven"," Crow","crow"," Beak","beak", " Guard","guard", " Watch", "watch")][pick(" Security"," Security"," Ops"," Solutions"," Security Solutions",null)]."
