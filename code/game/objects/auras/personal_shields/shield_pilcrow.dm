
/obj/aura/personal_shield/powershield
	name = "powershield"
	var/obj/item/device/powershield/shield
//	icon = 'icons/effects/effects.dmi'
//	icon_state = "glow"
//	color = "#66ffcb"
//	alpha = 100
//	plane = ABOVE_HUMAN_PLANE
//	layer = MOB_LAYER
//	blend_mode = BLEND_MULTIPLY

/obj/aura/personal_shield/powershield/bullet_act(var/obj/item/projectile/P, var/def_zone)
	//CELL CAPACITY (HIGH): 1000Wh
	//IDEAL DRAIN ON AN AVERAGE ATTACK: ~20%
	if(shield)
		var/amount = max(P.stun*5,P.damage,P.agony/2,P.irradiate)*2 //avg 20-100
		amount += 100 //avg avg 120-200Wh
		if(shield.check_charge(amount))
			user.visible_message("<span class='warning'>\The [user]'s [src.name] flashes and blocks \the [P]!</span>")
			new /obj/effect/temporary(get_turf(src), 2 SECONDS,'icons/obj/machines/shielding.dmi',"shield_impact")
			playsound(user,'sound/effects/basscannon.ogg',35,1)
			shield.take_charge(amount)
			return AURA_FALSE|AURA_CANCEL
		else
			shield.shield_failure()
	return 0

/obj/aura/personal_shield/powershield/New(var/mob/living/user, var/user_shield)
	..()
	shield = user_shield

/obj/aura/personal_shield/powershield/Destroy()
	shield = null
	return ..()


