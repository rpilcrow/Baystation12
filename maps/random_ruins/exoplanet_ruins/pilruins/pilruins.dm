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
	id = "pruins-wh"
	suffixes = list("pilruins/witchhouse.dmm")

/datum/map_template/ruin/exoplanet/pilruins/cannibal
	name = "canibal building"
	id = "pruins-cb"
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



//BROKEN RUINS////////////////////////

/datum/map_template/ruin/exoplanet/pilruins/broken
	name = "broken building 1"
	id = "pruins-b1"
	suffixes = list("pilruins/broken1.dmm")
	cost = 0.5
	template_flags = TEMPLATE_FLAG_CLEAR_CONTENTS | TEMPLATE_FLAG_NO_RUINS// | TEMPLATE_FLAG_ALLOW_DUPLICATES

/datum/map_template/ruin/exoplanet/pilruins/broken/semi
	name = "broken building 2"
	id = "pruins-b2"
	suffixes = list("pilruins/broken2.dmm")

/datum/map_template/ruin/exoplanet/pilruins/broken/some
	name = "broken building 3"
	id = "pruins-b3"
	suffixes = list("pilruins/broken3.dmm")

/datum/map_template/ruin/exoplanet/pilruins/broken/kinda
	name = "broken building 4"
	id = "pruins-b4"
	suffixes = list("pilruins/broken4.dmm")



//SHIPS AND SHUTTLES//////////////////

/datum/map_template/ruin/exoplanet/pilruins/mercship
	name = "wrecked merc ship"
	id = "pruins=wm"
	suffixes = list("pilruins/mercship.dmm")
	cost = 1.5

/datum/map_template/ruin/exoplanet/pilruins/spidershuttle
	name = "spider shuttle"
	id = "pruins-ss"
	suffixes = list("pilruins/spidershuttle.dmm")
	cost = 1.5



//OTHER STUFF/////////////////////////

/datum/map_template/ruin/exoplanet/pilruins/tribalgun
	name = "tribal egun"
	id = "pruins-te"
	suffixes = list("pilruins/tribalegun.dmm")
	cost = 0.5
	template_flags = TEMPLATE_FLAG_CLEAR_CONTENTS | TEMPLATE_FLAG_NO_RUINS// | TEMPLATE_FLAG_ALLOW_DUPLICATES

/datum/map_template/ruin/exoplanet/pilruins/sarcophagus
	name = "mecha sarcophagus"
	id = "pruins-ms"
	suffixes = list("pilruins/sarcophagus.dmm")
	cost = 1



//AREAS///////////////////////////////

/area/map_template/aquarium
	name = "\improper Aquarium Outpost"
	icon_state = "blue"

/area/map_template/aquarium/deadly
	name = "\improper Aquarium Outpost"
	icon_state = "blue"



//OBJECTS/////////////////////////////

/obj/structure/pilruin/light
	name = "glow panel"
	desc = "It glows brightly."
	density = 0
	anchored = 1
	icon = 'maps/random_ruins/exoplanet_ruins/pilruins/pil.dmi'
	icon_state = "blue"
	layer = 2.1

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
	icon = 'icons/mob/critter.dmi'
	icon_state = "otherthing-dead"

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
	icon = 'icons/mob/spider.dmi'
	icon_state = "green"

/obj/random/pilruinspider/spawn_choices()
	return list(/mob/living/simple_animal/hostile/giant_spider = 15,
				/mob/living/simple_animal/hostile/giant_spider/guard = 10,
				/mob/living/simple_animal/hostile/giant_spider/hunter = 10,
				/mob/living/simple_animal/hostile/giant_spider/nurse = 5,
				/mob/living/simple_animal/hostile/giant_spider/spitter = 10)
