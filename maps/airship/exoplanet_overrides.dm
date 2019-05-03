/obj/effect/overmap/sector/exoplanet
	name = "clearing"

/obj/effect/overmap/sector/exoplanet/chlorine
	name = "chlorinated clearing"
	desc = "Large quantities of liquid chlorine are present in this clearing, thanks to some anomaly."

/obj/effect/overmap/sector/exoplanet/desert
	name = "desert clearing"
	desc = "The veil is very thin here, and the sands are bleached by sunlight. There are rich mineral deposits beneath the earth here."

/obj/effect/overmap/sector/exoplanet/garbage
	name = "ruined clearing"
	desc = "There was once a city here, but then the Veil lowered. Now there is only rubble in the clearing that has opened."

/obj/effect/overmap/sector/exoplanet/grass
	name = "lush clearing"
	desc = "This clearing has miraculously escaped damage - or, perhaps, it has recovered miraculously well."

/obj/effect/overmap/sector/exoplanet/shrouded
	name = "shrouded clearing"
	desc = "The Veil is only just thin enough that a skiff can pass into it. What lies beneath is a stormy, dark clearing."

/obj/effect/overmap/sector/exoplanet/snow
	name = "frozen clearing"
	desc = "The temperatures in this clearing are sub-zero and unsuitable for life - still, something thrives down there."

/obj/effect/overmap/sector/exoplanet/volcanic
	name = "volcanic clearing"
	desc = "A tectonically unstable area with lakes of magma bubbling into the surface beneath a thick Veil. It is exceptionally rich with minerals."

/area/exoplanet
	name = "\improper Exotic Clearing"


/obj/effect/overmap/sector/exoplanet/get_engravings()
	if(!actors.len)
		actors += pick("humanoid","an amorphic blob","a short, hairy being","a rodent-like creature","a robot","a primate","a reptilian being","an unidentifiable object","a statue","an airship","unusual devices","a structure")
		actors += pick("humanoids","amorphic blobs","short, hairy beings","rodent-like creatures","robots","primates","reptilian beings")

	var/engravings = "[actors[1]] \
	[pick("surrounded by","being held aloft by","being struck by","being examined by","communicating with")] \
	[actors[2]]"
	if(prob(50))
		engravings += ", [pick("they seem to be enjoying themselves","they seem extremely angry","they look pensive","they are making gestures of supplication","the scene is one of subtle horror","the scene conveys a sense of desperation","the scene is completely bizarre")]"
	engravings += "."
	return engravings


///generate_planet_name()
//	return "[capitalize(pick(GLOB.last_names))]-[rand(1000,9999)]"
//	return "[capitalize(pick(GLOB.last_names))]-[pick(GLOB.greek_letters)]"

