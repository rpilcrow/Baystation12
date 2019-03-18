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


/obj/random/pilruinmecha
	name = "random mecha"
	desc = "Spawns a random mecha."
	icon = 'icons/mecha/mecha.dmi'
	icon_state = "durand"

/obj/random/pilruinmecha/spawn_choices()
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

/obj/random/pilruinhorrible
	name = "horrible creature"
	desc = "Spawns something nasty."
	icon = 'icons/mob/pilcrow.dmi'
	icon_state = "randomcreature"

/obj/random/pilruinhorrible/spawn_choices()
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

/obj/random/pilruinspider
	name = "random spider"
	desc = "creepy crawlie!"
	icon = 'icons/mob/pilcrow.dmi'
	icon_state = "randomspider"

/obj/random/pilruinspider/spawn_choices()
	return list(/mob/living/simple_animal/hostile/giant_spider = 15,
				/mob/living/simple_animal/hostile/giant_spider/guard = 10,
				/mob/living/simple_animal/hostile/giant_spider/hunter = 10,
				/mob/living/simple_animal/hostile/giant_spider/nurse = 5,
				/mob/living/simple_animal/hostile/giant_spider/spitter = 10)


/obj/random/pilruinsurgery
	name = "random advanced medical tech"
	desc = "doctors hate him!"
	icon = 'icons/obj/surgery.dmi'
	icon_state = "scalpel_manager_on"

/obj/random/pilruinsurgery/spawn_choices()
	return list(/obj/item/weapon/scalpel/manager = 2,
				/obj/item/weapon/scalpel/laser1 = 1,
				/obj/item/weapon/scalpel/laser2 = 4,
				/obj/item/weapon/scalpel/laser3 = 2)

/obj/random/pilruinpariah
	name = "random pariah"
	desc = "your head asplode"
	icon = 'icons/mob/pilcrow.dmi'
	icon_state = "randompariah2"

/obj/random/pilruinpariah/spawn_choices()
	return list(/mob/living/simple_animal/hostile/psipariah = 4,
				/mob/living/simple_animal/hostile/psipariah/ranged = 2,
				/obj/effect/gibspawner/human = 2,
				/obj/effect/decal/cleanable/blood = 2)

/obj/random/pilruinpariah/guaranteed
	icon_state = "randompariah"

/obj/random/pilruinpariah/spawn_choices()
	return list(/mob/living/simple_animal/hostile/psipariah = 2,
				/mob/living/simple_animal/hostile/psipariah/ranged = 1)

/obj/random/pilruinpmc
	name = "random soldier"
	desc = "tango down"
	icon = 'icons/mob/pilcrow.dmi'
	icon_state = "randompmc"

/obj/random/pilruinpmc/spawn_choices()
	return list(/mob/living/simple_animal/hostile/pmc/ranged/laser = 2,
				/mob/living/simple_animal/hostile/pmc/ranged/ballistic = 1,
				/mob/living/simple_animal/hostile/pmc = 2)

/obj/random/pilruinpmcranged
	name = "random ranged soldier"
	desc = "lasers vs ballistics"
	icon = 'icons/mob/pilcrow.dmi'
	icon_state = "randompmc2"

/obj/random/pilruinpmcranged/spawn_choices()
	return list(/mob/living/simple_animal/hostile/pmc/ranged/laser = 1,
				/mob/living/simple_animal/hostile/pmc/ranged/ballistic = 1)




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
