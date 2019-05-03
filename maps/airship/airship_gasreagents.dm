/decl/xgm_gas/alium
	tile_overlay = "aether"
	overlay_limit = 1

/decl/xgm_gas/air_aether
	id = "aether"
	name = "Aether"
	tile_overlay = "aether_star"
	overlay_limit = 0.7
	breathed_product = /datum/reagent/toxin/aether
	specific_heat = 400
	molar_mass = 0.405
//	flags = XGM_GAS_CONTAMINANT|XGM_GAS_FUSION_FUEL

/*
/decl/xgm_gas/air_aether/New()
	specific_heat = rand(1, 400)	// J/(mol*K)
	molar_mass = rand(20,800)/1000	// kg/mol
	if(prob(40))
		flags |= XGM_GAS_FUEL
	else if(prob(40)) //it's prooobably a bad idea for gas being oxidizer to itself.
		flags |= XGM_GAS_OXIDIZER
	if(prob(40))
		flags |= XGM_GAS_CONTAMINANT
	if(prob(40))
		flags |= XGM_GAS_FUSION_FUEL
*/

/datum/reagent/aether
	name = "Aether"
	description = "A strange, starry mixture said to be the source of Noctites."
	taste_description = "a hole in the cosmos"
	taste_mult = 1.5
	reagent_state = LIQUID
//	target_organ = BP_BRAIN
	color = "#000000"
	var/strength = 10
//	touch_met = 5
	heating_point = null
	heating_products = null
	overdose = 33

/datum/reagent/aether/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_DIONA)
		return
	if(alien == IS_DARKLING)
		M.heal_overall_damage(0, strength * removed)
	else
		M.take_overall_damage(0, strength * removed)
		M.add_chemical_effect(CE_MIND, -2)
		if(alien == IS_SKRELL)
			M.hallucination(15, 20)
		else
			M.hallucination(25, 35)

/datum/reagent/aether/overdose(var/mob/living/carbon/M, var/alien)
	var/mob/living/carbon/human/H
	if(istype(M,/mob/living/carbon/human))
		H = M

		if(prob(20))
			to_chat(H,"<span class='warning'>Your flesh burns, crackling with electricity!</span>")
			playsound(H, 'sound/effects/sparks4.ogg', 100, 1)
			new /obj/effect/temporary(get_step(H,0), 0.7 SECONDS,'icons/effects/effects.dmi',"electricity_constant")
			var/datum/effect/effect/system/spark_spread/sprk = new /datum/effect/effect/system/spark_spread
			sprk.set_up(3, 0, get_step(H,0))
			sprk.start()

		if(H.species.name == SPECIES_DARK) //|| alien == IS_DARKLING)
			H.adjustFireLoss(strength*REM)
			return
		if(prob(5))
			to_chat(H, "<span class='danger'>Your flesh is swallowed into the vast cosmos, and your insides burn with new light!</span>")
			H.flash_eyes()
			H.set_species(SPECIES_DARK)
			return
		else
			H.adjustFireLoss(strength*REM)

/datum/reagent/toxin/aether/touch_turf(var/turf/simulated/T)
	if(!istype(T))
		return
	T.assume_gas("aether", volume, T0C)
	remove_self(volume)