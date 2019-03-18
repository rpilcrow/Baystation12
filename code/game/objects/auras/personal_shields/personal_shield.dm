/obj/aura/personal_shield
	name = "personal shield"
	icon = 'icons/effects/effects.dmi'
	icon_state = "glow"
	color = "#66ffcb"
	alpha = 100
	plane = ABOVE_HUMAN_PLANE
	layer = MOB_LAYER
	blend_mode = BLEND_MULTIPLY

/obj/aura/personal_shield/added_to(var/mob/living/L)
	if(L)
		playsound(L,'sound/weapons/flash.ogg',35,1)
		to_chat(L,"<span class='notice'>You feel your body prickle as \the [src] comes online.</span>")
		set_light(0.6, 0, 4, 2, color)

/obj/aura/personal_shield/bullet_act(var/obj/item/projectile/P, var/def_zone)
	user.visible_message("<span class='warning'>\The [user]'s [src.name] flashes and blocks \the [P]!</span>")
	new /obj/effect/temporary(get_turf(src), 2 SECONDS,'icons/obj/machines/shielding.dmi',"shield_impact")
	playsound(user,'sound/effects/basscannon.ogg',35,1)
	return AURA_FALSE|AURA_CANCEL

/obj/aura/personal_shield/removed()
	..()

/obj/aura/personal_shield/device
	var/obj/item/device/personal_shield/shield

/obj/aura/personal_shield/device/bullet_act()
	. = ..()
	if(shield)
		shield.take_charge()

/obj/aura/personal_shield/device/New(var/mob/living/user, var/user_shield)
	..()
	shield = user_shield

/obj/aura/personal_shield/device/Destroy()
	shield = null
	return ..()