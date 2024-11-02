/obj/structure/closet/maintenance
	name = "abandoned closet"
	desc = "An old, forgotten, and unwanted closet."
	icon_state = "maint"
	icon_closed = "maint"
	icon_opened = "maintopen"

/obj/structure/closet/maintenance/prefilled

/obj/structure/closet/maintenance/prefilled/WillContain()
	return list(
		/obj/random/closet/maint = rand(2,8)
	)

/obj/structure/closet/maintenance/closet
	icon_state = "maintcloset"
	icon_closed = "maintcloset"
	icon_opened = "maintclosetopen"

/obj/structure/closet/maintenance/closet/prefilled

/obj/structure/closet/maintenance/closet/prefilled/WillContain()
	return list(
		/obj/random/closet/maint/closet = rand(2,8)
	)

/obj/structure/closet/maintenance/medical
	icon_state = "maintmedical"
	icon_closed = "maintmedical"
	icon_opened = "maintmedicalopen"

/obj/structure/closet/maintenance/medical/prefilled

/obj/structure/closet/maintenance/medical/prefilled/WillContain()
	return list(
		/obj/random/closet/maint/medical = rand(2,8)
	)

/obj/structure/closet/maintenance/medicalalt
	icon_state = "maintmedicalalt"
	icon_closed = "maintmedicalalt"
	icon_opened = "maintmedicalaltopen"

/obj/structure/closet/maintenance/medicalalt/prefilled

/obj/structure/closet/maintenance/medicalalt/prefilled/WillContain()
	return list(
		/obj/random/closet/maint/medicalalt = rand(2,8)
	)

/obj/structure/closet/maintenance/fridge
	name = "abandoned fridge"
	desc = "An old, forgotten, and unwanted fridge. Not the best place to store food."
	icon_state = "maintfridge"
	icon_closed = "maintfridge"
	icon_opened = "maintfridgeopen"

/obj/structure/closet/maintenance/fridge/prefilled

/obj/structure/closet/maintenance/fridge/prefilled/WillContain()
	return list(
		/obj/random/closet/maint/fridge = rand(4,8)
	)

/obj/structure/closet/maintenance/cargo
	icon_state = "maintcargo"
	icon_closed = "maintcargo"
	icon_opened = "maintcargoopen"

/obj/structure/closet/maintenance/cargo/prefilled

/obj/structure/closet/maintenance/cargo/prefilled/WillContain()
	return list(
		/obj/random/closet/maint/cargo = rand(2,8)
	)

/obj/structure/closet/maintenance/security
	icon_state = "maintsec"
	icon_closed = "maintsec"
	icon_opened = "maintsecopen"

/obj/structure/closet/maintenance/security/prefilled

/obj/structure/closet/maintenance/security/prefilled/WillContain()
	return list(
		/obj/random/closet/maint/security = rand(2,8)
	)

/obj/structure/closet/maintenance/science
	icon_state = "maintscience"
	icon_closed = "maintscience"
	icon_opened = "maintscienceopen"

/obj/structure/closet/maintenance/science/prefilled

/obj/structure/closet/maintenance/science/prefilled/WillContain()
	return list(
		/obj/random/closet/maint/science = rand(2,8)
	)

/obj/structure/closet/maintenance/hydro
	icon_state = "mainthydro"
	icon_closed = "mainthydro"
	icon_opened = "mainthydroopen"

/obj/structure/closet/maintenance/hydro/prefilled

/obj/structure/closet/maintenance/hydro/prefilled/WillContain()
	return list(
		/obj/random/closet/maint/hydro = rand(2,8)
	)

/obj/structure/closet/maintenance/engineering
	icon_state = "mainteng"
	icon_closed = "mainteng"
	icon_opened = "maintengopen"

/obj/structure/closet/maintenance/engineering/prefilled

/obj/structure/closet/maintenance/engineering/prefilled/WillContain()
	return list(
		/obj/random/closet/maint/engineering = rand(2,8)
	)

/obj/structure/closet/maintenance/bio
	icon_state = "maintbio"
	icon_closed = "maintbio"
	icon_opened = "maintbioopen"

/obj/structure/closet/maintenance/bio/prefilled

/obj/structure/closet/maintenance/bio/prefilled/WillContain()
	return list(
		/obj/random/closet/maint/bio = rand(2,8)
	)

/obj/structure/closet/maintenance/nanotrasen
	desc = "A forgotten and unwanted closet. Looks stylish enough for its age."
	icon_state = "maintnt"
	icon_closed = "maintnt"
	icon_opened = "maintntopen"

/obj/structure/closet/maintenance/nanotrasen/prefilled

/obj/structure/closet/maintenance/nanotrasen/prefilled/WillContain()
	return list(
		/obj/random/closet/maint/nanotrasen = rand(2,8)
	)
