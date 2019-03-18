/datum/trader/ship/mrestore
	name = "Steve2277"                            //The name of the trader in question
	origin = "Steve2277's MREs"
	possible_origins = list("Steve2277 MREs","MRE Box","FTV MRE","MilSurp MREs","MRE Home","Old & New Food","MRE Palace")
	disposition = 0
	trade_flags = TRADER_MONEY
	name_language = LANGUAGE_SOL_COMMON
	//portrait

	wanted_items = list()                              //What items they enjoy trading for. Structure is (type = known/unknown)
	//possible_wanted_items = list(/obj/item/weapon/storage/mre = TRADER_ALL)
	possible_trading_items = list(/obj/random/mre = TRADER_THIS_TYPE,
								/obj/random/mre/main = TRADER_THIS_TYPE,
								/obj/random/mre/dessert = TRADER_THIS_TYPE)
	trading_items = list()                             //What items they are currently trading away.
	blacklisted_trade_items = list(/mob/living/carbon/human)
	                                                            //Things they will automatically refuse

	list/speech = list("hail_generic" = "Hey there, welcome to ORIGIN, hopefully I can offer you something new.. or old?",
				"hail_deny"      = "Sorry, no can do.",

				"trade_complete" = "Nice.",
				"trade_no_money" = "Sorry, cash only for now.",
				"trade_blacklist"= "I don't take those.",
				"trade_no_goods"    = "I only take cash.",
				"trade_not_enough"="That's not quite enough.",
				"how_much"       = "One ITEM will go for VALUE thalers.",

				"compliment_deny"= "I'm flattered, but no.",
				"compliment_accept"= "Nice.",
				"insult_good"    = "Chill out buddy, what'd I do?",
				"insult_bad"     = "...",

				"bribe_refusal"  = "Sorry, got places to be.",
				"bribe_accept"   = "Sure, I can hang around a while.")//Structure is (id = talk)
	/*SPEECH IDS:
	hail_generic		When merchants hail a person
	hail_[race]			Race specific hails
	hail_deny			When merchant denies a hail

	insult_good			When the player insults a merchant while they are on good disposition
	insult_bad			When a player insults a merchatn when they are not on good disposition
	complement_accept	When the merchant accepts a complement
	complement_deny		When the merchant refuses a complement

	how_much			When a merchant tells the player how much something is.
	trade_complete		When a trade is made
	trade_refuse		When a trade is refused

	what_want			What the person says when they are asked if they want something

	*/
	want_multiplier = 2                                     //How much wanted items are multiplied by when traded for
	margin = 1.2											//Multiplier to price when selling to player
	price_rng = 10                                          //Percentage max variance in sell prices.
	insult_drop = 5                                         //How far disposition drops on insult
	compliment_increase = 5                                 //How far compliments increase disposition
	refuse_comms = 0                                        //Whether they refuse further communication

	mob_transfer_message = "You are transported to ORIGIN. An athletic, bearded man looks bewildered at you, and then offers you a cup of coffee type 3."

/datum/trader/ship/tilde
	name = "Tilde"
//	name_language = TRADER_DEFAULT_NAME
	origin = "FTV Crow"
	disposition = 5
	trade_flags = TRADER_GOODS|TRADER_MONEY|TRADER_WANTED_ALL
	possible_origins = list("Unknown Destination","Mysterious Signal","Unregistered Signal","???","null")
	speech = list("hail_generic"    = "Oh, uh, hey. You've contacted Tilde. Did you need anything?",
				"hail_deny"         = "I don't really feel like dealing with you. Sorry.",

				"trade_complete"    = "Good doing business with you!",
				"trade_blacklist"   = "Uh. I REALLY don't want that.",
				"trade_found_unwanted" = "I don't need that.",
				"trade_not_enough"   = "I, uh.. I think that's worth a liiiittle more.",
				"how_much"          = "I can sell you that ITEM for, uh, probably VALUE thalers.",
				"what_want"         = "Anything sweet and tasty! In particular..",

				"compliment_deny"   = "That's very flattering! But, uh, no.",
				"compliment_accept" = "Thank you! That's very nice!",
				"insult_good"       = "Oh.",
				"insult_bad"        = "That was kind of uncalled for!")
	want_multiplier = 10
	typical_duration = 30

	possible_wanted_items = list(/obj/item/weapon/reagent_containers/food/snacks/candy = TRADER_ALL,
								/obj/item/weapon/reagent_containers/food/snacks/chips = TRADER_THIS_TYPE,
								/obj/item/weapon/reagent_containers/food/snacks/no_raisin = TRADER_THIS_TYPE,
								/obj/item/weapon/reagent_containers/food/snacks/cookie = TRADER_THIS_TYPE,
								/obj/item/weapon/reagent_containers/food/snacks/donut/normal = TRADER_THIS_TYPE,
								/obj/item/weapon/reagent_containers/food/snacks/candiedapple = TRADER_THIS_TYPE,
								/obj/item/clothing/mask/chewable/candy = TRADER_SUBTYPES_ONLY,
								/obj/item/clothing/mask/chewable/candy/lolli/meds = TRADER_BLACKLIST)

	possible_trading_items = list(/obj/item/weapon/storage/pill_bottle = TRADER_SUBTYPES_ONLY,
								  /obj/item/weapon/storage/pill_bottle/dice = TRADER_BLACKLIST,
								  /obj/item/weapon/storage/pill_bottle/dice_nerd = TRADER_BLACKLIST,
								  /obj/item/weapon/storage/pill_bottle/zoom = TRADER_BLACKLIST,
								  /obj/item/weapon/storage/pill_bottle/happy = TRADER_BLACKLIST,
								  /obj/item/weapon/storage/firstaid/fire  = TRADER_THIS_TYPE,
								  /obj/item/weapon/storage/firstaid/toxin  = TRADER_THIS_TYPE,
								  /obj/item/weapon/storage/firstaid/adv  = TRADER_THIS_TYPE,
								  /obj/item/weapon/storage/box/bloodpacks  = TRADER_THIS_TYPE,
								  /obj/item/weapon/reagent_containers/ivbag  = TRADER_SUBTYPES_ONLY,
								  /obj/item/weapon/reagent_containers/glass/bottle/inaprovaline = TRADER_THIS_TYPE,
								  /obj/item/weapon/reagent_containers/glass/bottle/antitoxin = TRADER_THIS_TYPE,
								  /obj/item/weapon/reagent_containers/glass/bottle/inaprovaline = TRADER_THIS_TYPE,
								  /obj/item/bodybag/cryobag = TRADER_THIS_TYPE,
								  /obj/item/weapon/reagent_containers/chem_disp_cartridge/dexalin/small = TRADER_THIS_TYPE,
								  /obj/item/weapon/reagent_containers/hypospray/autoinjector = TRADER_ALL,
								  /obj/item/weapon/reagent_containers/hypospray/autoinjector/mindbreaker = TRADER_BLACKLIST,
								  /obj/item/weapon/reagent_containers/hypospray/autoinjector/pouch_auto = TRADER_BLACKLIST_ALL,
								  /obj/item/weapon/reagent_containers/hypospray/vial = TRADER_THIS_TYPE) //chems, medicine, something else?

	mob_transfer_message = "You are transported to the ORIGIN. By the time you awaken, you find that you have been left in the care of a medical station in Sol, and the trader is nowhere to be found."

///datum/trader/ship/pilcrow/New()
//	name = pick("Rebecca","Beck","Tilde","Ozwyn")

/datum/trader/ship/tonk
	name = "Tonk"
//	name_language = TRADER_DEFAULT_NAME
	origin = "HWS Tonk"
	possible_origins = list("HWS Tonk")
	trade_flags = TRADER_MONEY
	speech = list("hail_generic"    = "RRRRRRRLRLRLRLRL",
				"hail_deny"         = "RLRLLLL..",

				"trade_complete"    = "HHHRRRRLRLRLRL",
				"trade_blacklist"   = "RLRLRLLLL.",
				"trade_no_goods"    = "HRRRRLRLRLL.",
				"trade_not_enough"  = "HRRRRLRLRLRLRLLLLLL.",
				"how_much"          = "*beep* ITEM ... PRICE SET AT ... VALUE THALERS! *beep*",

				"compliment_deny"   = "HRRRRRK.",
				"compliment_accept" = "RRRRRR",
				"insult_good"       = "HRRRRLLLLLL.",
				"insult_bad"        = "HRRRLRLRLRLLLLLLLL!"
				)

	possible_trading_items = list(/obj/item/weapon/gun/projectile/shotgun/pump    = TRADER_ALL,
								/obj/item/weapon/gun/projectile/automatic    = TRADER_SUBTYPES_ONLY,
								/obj/item/weapon/gun/projectile/automatic/l6_saw    = TRADER_BLACKLIST_ALL,
								/obj/item/weapon/gun/projectile/automatic/merc_smg    = TRADER_BLACKLIST_ALL,
								/obj/item/stack/material/cardboard/ten = TRADER_THIS_TYPE,
								/obj/item/weapon/gun/energy/retro    = TRADER_THIS_TYPE,
								/obj/item/weapon/melee/energy/sword    = TRADER_THIS_TYPE,
								/obj/item/weapon/gun/energy/laser    = TRADER_THIS_TYPE) //laser weapons, beam swords, maybe something else

	mob_transfer_message = "You are transported to the ORIGIN and find yourself in a warehouse surrounded by thousands of cardboard cutouts of various people. You are scared and confused."


/datum/trader/ship/gunnery
	name = "Gun"
//	name_language = TRADER_DEFAULT_NAME
	origin = "FTV Gunboat Diplomacy"
//	disposition = 0
	trade_flags = TRADER_GOODS|TRADER_MONEY|TRADER_WANTED_ALL
	possible_origins = list("FTV Gunboat Diplomacy","FTV Gunderstruck","FTS Rusty Blade","FTS Cargo Cult","FTV What Are The Civilian Applications?","FTV Irredeemable Mess","FTV The Flagship","FTV The Ship Your Ship Could Fly Like","FTV FGSFDS")
	speech = list("hail_generic"    = "Hey, fellow gun-lover! This is the ORIGIN! We sell guns here, BIG ones!",
				"hail_deny"         = "Y'all don't nearly like guns enough. Get gone.",

				"trade_complete"    = "Yee-haw! You have fun with that one!",
				"trade_blacklist"   = "Aw hell, we really don't take those.",
				"trade_found_unwanted" = "We don't take those.",
				"trade_not_enough"   = "That ain' enough! Why don't y'all gather a bit more up?",
				"how_much"          = "How about VALUE thalers?",
				"what_want"         = "Guns! I buy my big guns for cheap elsewhere, so I only want",

				"compliment_deny"   = "My only love is guns, y'all, I ain't got space in my heart for you!",
				"compliment_accept" = "Aw, shucks. Your gun's big, too!",
				"insult_good"       = "Gunderstandable.",
				"insult_bad"        = "Y'all best clear out of my vision quick.")
	want_multiplier = 0.75
	typical_duration = 20

	possible_wanted_items = list(/obj/item/weapon/gun/projectile = TRADER_SUBTYPES_ONLY,
								/obj/item/weapon/gun/energy = TRADER_SUBTYPES_ONLY,
								/obj/item/gunnery/ballistic = TRADER_ALL)

	possible_trading_items = list(/obj/machinery/gunnery/core = TRADER_SUBTYPES_ONLY,
								  /obj/machinery/gunnery/magazine = TRADER_SUBTYPES_ONLY,
								  /obj/machinery/gunnery/barrel = TRADER_SUBTYPES_ONLY,
								  /obj/item/gunnery/ballistic = TRADER_ALL,
								  /obj/item/gunnery/signal = TRADER_THIS_TYPE) //G U N N E R Y

	blacklisted_trade_items = list(/mob/living/carbon/human)

	mob_transfer_message = "You are transported to the ORIGIN. NAME stares at you for a while, before asking if you are a gun."

/datum/trader/ship/gunnery/New()
	..()
	name += pick("ther","ny","ri","ner Wells","da","t","n","na",null)



/datum/trader/ship/wildcard
	name = "Wildcard"
//	name_language = TRADER_DEFAULT_NAME
	origin = "FTV Bizniz"
	disposition = 5
	trade_flags = TRADER_GOODS|TRADER_MONEY|TRADER_WANTED_ALL
	possible_origins = list("FTV Bizniz","FTV Harry","FTV Buck The Trend","FTV Hooligan","FTV It's Ours, Now","FTV The Revolution Will Not Be Commercialized","FTV Culture Reference","FTV Bring My Brown Pants")
	speech = list("hail_generic"    = "You've contacted ORIGIN, source of all your headaches since 2289!",
				"hail_deny"         = "Wildcard, bitches! We're out!",

				"trade_complete"    = "Have fun with that!",
				"trade_blacklist"   = "We don't take those! Surprising, right?",
				"trade_found_unwanted" = "Nah, try literally anything else!",
				"trade_not_enough"   = "You're gonna need a bit more!",
				"how_much"          = "VALUE thalers for one ITEM. How's that?",
				"what_want"         = "Anything you can pick up! For instance..",

				"compliment_deny"   = "I've heard that a few times before.",
				"compliment_accept" = "Hah, really? Nice!",
				"insult_good"       = "Hah! I like the cut of your jib!",
				"insult_bad"        = "I'm sure you can!")
	want_multiplier = 2
	typical_duration = 15

	possible_wanted_items = list(/obj/item = TRADER_ALL,
								/mob/living = TRADER_ALL,
								/mob/living/carbon/human = TRADER_BLACKLIST_ALL)

	possible_trading_items = list(/obj/item = TRADER_SUBTYPES_ONLY,
								  /mob/living = TRADER_SUBTYPES_ONLY,
								  /mob/living/carbon/human = TRADER_BLACKLIST_ALL)

	mob_transfer_message = "You find yoursef on the ORIGIN. Uh oh."

/datum/trader/ship/wildcard/New()
	..()
	name += pick(" Harry"," Jim"," Roger"," Ginger"," 69")



/datum/trader/ship/alternianrebel
	name = "Unknown Troll"
	name_language = LANGUAGE_TROLL
	origin = "AEB Barkbeast"
	//disposition = 5
	trade_flags = TRADER_GOODS|TRADER_MONEY|TRADER_WANTED_ALL
	possible_origins = list()
	speech = list("hail_generic"    = "<i>*crackle*</i> This is ORIGIN. What is it?",
				"hail_deny"         = "<i>The transmission closes.</i>",

				"trade_complete"    = "Good doing business. Now go.",
				"trade_blacklist"   = "No.",
				"trade_found_unwanted" = "I don't want that.",
				"trade_not_enough"   = "More. There's not enough.",
				"how_much"          = "VALUE thalers for that ITEM, and that's final.",
				"what_want"         = "I want medical supplies and reagents, such as",

				"compliment_deny"   = "No.",
				"compliment_accept" = "No.",
				"insult_good"       = "Stop wasting my time.",
				"insult_bad"        = "You're really trying my patience.")
	want_multiplier = 2
	compliment_increase = 0

	//will sell: weapons, armor?
	//will buy: food, materials?
	possible_wanted_items = list(/obj/item/weapon/storage/pill_bottle = TRADER_SUBTYPES_ONLY,
								  /obj/item/weapon/storage/pill_bottle/dice = TRADER_BLACKLIST,
								  /obj/item/weapon/storage/pill_bottle/dice_nerd = TRADER_BLACKLIST,
								  /obj/item/weapon/storage/firstaid/fire  = TRADER_THIS_TYPE,
								  /obj/item/weapon/storage/firstaid/toxin  = TRADER_THIS_TYPE,
								  /obj/item/weapon/storage/firstaid/adv  = TRADER_THIS_TYPE,
								  /obj/item/weapon/storage/box/bloodpacks  = TRADER_THIS_TYPE,
								  /obj/item/weapon/reagent_containers/ivbag  = TRADER_SUBTYPES_ONLY,
								  /obj/item/weapon/reagent_containers/glass/bottle/inaprovaline = TRADER_THIS_TYPE,
								  /obj/item/weapon/reagent_containers/glass/bottle/antitoxin = TRADER_THIS_TYPE,
								  /obj/item/bodybag/cryobag = TRADER_THIS_TYPE,
								  /obj/item/weapon/reagent_containers/chem_disp_cartridge/dexalin/small = TRADER_THIS_TYPE,
								  /obj/item/weapon/reagent_containers/hypospray/autoinjector = TRADER_ALL,
								  /obj/item/weapon/reagent_containers/hypospray/vial = TRADER_THIS_TYPE)

	possible_trading_items = list(/obj/random/mre = TRADER_THIS_TYPE,
								  /obj/item/gunnery/ballistic = TRADER_ALL,
								  /obj/item/weapon/gun/projectile/shotgun/pump = TRADER_ALL,
								  /obj/item/weapon/material/sword/replica/officersword/pilcustom = TRADER_THIS_TYPE,
								  /obj/item/weapon/material/sword/longsword = TRADER_ALL,
								  /obj/item/weapon/cane/concealed/sword = TRADER_THIS_TYPE,
								  /obj/item/weapon/material/hatchet/machete = TRADER_ALL,
								  /obj/item/weapon/gun/energy/pilcrow = TRADER_THIS_TYPE,
								  /obj/item/device/personal_shield = TRADER_THIS_TYPE,
								  /obj/item/device/chameleon = TRADER_THIS_TYPE,
								  /obj/item/device/taunter = TRADER_THIS_TYPE,
								  /obj/item/device/shuffler = TRADER_THIS_TYPE)

	mob_transfer_message = "You find yoursef aboard the ORIGIN. It's kind of dark."

/datum/trader/ship/alternianrebel/New()
	..()
	origin = pick("IND ","IDV ","AEV ","The ","PLV ","AEB ","Battleship ","Scoutship ","Rebel Ship ")
	if(prob(33))
		origin += pick("Bark","Caw","Screech","Hop","Meow","Muscle","Star","Space")
		origin += pick("beast","thing","creature","critter")
	else
		origin += pick("Thinkpan","Bulge","Cheekblade","Windhole","Crisprange","Dross Coffer","Pail","Frond","Grub","Grubsauce","Hatefriend","Hear Duct","Lawnring","Load Gaper","Lusus","Matesprit","Kismesis","Moirail","Nugbone","Slurry","Sponge","Wader","Handle")
		origin += pick(" Blowout"," Blast"," Diver"," Blaster"," Breaker"," Smasher"," Cleaner"," Pirouette"," Splatter"," Jammer"," Sauce")