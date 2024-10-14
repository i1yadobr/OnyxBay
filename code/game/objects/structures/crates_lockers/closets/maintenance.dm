/obj/structure/closet/maintenance
	name = "abandoned closet"
	desc = "An old, forgotten, and unwanted closet."
	icon_state = "maintcloset"
	icon_closed = "maintcloset"
	icon_opened = "maintclosetopen"

/obj/structure/closet/maintenance/New()
	..()
	icon_opened = "[pick(icon_opened)][rand(1,3)]"
