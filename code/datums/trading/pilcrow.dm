/datum/trader/ship/MRE
	name = "Steve2277"                            //The name of the trader in question
	origin = "Steve2277's MREs"
	possible_origins = list("Steve2277 MREs","MRE Box","FTV MRE","MilSurp MREs","MRE Home","Old & New Food","MRE Palace")
	disposition = 0
	trade_flags = TRADER_MONEY
	name_language = LANGUAGE_SOL_COMMON
	//portrait

	wanted_items = list()                              //What items they enjoy trading for. Structure is (type = known/unknown)
	possible_wanted_items = list()                             //List of all possible wanted items. Structure is (type = mode)
	possible_trading_items = list()                            //List of all possible trading items. Structure is (type = mode)
	trading_items = list()                             //What items they are currently trading away.
	blacklisted_trade_items = list(/mob/living/carbon/human)
	                                                            //Things they will automatically refuse

	list/speech = list()                                    //The list of all their replies and messages. Structure is (id = talk)
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

	mob_transfer_message = "You are transported to ORIGIN." //What message gets sent to mobs that get sold.