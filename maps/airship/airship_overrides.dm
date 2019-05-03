world
	turf = /turf/space/air

/datum/controller/subsystem/skybox //hoo boy
	BGcolor = COLOR_WHITE
	BGpath = 'icons/turf/skybox_air.dmi'
	BGstate = "sky"
	use_stars = TRUE
	star_path = 'icons/turf/skybox.dmi'
	star_state = "stars"

/area/has_gravity()
	return 1

/area/space/has_gravity()
	return 1

has_gravity(atom/AT, turf/T)
	return 1

/area/space
	name = "\improper Sky"
	has_gravity = 1
	base_turf = /turf/space/air



/mob/check_solid_ground()
	if(!lastarea)
		lastarea = get_area(src)
	if(!lastarea || !lastarea.has_gravity)
		return 0

	return 1

/turf/space/air
//	plane = SPACE_PLANE
//	icon = 'icons/turf/space.dmi'

	name = "sky"
	desc = "Clouds stretch for miles upon miles; a white blanket beneath which rages an endless storm. Don't fall."
	icon_state = "map"
//	dynamic_lighting = 0
//	thermal_conductivity = OPEN_HEAT_TRANSFER_COEFFICIENT
//	var/static/list/dust_cache
//	initial_gas = list("gas = " (MOLES_CELLSTANDARD*1))
//	initial_gas = list("carbon_monoxide" = MOLES_CELLSTANDARD*0.05,"carbon_dioxide" = MOLES_CELLSTANDARD*0.20, "oxygen" = MOLES_CELLSTANDARD*0.4, "nitrogen" = MOLES_CELLSTANDARD*0.35)
//	initial_gas = list("oxygen" = MOLES_O2STANDARD, "nitrogen" = MOLES_N2STANDARD) //TODO: slightly hazardous atmosphere?
	initial_gas = list("oxygen" = MOLES_O2STANDARD*0.75, "nitrogen" = MOLES_N2STANDARD*0.75)
	temperature = T0C	//T20C

	/*
	potential atmospheres:

	//livable: perfectly ordinary
	//nitrogen only: vox enjoy this
	//nitrous oxide: eh
	//phoron: no
	//carbon + nitrogen: smoky. vox also enjoy this
	//low oxygen (1-10%): allows for 'farming' oxy from the atmos, but outside is still bad for breathing

	*/

/turf/simulated/floor/shuttle_ceiling/sky
	initial_gas = list("oxygen" = MOLES_O2STANDARD, "nitrogen" = MOLES_N2STANDARD)
	temperature = T0C-40//T20C
	icon_state = "ridged"
	color = COLOR_HULL


/turf/space/air/CanZPass(atom/A, direction)
	if(locate(/obj/structure/catwalk, src))
		if(z == A.z)
			if(direction == DOWN)
				return 0
		else if(direction == UP)
			return 0
	return 1

/turf/space/air/proc/skyfall_checks(var/atom/movable/mover) //this was very briefly just called 'obliterate' and contained just the part after mover.can_fall()
	if(QDELETED(mover))
		return FALSE

	var/area/area = get_area(src)
	if(!area.has_gravity())
		return FALSE
	if(mover.throwing)
		return FALSE

	if(mover.can_fall())
		if(GetBelow(src))
			mover.fall()
			visible_message("<span class='warning'>\The [mover] falls into \the [src]!</span>")
			return TRUE
		else
			if(mover.can_fall())
				spawn(0)
					if(QDELETED(mover))
						return FALSE
					//for(var/atom/A in recursive_content_check(mover, sight_check = FALSE, include_mobs = FALSE)) //stops a ton of Entered() checks, and we're obliterating mover anyhow.
					//	qdel(A)
					mover.visible_message("<span class='danger'>\The [mover] falls into \the [src] and disappears!</span>","<span class='danger'>You fall into \the [src], never to be seen again.</span>")
					log_debug("[mover] fell into \the [src] at [x], [y], [z]")
					//world.log << "[mover] fell into \the [src] at [x], [y], [z]"
					qdel(mover)
					return 2
	return FALSE



/turf/space/air/Entered(var/atom/movable/mover)
	..()
	skyfall_checks(mover)

// Called when thrown object lands on this turf.
/turf/space/air/hitby(var/atom/movable/AM, var/speed)
	. = ..()
	skyfall_checks(AM)


/turf/space/air/examine(mob/user, distance, infix, suffix)
	if(..(user, 2))
		var/depth = 1
		for(var/T = GetBelow(src); istype(T,/turf/space); T = GetBelow(T))
			depth += 1
		to_chat(user, "It is about [depth] level\s deep.")


/turf/space/air/Initialize(mapload)
	. = ..()
	if(!mapload)
		if(z in GLOB.using_map.station_levels)
			if(locate(/obj) in contents)
				world << "found stuff in me at [x], [y], [z]"
				return .
			var/turf/T = GetAbove(src)
			if(istype(T,/turf/simulated/open))
				if(locate(/obj) in T.contents)
					world << "found stuff in above at [x], [y], [T.z]"
					return .
				T.ChangeTurf(/turf/space/air)
		for(var/atom/movable/lighting_overlay/LO in contents)
			overlays -= LO
			LO.loc = null
			qdel(LO)


/turf/space/air/update_starlight()
	. = ..()
//	if(lighting_overlay)
//		lighting_clear_overlay()

/turf/simulated/proc/update_starlight()
	if(z in GLOB.using_map.station_levels)
		var/turf/T = GetAbove(src)
		if(T)
			if(istype(T,/turf/space))
				T.ChangeTurf(/turf/simulated/open)
		else
			if(config.starlight)
				set_light(min(0.1*config.starlight, 1), 1, 3, l_color = SSskybox.BGcolor)

/turf/simulated/Initialize() //open up spaces above all floor/walls, so we can shine light down OR just have an open-air airship. also works automatically when building.
	..()
	update_starlight()

/obj/structure/catwalk/Initialize()
	. = ..()
	if(z in GLOB.using_map.station_levels)
		var/turf/T = GetAbove(src)
		if(istype(T,/turf/space))
			T.ChangeTurf(/turf/simulated/open)

/turf/simulated/floor/levelupdate()
	. = ..()
	if(!HasAbove(z))
		update_starlight()


/*
/turf/simulated/open

/turf/simulated/open/Initialize()
	. = ..()
	update_starlight()

/turf/simulated/open/proc/update_starlight()
	if(!config.starlight)
		return
	if(HasAbove(z))
		return
	set_light(min(0.1*config.starlight, 1), 1, 3, l_color = SSskybox.BGcolor)
*/
//	var/turf/X = src
//	var/turf/T
	/*
	for(var/i = 1 to world.maxz)
		T = GetBelow(X)
//		if(istype(T,/turf/space))
//			break
		if(istype(T,/turf/simulated/open))
			X = T
			continue
		else
			world.log << "found something"
			set_light(min(0.1*config.starlight, 1), 1, 3, l_color = SSskybox.BGcolor)
			return 1
	*/
//	set_light(0)

/obj/effect/overmap_event
	icon = 'icons/obj/overmap_pilcrow.dmi'

/obj/effect/overmap
	icon = 'icons/obj/overmap_pilcrow.dmi'

/datum/overmap_event/meteor
	name = "debris field"
	events = list(/datum/event/meteor_wave/overmap)
	count = 7

/datum/overmap_event/dust
	name = "dust cloud"
	events = list(/datum/event/dust)
	count = 7


/obj/effect/paint/airshiphull
	color = COLOR_DARK_GUNMETAL

/obj/effect/paint/shuttlehull
	color = COLOR_HULL



/datum/computer_file/program/merchant //wild capitalism
	required_access = null

/turf/simulated/wall //landlubbers go home
	name = "bulkhead"
	color = COLOR_GRAY

/turf/simulated/wall/r_wall/hull
	color = COLOR_DARK_GUNMETAL

/turf/simulated/floor
	name = "bare deck"

/turf/simulated/floor/tiled
	name = "deck"

/decl/flooring/tiling
	name = "deck"



/obj/machinery/door/airlock/hatch/autoname

/obj/machinery/door/airlock/hatch/autoname/Initialize()
	. = ..()
	var/area/A = get_area(src)
	SetName("hatch ([A.name])")

/obj/machinery/door/airlock/hatch/autoname/general
	stripe_color = COLOR_CIVIE_GREEN

/obj/machinery/door/airlock/hatch/autoname/maintenance
	stripe_color = COLOR_AMBER

/obj/machinery/door/airlock/hatch/autoname/command
	stripe_color = COLOR_COMMAND_BLUE

/obj/machinery/door/airlock/hatch/autoname/engineering
	stripe_color = COLOR_AMBER

/obj/machinery/door/airlock/hatch/autoname/science
	stripe_color = COLOR_PALE_PURPLE_GRAY

/obj/machinery/door/airlock/hatch/autoname/security
	stripe_color = COLOR_RED

/obj/machinery/door/airlock/hatch/autoname/medical
	stripe_color = COLOR_WHITE

/obj/machinery/door/airlock/hatch/autoname/cargo
	stripe_color = COLOR_BROWN


/obj/machinery/door/airlock/glass/autoname

/obj/machinery/door/airlock/glass/autoname/Initialize()
	. = ..()
	var/area/A = get_area(src)
	SetName("hatch ([A.name])")

/obj/machinery/door/airlock/glass/autoname/general
	stripe_color = COLOR_CIVIE_GREEN


/obj/machinery/space_heater
	mole_efficiency = 1

/obj/machinery/button/windowtint
	icon = 'icons/obj/pilcrow.dmi'

/obj/machinery/power/bluespacecollector
	exhaust_temp = 12//K //T0C
	exhaust_type = "aether"

//make nabbers work again

/datum/species/nabber
	available_cultural_info = list(
		TAG_CULTURE = list(
			CULTURE_NABBER_A
		),
		TAG_HOMEWORLD = list(
			HOME_SYSTEM_SERPENTIDS
		),
		TAG_FACTION = list(
			FACTION_XYNERGY
		),
		TAG_RELIGION =  list(
			RELIGION_OTHER
		)
	)

/decl/cultural_info/culture/nabber/a
	name = CULTURE_NABBER_A
	valid_jobs = list(/datum/job/assistant, /datum/job/doctor, /datum/job/engineer, /datum/job/scientist, /datum/job/officer)






//ITEMS




/obj/item/clothing/suit/storage/hooded/wintercoat
	allowed = list (/obj/item/weapon/pen,
					/obj/item/weapon/paper,
					/obj/item/device/flashlight,
					/obj/item/weapon/storage/fancy/cigarettes,
					/obj/item/weapon/storage/box/matches,
					/obj/item/weapon/reagent_containers/food/drinks/flask,
					/obj/item/weapon/tank)


//CLOSET STUFF

/obj/structure/closet/secure_closet/captains/WillContain()
	return list(
		new/datum/atom_creator/weighted(list(/obj/item/weapon/storage/backpack/captain, /obj/item/weapon/storage/backpack/satchel/cap)),
		new/datum/atom_creator/simple(/obj/item/weapon/storage/backpack/dufflebag/captain, 50),
		/obj/item/clothing/suit/captunic,
		/obj/item/clothing/suit/captunic/capjacket,
		/obj/item/clothing/head/caphat/cap,
		/obj/item/clothing/under/rank/captain,
		/obj/item/clothing/shoes/brown,
		/obj/item/device/radio/headset/heads/captain,
		/obj/item/clothing/gloves/captain,
		/obj/item/weapon/melee/telebaton,
		/obj/item/clothing/under/dress/dress_cap,
		/obj/item/clothing/head/caphat/formal,
		/obj/item/clothing/under/captainformal,
		/obj/item/clothing/suit/cloak/royal,
		/obj/item/clothing/suit/storage/hooded/wintercoat/captain,
	)

/obj/structure/closet/secure_closet/security
	name = "security locker"
	req_access = list(access_brig)
	closet_appearance = /decl/closet_appearance/secure_closet/security

/obj/structure/closet/secure_closet/security/WillContain()
	return list(
		new/datum/atom_creator/weighted(list(/obj/item/weapon/storage/backpack/security, /obj/item/weapon/storage/backpack/satchel/sec)),
		new/datum/atom_creator/simple(/obj/item/weapon/storage/backpack/dufflebag/sec, 50),
		/obj/item/device/radio/headset/headset_sec,
		/obj/item/weapon/storage/belt/holster/security,
		/obj/item/device/flash,
		/obj/item/weapon/reagent_containers/spray/pepper,
		/obj/item/weapon/grenade/chem_grenade/teargas,
		/obj/item/device/holowarrant,
		/obj/item/weapon/melee/baton/loaded,
		/obj/item/ammo_magazine/pistol/rubber,
		/obj/item/ammo_magazine/shotholder/beanbag,
		/obj/item/device/flash,
		/obj/item/weapon/handcuffs = 2,
		/obj/item/clothing/head/helmet,
		/obj/item/clothing/suit/armor/pcarrier/medium,
		/obj/item/clothing/suit/storage/hooded/wintercoat/security,
	)


/obj/structure/closet/wardrobe/wintercoats
	name = "coat closet"
	closet_appearance = /decl/closet_appearance/wardrobe/white

/obj/structure/closet/wardrobe/wintercoats/WillContain()
	return list(
	/obj/item/clothing/mask/gas/half = 4,
	/obj/item/weapon/tank/air = 4,
	/obj/item/clothing/suit/storage/hooded/wintercoat = 2,
	/obj/item/clothing/suit/storage/hooded/wintercoat/cargo = 2,
	)


/obj/structure/closet/wardrobe/wintercoats/mining
	name = "coat closet"
	closet_appearance = /decl/closet_appearance/wardrobe/yellow

/obj/structure/closet/wardrobe/wintercoats/mining/WillContain()
	return list(
	/obj/item/clothing/mask/gas/half = 2,
	/obj/item/weapon/tank/air = 2,
	/obj/item/clothing/suit/storage/hooded/wintercoat/miner = 2,
	)


/obj/structure/closet/wardrobe/wintercoats/science
	name = "coat closet"
	closet_appearance = /decl/closet_appearance/wardrobe/white

/obj/structure/closet/wardrobe/wintercoats/science/WillContain()
	return list(
	/obj/item/clothing/mask/gas/half = 1,
	/obj/item/weapon/tank/air = 1,
	/obj/item/clothing/suit/storage/hooded/wintercoat/science = 1,
	)


/obj/structure/closet/wardrobe/wintercoats/medical
	name = "coat closet"
	closet_appearance = /decl/closet_appearance/wardrobe/white

/obj/structure/closet/wardrobe/wintercoats/medical/WillContain()
	return list(
	/obj/item/clothing/mask/gas/half = 1,
	/obj/item/weapon/tank/air = 1,
	/obj/item/clothing/suit/storage/hooded/wintercoat/medical = 1,
	)


/obj/structure/closet/wardrobe/wintercoats/engineering
	name = "coat closet"
	closet_appearance = /decl/closet_appearance/wardrobe/yellow

/obj/structure/closet/wardrobe/wintercoats/engineering/WillContain()
	return list(
	/obj/item/clothing/mask/gas/half = 4,
	/obj/item/weapon/tank/air = 4,
	/obj/item/clothing/suit/storage/hooded/wintercoat/engineering = 2,
	/obj/item/clothing/suit/storage/hooded/wintercoat/engineering/atmos = 2,
	)