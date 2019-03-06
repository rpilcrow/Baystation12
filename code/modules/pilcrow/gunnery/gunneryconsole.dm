/obj/machinery/computer/gunnery
	name = "gunnery console"
	icon_keyboard = "telesci_key"
	icon_screen = "tcboss"
	var/atom/target = null
	var/obj/machinery/gunnery/core/gCore
	var/list/coords = list("x" = 0, "y" = 0, "z" = 0)



/obj/machinery/computer/gunnery/attack_hand(mob/user as mob)
	if(..())
		return
	user.set_machine(src)
	var/dat = "<a href='byond://?src=\ref[src];close=1'>Close</a>"
	dat += "<center><h4>Gunnery Console v0.02</h4></center>"
	if(target)
		dat += "<br><b>TARGETING MODE:</b> TARGET <a href='byond://?src=\ref[src];cleartarget=1'>(Clear)</a>"
		dat += "<br><b>CURRENT TARGET</b>: [target.name] at [target.x] [target.y] [target.z]."
	else
		dat += "<br><b>TARGETING MODE:</b> COORDS"
		dat += "<br><b>CURRENT COORDINATES</b>: [coords["x"]], [coords["y"]], [coords["z"]] (Change <a href='byond://?src=\ref[src];setcoord=setx'>X</a> <a href='byond://?src=\ref[src];setcoord=sety'>Y</a> <a href='byond://?src=\ref[src];setcoord=setz'>Z</a>)"
	if(gCore)
		dat += "<br><b>CURRENT WEAPON</b>: [gCore.name] at [gCore.x] [gCore.y] [gCore.z]."
		if(gCore.gMag)
			dat += "<br><b>AMMUNITION</b>: [gCore.gMag.ammunition]"
		dat += "<br><b>RANGE</b>: [gCore.gunneryGetRangeMod()]"
		dat += "<br><b><a href='byond://?src=\ref[src];firegun=1'>(FIRE)</a></b>"
	else
		dat += "<br><b>CURRENT WEAPON</b>: NONE"

	if(gunnerypieces.len)
		dat += "<br><br><b>WEAPONRY DETECTED:</b>"
		for(var/obj/machinery/gunnery/core/G in gunnerypieces)
			dat += "<br><b>[G.name]</b> at [G.x], [G.y], [G.z] <a href='byond://?src=\ref[src];setgun=\ref[G]'>(Select)</a>"
	else
		dat += "<br><br><b>NO WEAPONRY DETECTED</b>"

	if(gCore)
		dat += "<br><br><b>TARGETS DETECTED:</b>" //using shuttle waypoints for now. this will include BS beacons.
		for(var/obj/effect/overmap/S in range(map_sectors["[gCore.z]"], gCore.gunneryGetRangeMod()))
			for(var/obj/effect/shuttle_landmark/LZ in S.get_waypoints(gCore.name))
				dat += "<br><b>[S.name] - [LZ.name]</b> at [LZ.x], [LZ.y], [LZ.z] <a href='byond://?src=\ref[src];target=\ref[LZ]'>(Select)</a>"

	user << browse(dat, "window=gunnery")
	onclose(user, "gunnery")
	return


/obj/machinery/computer/gunnery/OnTopic(user, href_list)
	set waitfor = 0

	if (href_list["close"])
		close_browser(user, "window=gunnery")
		return TOPIC_HANDLED

	if(href_list["target"])
		target = locate(href_list["target"])
		. = TOPIC_REFRESH

	else if(href_list["cleartarget"])
		target = null
		. = TOPIC_REFRESH

	else if(href_list["setcoord"])
		if(gCore)
			switch(href_list["setcoord"])
				if("setx")
					coords["x"] = max(min(input(user, "Target's X coordinate.", "Coordinates - X") as num|null,world.maxx),1)
				if("sety")
					coords["y"] = max(min(input(user, "Target's Y coordinate.", "Coordinates - Y") as num|null,world.maxy),1)
				if("setz")
					var/list/potential_planet = list()
					for(var/obj/effect/overmap/S in range(map_sectors["[gCore.z]"], gCore.gunneryGetRangeMod()))
						if(S.map_z.len)
							potential_planet |= S.name
							potential_planet[S.name] = S
					if(potential_planet.len)
						var/potential_z = input(user,"Designating a target..","Targeting") in potential_planet
						if(potential_z)
							var/obj/effect/overmap/S = potential_planet[potential_z]
							potential_z = null
							potential_z = input(user,"Designating a Z-level in [S.name].","Coordinates - Z") in S.map_z
							/*if(S.map_z.len == 1)
								potential_z = S.map_z[1]
							else
								potential_z = input(user,"Designating a Z-level in [S.name].","Coordinates - Z") in S.map_z*/

							if(potential_z)
								coords["z"] = potential_z
					else
						to_chat(user,"<span class='warning'>No applicable targets!</span>")
		else
			to_chat(user,"<span class='warning'>Designate a gun before changing this!</span>")
				//	coords["z"] = max(min(input(user, "Target's Z coordinate.", "Coordinates - Z") as num|null,world.maxz),1)
		. = TOPIC_REFRESH

	else if(href_list["setgun"])
		visible_message("setgun was: [href_list["chooseweapon"]]")
		var/sss = locate(href_list["setgun"])
		visible_message("sss was [sss]")
		if(istype(sss, /obj/machinery/gunnery/core))
			gCore = sss
			coords = initial(coords)
//		RIP IN PEACE THIS CODE, IT NEVER SCORED
//		if(isnum(href_list["chooseweapon"]) && istype(gunnerypieces[href_list["chooseweapon"]],/obj/machinery/gunnery/core))
//			gCore = gunnerypieces[href_list["chooseweapon"]] //AAAAAAAAAAAAAAAAAAAAAAAA
			. = TOPIC_REFRESH

	else if(href_list["firegun"])
		if(gCore)
			if(target)
				if(gCore.gunneryTarget(target))
					to_chat(user,"<span class='warning'>Firing gun at chosen target.</span>")
				else
					to_chat(user,"<span class='warning'>Failed to fire gun at chosen target.</span>")
			else if(coords["x"] && coords["y"] && coords["z"])
				if(gCore.gunneryTarget(null, coords["x"], coords["y"], coords["z"]))
					to_chat(user,"<span class='warning'>Firing gun at chosen coordinates.</span>")
				else
					to_chat(user,"<span class='warning'>Failed to fire gun at chosen coordinates.</span>")
			else
				to_chat(user,"<span class='warning'>There are no coordinates or targets set!</span>")
		. = TOPIC_REFRESH

	if(. == TOPIC_REFRESH)
		attack_hand(user)