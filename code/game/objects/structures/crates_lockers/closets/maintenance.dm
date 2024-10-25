/obj/structure/closet/maintenance
	name = "abandoned closet"
	desc = "An old, forgotten, and unwanted closet."
	icon_state = "maint"
	icon_closed = "maint"
	icon_opened = "maintopen"

/obj/structure/closet/maintenance/contained/New()
	..()

	new /obj/random/junk(src)
	new /obj/random/junk(src)
	new /obj/random/junk(src)
	new /obj/random/junk(src)
	new /obj/random/junk(src)
	new /obj/random/cash(src)
	new /obj/random/music_tape(src)
	new /obj/random/maintenance/clean(src)
	new /obj/random/maintenance/clean(src)

/obj/structure/closet/maintenance/closet
	icon_state = "maintcloset"
	icon_closed = "maintcloset"
	icon_opened = "maintclosetopen"

/obj/structure/closet/maintenance/closet/contained/New()
	..()

	new /obj/random/junk(src)
	new /obj/random/junk(src)
	new /obj/random/junk(src)
	new /obj/random/cash(src)
	new /obj/random/snack(src)
	new /obj/random/tech_supply(src)
	new /obj/random/drinkbottle(src)
	new /obj/random/maintenance/clean(src)

/obj/structure/closet/maintenance/medical
	icon_state = "maintmedical"
	icon_closed = "maintmedical"
	icon_opened = "maintmedicalopen"

/obj/structure/closet/maintenance/medical/contained/New()
	..()

	new /obj/random/junk(src)
	new /obj/random/junk(src)
	new /obj/random/junk(src)
	new /obj/random/pill(src)
	new /obj/random/firstaid(src)

	if(prob(70))
		new /obj/item/clothing/suit/storage/toggle/labcoat(src)
	if(prob(60))
		new /obj/item/clothing/gloves/latex/nitrile(src)
		new /obj/item/clothing/mask/surgical(src)
	if(prob(40))
		new /obj/item/clothing/accessory/storage/white_vest/alt(src)
	if(prob(30))
		new /obj/item/storage/box/syringes(src)
		new /obj/item/storage/box/autoinjectors(src)

/obj/structure/closet/maintenance/medicalalt
	icon_state = "maintmedicalalt"
	icon_closed = "maintmedicalalt"
	icon_opened = "maintmedicalaltopen"

/obj/structure/closet/maintenance/medicalalt/contained/New()
	..()

	new /obj/random/junk(src)
	new /obj/random/junk(src)
	new /obj/random/junk(src)
	new /obj/random/pill(src)
	new /obj/random/pill(src)
	new /obj/random/pill(src)
	new /obj/random/medical/lite(src)
	new /obj/random/medical/lite(src)
	new /obj/random/medical/lite(src)

	if(prob(5))
		new /obj/item/reagent_containers/hypospray/autoinjector/bicaridine(src)
	if(prob(5))
		new /obj/item/reagent_containers/hypospray/autoinjector/dermaline(src)
	if(prob(5))
		new /obj/item/reagent_containers/hypospray/autoinjector/dexalinp(src)
	if(prob(5))
		new /obj/item/reagent_containers/hypospray/autoinjector/pain(src)

/obj/structure/closet/maintenance/fridge
	name = "abandoned fridge"
	desc = "An old, forgotten, and unwanted fridge. Not the best place to store food."
	icon_state = "maintfridge"
	icon_closed = "maintfridge"
	icon_opened = "maintfridgeopen"

/obj/structure/closet/maintenance/fridge/contained/New()
	..()

	new /obj/random/junk(src)
	new /obj/random/junk(src)
	new /obj/random/junk(src)
	new /obj/random/snack(src)
	new /obj/random/snack(src)
	new /obj/random/snack(src)

	if(prob(60))
		new /obj/item/reagent_containers/food/packaged/sosjerky(src)
	if(prob(50))
		new /obj/item/reagent_containers/food/meat/monkey(src)
		new /obj/item/reagent_containers/food/cheesewedge(src)
	if(prob(40))
		new /obj/item/reagent_containers/food/packaged/nutribar(src)
		new /obj/item/reagent_containers/food/packaged/hematogen(src)
	if(prob(5))
		new /obj/item/material/knife/butch/kitchen(src)
	if(prob(5))
		new /obj/item/reagent_containers/food/meat/human(src)

/obj/structure/closet/maintenance/cargo
	icon_state = "maintcargo"
	icon_closed = "maintcargo"
	icon_opened = "maintcargoopen"

/obj/structure/closet/maintenance/cargo/contained/New()
	..()

	new /obj/random/junk(src)
	new /obj/random/junk(src)
	new /obj/random/junk(src)
	new /obj/random/cash(src)
	new /obj/random/smokes(src)

	if(prob(75))
		new /obj/item/storage/box(src)
		new /obj/item/pen/multi(src)
	if(prob(60))
		new /obj/item/clothing/accessory/armband/cargo(src)
		new /obj/item/clothing/gloves/thick(src)
		new /obj/item/storage/backpack/dufflebag(src)
	if(prob(40))
		new /obj/item/tape_roll(src)
		new /obj/item/packageWrap(src)
		new /obj/item/hand_labeler(src)
	if(prob(10))
		new /obj/item/material/twohanded/baseballbat/metal(src)

/obj/structure/closet/maintenance/security
	icon_state = "maintsec"
	icon_closed = "maintsec"
	icon_opened = "maintsecopen"

/obj/structure/closet/maintenance/security/contained/New()
	..()

	new /obj/random/junk(src)
	new /obj/random/junk(src)
	new /obj/random/junk(src)
	new /obj/random/cash(src)

	if(prob(70))
		new /obj/item/storage/secure/briefcase(src)
	if(prob(40))
		new /obj/item/clothing/accessory/storage/black_vest/alt(src)
	if(prob(30))
		new /obj/item/storage/box/security(src)
		new /obj/item/device/taperecorder(src)
	if(prob(25))
		new /obj/item/grenade/smokebomb(src)
		new /obj/item/device/flashlight/maglight(src)
		new /obj/item/cell/device/high(src)
	if(prob(10))
		new /obj/item/clothing/head/helmet(src)
		new /obj/item/clothing/suit/armor/vest(src)
	if(prob(5))
		new /obj/item/storage/secure/briefcase/money(src)
	if(prob(1))
		new /obj/item/melee/baton(src)

/obj/structure/closet/maintenance/science
	icon_state = "maintscience"
	icon_closed = "maintscience"
	icon_opened = "maintscienceopen"

/obj/structure/closet/maintenance/science/contained/New()
	..()

	new /obj/random/junk(src)
	new /obj/random/junk(src)
	new /obj/random/junk(src)

	if(prob(60))
		new /obj/item/circuitboard/protolathe(src)
		new /obj/item/stack/material/glass/ten(src)
		new /obj/item/stack/material/steel/ten(src)
	if(prob(30))
		new /obj/item/clothing/glasses/hud/standard/science(src)
	if(prob(15))
		new /obj/item/rcd_upgrade/anti_interrupt(src)
	if(prob(15))
		new /obj/item/rcd_upgrade/cooling(src)
	if(prob(15))
		new /obj/item/rcd_upgrade/frames(src)
	if(prob(15))
		new /obj/item/rcd_upgrade/furnishing(src)
	if(prob(15))
		new /obj/item/rcd_upgrade/simple_circuits(src)
	if(prob(5))
		new /obj/item/cell/infinite(src)

/obj/structure/closet/maintenance/hydro
	icon_state = "mainthydro"
	icon_closed = "mainthydro"
	icon_opened = "mainthydroopen"

/obj/structure/closet/maintenance/hydro/contained/New()
	..()

	new /obj/random/junk(src)
	new /obj/random/junk(src)
	new /obj/random/junk(src)
	new /obj/item/seeds/random(src)
	new /obj/item/seeds/random(src)

	if(prob(80))
		new /obj/item/clothing/accessory/armband/hydro(src)
		new /obj/item/clothing/gloves/thick/botany(src)
	if(prob(60))
		new /obj/item/storage/plants(src)
		new /obj/item/material/minihoe(src)
		new /obj/item/device/analyzer/plant_analyzer(src)
	if(prob(40))
		new /obj/item/material/hatchet(src)
	if(prob(35))
		new /obj/item/reagent_containers/vessel/plastic/eznutrient(src)
	if(prob(30))
		new /obj/item/reagent_containers/vessel/plastic/robustharvest(src)
	if(prob(25))
		new /obj/item/reagent_containers/vessel/plastic/left4zed(src)
	if(prob(20))
		new /obj/structure/flora/pottedplant/dead(src)

/obj/structure/closet/maintenance/engineering
	icon_state = "mainteng"
	icon_closed = "mainteng"
	icon_opened = "maintengopen"

/obj/structure/closet/maintenance/engineering/contained/New()
	..()

	new /obj/random/junk(src)
	new /obj/random/junk(src)
	new /obj/random/junk(src)
	new /obj/random/toolbox(src)

	if(prob(60))
		new /obj/item/clothing/gloves/insulated/cheap(src)
		new /obj/item/clothing/head/beret/engineering(src)
		new /obj/item/clothing/mask/gas(src)
	if(prob(40))
		new /obj/item/device/flashlight/upgraded(src)
		new /obj/item/storage/belt/utility(src)
	if(prob(30))
		new /obj/item/clothing/accessory/storage/brown_vest/alt(src)
		new /obj/item/device/multitool(src)
	if(prob(10))
		new /obj/item/clothing/gloves/insulated(src)
	if(prob(3))
		new /obj/item/clothing/suit/space/void/engineering/alt/prepared(src)

/obj/structure/closet/maintenance/bio
	icon_state = "maintbio"
	icon_closed = "maintbio"
	icon_opened = "maintbioopen"

/obj/structure/closet/maintenance/bio/contained/New()
	..()

	new /obj/random/junk(src)
	new /obj/random/junk(src)
	new /obj/random/junk(src)
	new /obj/random/firstaid

	if(prob(75))
		new /obj/item/clothing/head/bio_hood/general(src)
		new /obj/item/clothing/suit/bio_suit/general(src)
	if(prob(50))
		new /obj/item/clothing/mask/gas/clear(src)
		new /obj/item/tank/emergency/oxygen/double(src)
	if(prob(35))
		new /obj/item/storage/box/masks(src)
	if(prob(30))
		new /obj/item/storage/box/gloves(src)
	if(prob(25))
		new /obj/item/storage/box/syringes(src)
	if(prob(15))
		new /obj/item/clothing/glasses/hud/one_eyed/oneye/medical(src)

/obj/structure/closet/maintenance/nanotrasen
	desc = "A forgotten and unwanted closet. Looks stylish enough for its age."
	icon_state = "maintnt"
	icon_closed = "maintnt"
	icon_opened = "maintntopen"

/obj/structure/closet/maintenance/nanotrasen/contained/New()
	..()

	new /obj/random/junk(src)
	new /obj/random/junk(src)
	new /obj/random/junk(src)
	new /obj/random/cash(src)
	new /obj/random/drinkbottle

	if(prob(80))
		new /obj/item/device/radio/headset(src)
		new /obj/item/cane(src)
	if(prob(60))
		new /obj/item/clothing/head/soft/sec/corp/guard(src)
		new /obj/item/clothing/accessory/armband/whitered(src)
		new /obj/item/storage/backpack/nanotrasen(src)
	if(prob(50))
		new /obj/item/clothing/under/track_pants/trackpantswhite(src)
		new /obj/item/clothing/gloves/white(src)
		new /obj/item/clothing/shoes/white(src)
	if(prob(40))
		new /obj/item/storage/briefcase(src)
		new /obj/item/book/wiki/chain_of_command(src)
		new /obj/item/book/wiki/nt_regs(src)
	if(prob(25))
		new /obj/item/clothing/accessory/holster/thigh(src)
	if(prob(10))
		new /obj/item/clothing/suit/armor/pcarrier/light/budget(src)
