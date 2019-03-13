//BARE BASICS
/*
DEFAULTS
gunneryLink()
- calls gunneryLink() and gunneryBeLinked(src)
- returns G

gunneryBeLinked(G)
- returns 0

gunneryUnlink()
- returns null

gunneryGetRangeMod()
- returns rangemod

barrel/gunneryAimOffset(target)
- returns target

magazine/gunneryGetAmmo()
- returns 1 if ammo success, 0 if not

magazine/gunneryAmmoEffect(target)
- returns 1 if success, 0 if not

core/gunneryReady()
- returns 1 if ready, 0 if not

core/gunneryTarget(target,x,y,z)
- calls gunneryReady() and gunneryFire(target)
- returns gunneryFire(target) if ready, 0 if not

core/gunneryFire(target)
- calls gunneryAmmoEffect(target)
- returns gunneryAmmoEffect(target) if success, 0 if not
*/

var/list/gunnerypieces = list()



///////////////////////////////////////////
//GUNNERY//////////////////////////////////

/obj/machinery/gunnery
	name = "gun piece"
	desc = "A generic gun piece."
	icon = 'icons/obj/machines/gunnery.dmi'
	icon_state = "generic"
	anchored = 1
	density = 1
	opacity = 0
	var/list/linkedgunnery = list()
	var/rangemod = 0
	var/guntype = "generic"
	idle_power_usage = 300
	active_power_usage = 300

/obj/machinery/gunnery/Destroy()
	gunneryUnlink()
	. = ..()

/obj/machinery/gunnery/New()
	..()
	gunnerypieces += src

/obj/machinery/gunnery/Initialize()
	..()
	gunneryLink()

/obj/machinery/gunnery/attackby(obj/item/I, mob/user)
//	if(default_deconstruction_screwdriver(user, I))
//		return
//	if(default_deconstruction_crowbar(user, I))
//		return
	if(isWrench(I))
//		if(panel_open)
		if(anchored)
			user.visible_message("<span class='notice'>\The [user] loosens \the [src]'s bolts with \the [I].</span>", "<span class='notice'>You loosen \the [src]'s bolts with \the [I].</span>")
			gunneryUnlink()

		else
			user.visible_message("<span class='notice'>\The [user] tightens \the [src]'s bolts with \the [I].</span>", "<span class='notice'>You tighten \the [src]'s bolts with \the [I].</span>")
			gunneryLink()
		anchored = !anchored
		playsound(loc, 'sound/items/Deconstruct.ogg', 50, 1)
		return
			//set_dir(turn(dir, 90))
	..()

/obj/item/gunnery
	name = "gunnery thing"
	desc = "Uhhhh."
	icon = 'icons/obj/machines/gunnery.dmi'
	icon_state = "thing"



///////////////////////////////////////////
//BASE PROCS///////////////////////////////

/obj/machinery/gunnery/proc/gunneryLink()
	var/obj/machinery/gunnery/G = locate(/obj/machinery/gunnery) in get_step(src,dir)
	if(G && G.dir == dir && !(G in linkedgunnery))
		if(G.guntype != guntype || !G.anchored)
			return
		if(G == src)
			world << "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA [src] at [x] [y] [z] found itself in gunneryLink()"
			world.log << "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA [src] at [x] [y] [z] found itself in gunneryLink()"
			return
		linkedgunnery |= G
		visible_message("[src] at [x], [y], [z]: FOUND [G] in dir [dir]")
		G.gunneryLink()
		G.gunneryBeLinked(src)
	else
		visible_message("[src] at [x], [y], [z]: DID NOT find anything in dir [dir]")
	return G

/obj/machinery/gunnery/proc/gunneryBeLinked(var/obj/machinery/gunnery/G)
	if(G)
		linkedgunnery |= G
		//visible_message("[src] at [x], [y], [z]: be linked: [G] was LINKED.")
		return 1
	//else
		//visible_message("[src] at [x], [y], [z]: be linked: NOT FOUND.")
	return 0


/obj/machinery/gunnery/proc/gunneryUnlink()
	for(var/obj/machinery/gunnery/G in linkedgunnery)
		G.linkedgunnery -= src
		linkedgunnery -= G
		//visible_message("removed [G] from [src].linkedgunnery, and vice versa")


/obj/machinery/gunnery/proc/gunneryGetRangeMod()
	return rangemod


///////////////////////////////////////////
//MAGAZINE/////////////////////////////////

/obj/machinery/gunnery/magazine
	name = "gun magazine"
	icon_state = "genmag"
	//density = 0
	var/ammunition = 69

/obj/machinery/gunnery/magazine/proc/gunneryGetAmmo(var/use = 1)
	if(ammunition > 0 && use)
		ammunition -= use
		if(ammunition < 0)
			ammunition = 0
			return 0
		return 1
	return ammunition

/obj/machinery/gunnery/magazine/proc/gunneryAmmoEffect(var/atom/target)
	//target.visible_message("kaboom")
	return 1


///////////////////////////////////////////
//BARREL///////////////////////////////////

/obj/machinery/gunnery/barrel
	name = "gun barrel"
	icon_state = "genbarrel"
	rangemod = 1

/obj/machinery/gunnery/barrel/gunneryGetRangeMod(var/recursions = 0)
	if(recursions > 5)
		//visible_message("Recursion limit exceeded!")
		return rangemod
	var/obj/machinery/gunnery/barrel/G = locate(/obj/machinery/gunnery/barrel) in get_step(src,dir)
	if(G && G.dir == dir && G in linkedgunnery)
		recursions++
		return rangemod+G.gunneryGetRangeMod(recursions)
	else
		return rangemod


///////////////////////////////////////////
//CORE/////////////////////////////////////

/obj/machinery/gunnery/core
	name = "gun core"
	var/next_shot
	var/obj/machinery/gunnery/magazine/gMag
	var/obj/machinery/gunnery/barrel/gBarrel
	var/ready = 0
	var/schutsound = 'sound/weapons/railgun.ogg'

/obj/machinery/gunnery/core/gunneryGetRangeMod()
	var/tempmod = rangemod
	if(gBarrel)
		tempmod += gBarrel.gunneryGetRangeMod()
	if(gMag)
		tempmod += gMag.gunneryGetRangeMod()
	return tempmod

/obj/machinery/gunnery/core/gunneryLink()
	. = ..()
	//visible_message("[src]: . was [.].")
	if(. && istype(.,/obj/machinery/gunnery/barrel))
		gBarrel = .
		//visible_message("[src] set [.] as gBarrel")
	gunneryReady()

/obj/machinery/gunnery/core/gunneryBeLinked(var/obj/machinery/gunnery/G)
	..()
	//visible_message("[src]: G was [G].")
	if(G && istype(G,/obj/machinery/gunnery/magazine))
		gMag = G
		//visible_message("[src] set [G] as gMag")
	gunneryReady()

/obj/machinery/gunnery/core/gunneryUnlink()
	..()
	gMag = null
	gBarrel = null
	gunneryReady()

/obj/machinery/gunnery/core/proc/gunneryReady()
	ready = 0
	if(!anchored)
		return 0
	if(next_shot > world.time)
		return 0
	if(gMag && gMag.guntype == guntype && gBarrel && gBarrel.guntype == guntype)
		ready = 1
	return ready

/obj/machinery/gunnery/core/proc/gunneryAimOffset(target)
	return target

/obj/machinery/gunnery/core/proc/gunneryTarget(var/atom/target,var/tx,var/ty,var/tz)
	if(!gunneryReady())
		visible_message("<span class='warning'><b>\The [src] beeps:</b> \"WARNING: Not ready to fire!\"</span>")
		return 0
	if(tx && ty && tz)
		target = locate(tx,ty,tz)
	if(target && !istype(target,/turf))
		//visible_message("target [target] is not a turf, getting turf")
		target = get_turf(target)
	if(target)
		//visible_message("target is [target]")

		//if(target.z == z)
		//	return 0
		target = gunneryAimOffset(target)
		return gunneryFire(target)
	else
		//visible_message("target is null, coords were [tx],[ty],[tz]")
		return 0

/obj/machinery/gunnery/core/proc/gunneryFire(var/atom/target)
	if(!ready || !target)
		return 0
	if(gMag)
		if(gMag.gunneryGetAmmo(1))
			. = gMag.gunneryAmmoEffect(target)
			if(.)
				getBoom()
	next_shot = world.time+10


/obj/machinery/gunnery/core/proc/getBoom() //proc so that you can, say, make everybody star trek it up for each shot.
	playsound(loc, schutsound, 75, 1)

/*	for(var/mob/M in GLOB.player_list)
		if(map_sectors["[M.z]"] == map_sectors["[z]"])
			stuff*/

	return 1
