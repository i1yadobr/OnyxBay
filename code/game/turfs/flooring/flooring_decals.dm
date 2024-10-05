// These are objects that destroy themselves and add themselves to the
// decal list of the floor under them. Use them rather than distinct icon_states
// when mapping in interesting floor designs.
var/list/floor_decals = list()

/obj/effect/floor_decal
	name = "floor decal"
	icon = 'icons/turf/flooring/decals.dmi'

	layer = DECAL_LAYER
	appearance_flags = RESET_COLOR
	var/supplied_dir

/obj/effect/floor_decal/New(newloc, newdir, newcolour)
	supplied_dir = newdir
	if(newcolour) color = newcolour
	..(newloc)

/obj/effect/floor_decal/Initialize()
	SHOULD_CALL_PARENT(FALSE)
	if(supplied_dir) set_dir(supplied_dir)
	var/turf/T = get_turf(src)
	if(istype(T, /turf/simulated/floor) || istype(T, /turf/unsimulated/floor))
		layer = T.is_plating() ? DECAL_PLATING_LAYER : DECAL_LAYER
		var/cache_key = "[alpha]-[color]-[dir]-[icon_state]-[plane]-[layer]-[pixel_x]-[pixel_y]"
		if(!floor_decals[cache_key])
			var/image/I = image(icon = src.icon, icon_state = src.icon_state, dir = src.dir)
			I.layer = layer
			I.appearance_flags = appearance_flags
			I.color = src.color
			I.alpha = src.alpha
			I.pixel_x = src.pixel_x
			I.pixel_y = src.pixel_y
			floor_decals[cache_key] = I
		LAZYADD(T.decals, floor_decals[cache_key])
		T.queue_icon_update()
	atom_flags |= ATOM_FLAG_INITIALIZED
	return INITIALIZE_HINT_QDEL

/obj/effect/floor_decal/reset
	name = "reset marker"
	icon_state = "clear"

/obj/effect/floor_decal/reset/Initialize()
	var/turf/T = get_turf(src)
	T.remove_decals()
	T.update_icon()
	atom_flags |= ATOM_FLAG_INITIALIZED
	return INITIALIZE_HINT_QDEL

/obj/effect/floor_decal/carpet
	name = "brown carpet"
	icon = 'icons/turf/flooring/carpet.dmi'
	icon_state = "brown_edges"

/obj/effect/floor_decal/carpet/blue
	name = "blue carpet"
	icon_state = "blue1_edges"

/obj/effect/floor_decal/carpet/blue2
	name = "pale blue carpet"
	icon_state = "blue2_edges"

/obj/effect/floor_decal/carpet/purple
	name = "orange carpet"
	icon_state = "purple_edges"

/obj/effect/floor_decal/carpet/gpurple
	name = "purple carpet"
	icon_state = "gpurple_edges"

/obj/effect/floor_decal/carpet/gpurpledecal
	name = "purple carpet"
	icon_state = "gpurpledecal_edges"

/obj/effect/floor_decal/carpet/orange
	name = "orange carpet"
	icon_state = "orange_edges"

/obj/effect/floor_decal/carpet/green
	name = "green carpet"
	icon_state = "green_edges"

/obj/effect/floor_decal/carpet/oldred
	name = "red carpet"
	icon_state = "oldred_edges"

/obj/effect/floor_decal/carpet/red
	name = "red carpet"
	icon_state = "red_edges"

/obj/effect/floor_decal/carpet/corners
	name = "brown carpet"
	icon_state = "brown_corners"

/obj/effect/floor_decal/carpet/blue/corners
	name = "blue carpet"
	icon_state = "blue1_corners"

/obj/effect/floor_decal/carpet/blue2/corners
	name = "pale blue carpet"
	icon_state = "blue2_corners"

/obj/effect/floor_decal/carpet/purple/corners
	name = "purple carpet"
	icon_state = "purple_corners"

/obj/effect/floor_decal/carpet/gpurple/corners
	name = "purple carpet"
	icon_state = "gpurple_corners"

/obj/effect/floor_decal/carpet/gpurpledecal/corners
	name = "purple carpet"
	icon_state = "gpurpledecal_edges"

/obj/effect/floor_decal/carpet/orange/corners
	name = "orange carpet"
	icon_state = "orange_corners"

/obj/effect/floor_decal/carpet/green/corners
	name = "green carpet"
	icon_state = "green_corners"

/obj/effect/floor_decal/carpet/red/corners
	name = "red carpet"
	icon_state = "red_corners"

/obj/effect/floor_decal/corner
	icon_state = "corner_white"
	alpha = 229

/obj/effect/floor_decal/corner/black
	name = "black corner"
	color = COLOR_BLACK30

/obj/effect/floor_decal/corner/black/diagonal
	icon_state = "corner_white_diagonal"

/obj/effect/floor_decal/corner/black/three_quarters
	icon_state = "corner_white_three_quarters"

/obj/effect/floor_decal/corner/black/full
	icon_state = "corner_white_full"

/obj/effect/floor_decal/corner/black/mono
	icon_state = "corner_white_mono"

/obj/effect/floor_decal/corner/black/diagonal_centre
	icon_state = "corner_white_diagonal_centre"

/obj/effect/floor_decal/corner/black/diagonal_edge
	icon_state = "corner_white_diagonal_edge"

/obj/effect/floor_decal/corner/black/trimline/line
	icon_state = "corner_white_trimline"

/obj/effect/floor_decal/corner/black/trimline/corner
	icon_state = "corner_white_trimline_corner"

/obj/effect/floor_decal/corner/black/trimline/end
	icon_state = "corner_white_trimline_end"

/obj/effect/floor_decal/corner/black/trimline/arrow_cw
	icon_state = "corner_white_trimline_arrow_cw"

/obj/effect/floor_decal/corner/black/trimline/arrow_ccw
	icon_state = "corner_white_trimline_arrow_ccw"

/obj/effect/floor_decal/corner/black/trimline/warning
	icon_state = "corner_white_trimline_warn"

/obj/effect/floor_decal/corner/black/trimline/mid_joiner
	icon_state = "corner_white_trimline_mid"

/obj/effect/floor_decal/corner/black/trimline/filled
	icon_state = "corner_white_trimline_box_fill"

/obj/effect/floor_decal/corner/black/trimline/filled/line
	icon_state = "corner_white_trimline_fill"

/obj/effect/floor_decal/corner/black/trimline/filled/corner
	icon_state = "corner_white_trimline_corner_fill"

/obj/effect/floor_decal/corner/black/trimline/filled/end
	icon_state = "corner_white_trimline_end_fill"

/obj/effect/floor_decal/corner/black/trimline/filled/arrow_cw
	icon_state = "corner_white_trimline_arrow_cw_fill"

/obj/effect/floor_decal/corner/black/trimline/filled/arrow_ccw
	icon_state = "corner_white_trimline_arrow_ccw_fill"

/obj/effect/floor_decal/corner/black/trimline/filled/warning
	icon_state = "corner_white_trimline_warn_fill"

/obj/effect/floor_decal/corner/black/trimline/filled/mid_joiner
	icon_state = "corner_white_trimline_mid_fill"

/obj/effect/floor_decal/corner/black/trimline/filled/shrink_cw
	icon_state = "corner_white_trimline_shrink_cw"

/obj/effect/floor_decal/corner/black/trimline/filled/shrink_ccw
	icon_state = "corner_white_trimline_shrink_ccw"

/obj/effect/floor_decal/corner/blue
	name = "blue corner"
	color = COLOR_BLUE_GRAY

/obj/effect/floor_decal/corner/blue/diagonal
	icon_state = "corner_white_diagonal"

/obj/effect/floor_decal/corner/blue/three_quarters
	icon_state = "corner_white_three_quarters"

/obj/effect/floor_decal/corner/blue/full
	icon_state = "corner_white_full"

/obj/effect/floor_decal/corner/blue/mono
	icon_state = "corner_white_mono"

/obj/effect/floor_decal/corner/blue/diagonal_centre
	icon_state = "corner_white_diagonal_centre"

/obj/effect/floor_decal/corner/blue/diagonal_edge
	icon_state = "corner_white_diagonal_edge"

/obj/effect/floor_decal/corner/blue/trimline/line
	icon_state = "corner_white_trimline"

/obj/effect/floor_decal/corner/blue/trimline/corner
	icon_state = "corner_white_trimline_corner"

/obj/effect/floor_decal/corner/blue/trimline/end
	icon_state = "corner_white_trimline_end"

/obj/effect/floor_decal/corner/blue/trimline/arrow_cw
	icon_state = "corner_white_trimline_arrow_cw"

/obj/effect/floor_decal/corner/blue/trimline/arrow_ccw
	icon_state = "corner_white_trimline_arrow_ccw"

/obj/effect/floor_decal/corner/blue/trimline/warning
	icon_state = "corner_white_trimline_warn"

/obj/effect/floor_decal/corner/blue/trimline/mid_joiner
	icon_state = "corner_white_trimline_mid"

/obj/effect/floor_decal/corner/blue/trimline/filled
	icon_state = "corner_white_trimline_box_fill"

/obj/effect/floor_decal/corner/blue/trimline/filled/line
	icon_state = "corner_white_trimline_fill"

/obj/effect/floor_decal/corner/blue/trimline/filled/corner
	icon_state = "corner_white_trimline_corner_fill"

/obj/effect/floor_decal/corner/blue/trimline/filled/end
	icon_state = "corner_white_trimline_end_fill"

/obj/effect/floor_decal/corner/blue/trimline/filled/arrow_cw
	icon_state = "corner_white_trimline_arrow_cw_fill"

/obj/effect/floor_decal/corner/blue/trimline/filled/arrow_ccw
	icon_state = "corner_white_trimline_arrow_ccw_fill"

/obj/effect/floor_decal/corner/blue/trimline/filled/warning
	icon_state = "corner_white_trimline_warn_fill"

/obj/effect/floor_decal/corner/blue/trimline/filled/mid_joiner
	icon_state = "corner_white_trimline_mid_fill"

/obj/effect/floor_decal/corner/blue/trimline/filled/shrink_cw
	icon_state = "corner_white_trimline_shrink_cw"

/obj/effect/floor_decal/corner/blue/trimline/filled/shrink_ccw
	icon_state = "corner_white_trimline_shrink_ccw"

/obj/effect/floor_decal/corner/paleblue
	name = "pale blue corner"
	color = COLOR_PALE_BLUE_GRAY

/obj/effect/floor_decal/corner/paleblue/diagonal
	icon_state = "corner_white_diagonal"

/obj/effect/floor_decal/corner/paleblue/three_quarters
	icon_state = "corner_white_three_quarters"

/obj/effect/floor_decal/corner/paleblue/full
	icon_state = "corner_white_full"

/obj/effect/floor_decal/corner/paleblue/mono
	icon_state = "corner_white_mono"

/obj/effect/floor_decal/corner/paleblue/diagonal_centre
	icon_state = "corner_white_diagonal_centre"

/obj/effect/floor_decal/corner/paleblue/diagonal_edge
	icon_state = "corner_white_diagonal_edge"

/obj/effect/floor_decal/corner/paleblue/trimline/line
	icon_state = "corner_white_trimline"

/obj/effect/floor_decal/corner/paleblue/trimline/corner
	icon_state = "corner_white_trimline_corner"

/obj/effect/floor_decal/corner/paleblue/trimline/end
	icon_state = "corner_white_trimline_end"

/obj/effect/floor_decal/corner/paleblue/trimline/arrow_cw
	icon_state = "corner_white_trimline_arrow_cw"

/obj/effect/floor_decal/corner/paleblue/trimline/arrow_ccw
	icon_state = "corner_white_trimline_arrow_ccw"

/obj/effect/floor_decal/corner/paleblue/trimline/warning
	icon_state = "corner_white_trimline_warn"

/obj/effect/floor_decal/corner/paleblue/trimline/mid_joiner
	icon_state = "corner_white_trimline_mid"

/obj/effect/floor_decal/corner/paleblue/trimline/filled
	icon_state = "corner_white_trimline_box_fill"

/obj/effect/floor_decal/corner/paleblue/trimline/filled/line
	icon_state = "corner_white_trimline_fill"

/obj/effect/floor_decal/corner/paleblue/trimline/filled/corner
	icon_state = "corner_white_trimline_corner_fill"

/obj/effect/floor_decal/corner/paleblue/trimline/filled/end
	icon_state = "corner_white_trimline_end_fill"

/obj/effect/floor_decal/corner/paleblue/trimline/filled/arrow_cw
	icon_state = "corner_white_trimline_arrow_cw_fill"

/obj/effect/floor_decal/corner/paleblue/trimline/filled/arrow_ccw
	icon_state = "corner_white_trimline_arrow_ccw_fill"

/obj/effect/floor_decal/corner/paleblue/trimline/filled/warning
	icon_state = "corner_white_trimline_warn_fill"

/obj/effect/floor_decal/corner/paleblue/trimline/filled/mid_joiner
	icon_state = "corner_white_trimline_mid_fill"

/obj/effect/floor_decal/corner/paleblue/trimline/filled/shrink_cw
	icon_state = "corner_white_trimline_shrink_cw"

/obj/effect/floor_decal/corner/paleblue/trimline/filled/shrink_ccw
	icon_state = "corner_white_trimline_shrink_ccw"

/obj/effect/floor_decal/corner/green
	name = "green corner"
	color = COLOR_GREEN_GRAY

/obj/effect/floor_decal/corner/green/diagonal
	icon_state = "corner_white_diagonal"

/obj/effect/floor_decal/corner/green/three_quarters
	icon_state = "corner_white_three_quarters"

/obj/effect/floor_decal/corner/green/full
	icon_state = "corner_white_full"

/obj/effect/floor_decal/corner/green/mono
	icon_state = "corner_white_mono"

/obj/effect/floor_decal/corner/green/diagonal_centre
	icon_state = "corner_white_diagonal_centre"

/obj/effect/floor_decal/corner/green/diagonal_centre
	icon_state = "corner_white_diagonal_edge"

/obj/effect/floor_decal/corner/green/trimline/line
	icon_state = "corner_white_trimline"

/obj/effect/floor_decal/corner/green/trimline/corner
	icon_state = "corner_white_trimline_corner"

/obj/effect/floor_decal/corner/green/trimline/end
	icon_state = "corner_white_trimline_end"

/obj/effect/floor_decal/corner/green/trimline/arrow_cw
	icon_state = "corner_white_trimline_arrow_cw"

/obj/effect/floor_decal/corner/green/trimline/arrow_ccw
	icon_state = "corner_white_trimline_arrow_ccw"

/obj/effect/floor_decal/corner/green/trimline/warning
	icon_state = "corner_white_trimline_warn"

/obj/effect/floor_decal/corner/green/trimline/mid_joiner
	icon_state = "corner_white_trimline_mid"

/obj/effect/floor_decal/corner/green/trimline/filled
	icon_state = "corner_white_trimline_box_fill"

/obj/effect/floor_decal/corner/green/trimline/filled/line
	icon_state = "corner_white_trimline_fill"

/obj/effect/floor_decal/corner/green/trimline/filled/corner
	icon_state = "corner_white_trimline_corner_fill"

/obj/effect/floor_decal/corner/green/trimline/filled/end
	icon_state = "corner_white_trimline_end_fill"

/obj/effect/floor_decal/corner/green/trimline/filled/arrow_cw
	icon_state = "corner_white_trimline_arrow_cw_fill"

/obj/effect/floor_decal/corner/green/trimline/filled/arrow_ccw
	icon_state = "corner_white_trimline_arrow_ccw_fill"

/obj/effect/floor_decal/corner/green/trimline/filled/warning
	icon_state = "corner_white_trimline_warn_fill"

/obj/effect/floor_decal/corner/green/trimline/filled/mid_joiner
	icon_state = "corner_white_trimline_mid_fill"

/obj/effect/floor_decal/corner/green/trimline/filled/shrink_cw
	icon_state = "corner_white_trimline_shrink_cw"

/obj/effect/floor_decal/corner/green/trimline/filled/shrink_ccw
	icon_state = "corner_white_trimline_shrink_ccw"

/obj/effect/floor_decal/corner/lime
	name = "lime corner"
	color = COLOR_PALE_GREEN_GRAY

/obj/effect/floor_decal/corner/lime/diagonal
	icon_state = "corner_white_diagonal"

/obj/effect/floor_decal/corner/lime/three_quarters
	icon_state = "corner_white_three_quarters"

/obj/effect/floor_decal/corner/lime/full
	icon_state = "corner_white_full"

/obj/effect/floor_decal/corner/lime/mono
	icon_state = "corner_white_mono"

/obj/effect/floor_decal/corner/lime/diagonal_centre
	icon_state = "corner_white_diagonal_centre"

/obj/effect/floor_decal/corner/lime/diagonal_edge
	icon_state = "corner_white_diagonal_edge"

/obj/effect/floor_decal/corner/lime/trimline/line
	icon_state = "corner_white_trimline"

/obj/effect/floor_decal/corner/lime/trimline/corner
	icon_state = "corner_white_trimline_corner"

/obj/effect/floor_decal/corner/lime/trimline/end
	icon_state = "corner_white_trimline_end"

/obj/effect/floor_decal/corner/lime/trimline/arrow_cw
	icon_state = "corner_white_trimline_arrow_cw"

/obj/effect/floor_decal/corner/lime/trimline/arrow_ccw
	icon_state = "corner_white_trimline_arrow_ccw"

/obj/effect/floor_decal/corner/lime/trimline/warning
	icon_state = "corner_white_trimline_warn"

/obj/effect/floor_decal/corner/lime/trimline/mid_joiner
	icon_state = "corner_white_trimline_mid"

/obj/effect/floor_decal/corner/lime/trimline/filled
	icon_state = "corner_white_trimline_box_fill"

/obj/effect/floor_decal/corner/lime/trimline/filled/line
	icon_state = "corner_white_trimline_fill"

/obj/effect/floor_decal/corner/lime/trimline/filled/corner
	icon_state = "corner_white_trimline_corner_fill"

/obj/effect/floor_decal/corner/lime/trimline/filled/end
	icon_state = "corner_white_trimline_end_fill"

/obj/effect/floor_decal/corner/lime/trimline/filled/arrow_cw
	icon_state = "corner_white_trimline_arrow_cw_fill"

/obj/effect/floor_decal/corner/lime/trimline/filled/arrow_ccw
	icon_state = "corner_white_trimline_arrow_ccw_fill"

/obj/effect/floor_decal/corner/lime/trimline/filled/warning
	icon_state = "corner_white_trimline_warn_fill"

/obj/effect/floor_decal/corner/lime/trimline/filled/mid_joiner
	icon_state = "corner_white_trimline_mid_fill"

/obj/effect/floor_decal/corner/lime/trimline/filled/shrink_cw
	icon_state = "corner_white_trimline_shrink_cw"

/obj/effect/floor_decal/corner/lime/trimline/filled/shrink_ccw
	icon_state = "corner_white_trimline_shrink_ccw"

/obj/effect/floor_decal/corner/yellow
	name = "yellow corner"
	color = COLOR_BROWN

/obj/effect/floor_decal/corner/yellow/diagonal
	icon_state = "corner_white_diagonal"

/obj/effect/floor_decal/corner/yellow/three_quarters
	icon_state = "corner_white_three_quarters"

/obj/effect/floor_decal/corner/yellow/full
	icon_state = "corner_white_full"

/obj/effect/floor_decal/corner/yellow/mono
	icon_state = "corner_white_mono"

/obj/effect/floor_decal/corner/yellow/diagonal_centre
	icon_state = "corner_white_diagonal_centre"

/obj/effect/floor_decal/corner/yellow/diagonal_edge
	icon_state = "corner_white_diagonal_edge"

/obj/effect/floor_decal/corner/yellow/trimline/line
	icon_state = "corner_white_trimline"

/obj/effect/floor_decal/corner/yellow/trimline/corner
	icon_state = "corner_white_trimline_corner"

/obj/effect/floor_decal/corner/yellow/trimline/end
	icon_state = "corner_white_trimline_end"

/obj/effect/floor_decal/corner/yellow/trimline/arrow_cw
	icon_state = "corner_white_trimline_arrow_cw"

/obj/effect/floor_decal/corner/yellow/trimline/arrow_ccw
	icon_state = "corner_white_trimline_arrow_ccw"

/obj/effect/floor_decal/corner/yellow/trimline/warning
	icon_state = "corner_white_trimline_warn"

/obj/effect/floor_decal/corner/yellow/trimline/mid_joiner
	icon_state = "corner_white_trimline_mid"

/obj/effect/floor_decal/corner/yellow/trimline/filled
	icon_state = "corner_white_trimline_box_fill"

/obj/effect/floor_decal/corner/yellow/trimline/filled/line
	icon_state = "corner_white_trimline_fill"

/obj/effect/floor_decal/corner/yellow/trimline/filled/corner
	icon_state = "corner_white_trimline_corner_fill"

/obj/effect/floor_decal/corner/yellow/trimline/filled/end
	icon_state = "corner_white_trimline_end_fill"

/obj/effect/floor_decal/corner/yellow/trimline/filled/arrow_cw
	icon_state = "corner_white_trimline_arrow_cw_fill"

/obj/effect/floor_decal/corner/yellow/trimline/filled/arrow_ccw
	icon_state = "corner_white_trimline_arrow_ccw_fill"

/obj/effect/floor_decal/corner/yellow/trimline/filled/warning
	icon_state = "corner_white_trimline_warn_fill"

/obj/effect/floor_decal/corner/yellow/trimline/filled/mid_joiner
	icon_state = "corner_white_trimline_mid_fill"

/obj/effect/floor_decal/corner/yellow/trimline/filled/shrink_cw
	icon_state = "corner_white_trimline_shrink_cw"

/obj/effect/floor_decal/corner/yellow/trimline/filled/shrink_ccw
	icon_state = "corner_white_trimline_shrink_ccw"

/obj/effect/floor_decal/corner/beige
	name = "beige corner"
	color = COLOR_BEIGE

/obj/effect/floor_decal/corner/beige/diagonal
	icon_state = "corner_white_diagonal"

/obj/effect/floor_decal/corner/beige/three_quarters
	icon_state = "corner_white_three_quarters"

/obj/effect/floor_decal/corner/beige/full
	icon_state = "corner_white_full"

/obj/effect/floor_decal/corner/beige/mono
	icon_state = "corner_white_mono"

/obj/effect/floor_decal/corner/beige/diagonal_centre
	icon_state = "corner_white_diagonal_centre"

/obj/effect/floor_decal/corner/beige/diagonal_edge
	icon_state = "corner_white_diagonal_edge"

/obj/effect/floor_decal/corner/beige/trimline/line
	icon_state = "corner_white_trimline"

/obj/effect/floor_decal/corner/beige/trimline/corner
	icon_state = "corner_white_trimline_corner"

/obj/effect/floor_decal/corner/beige/trimline/end
	icon_state = "corner_white_trimline_end"

/obj/effect/floor_decal/corner/beige/trimline/arrow_cw
	icon_state = "corner_white_trimline_arrow_cw"

/obj/effect/floor_decal/corner/beige/trimline/arrow_ccw
	icon_state = "corner_white_trimline_arrow_ccw"

/obj/effect/floor_decal/corner/beige/trimline/warning
	icon_state = "corner_white_trimline_warn"

/obj/effect/floor_decal/corner/beige/trimline/mid_joiner
	icon_state = "corner_white_trimline_mid"

/obj/effect/floor_decal/corner/beige/trimline/filled
	icon_state = "corner_white_trimline_box_fill"

/obj/effect/floor_decal/corner/beige/trimline/filled/line
	icon_state = "corner_white_trimline_fill"

/obj/effect/floor_decal/corner/beige/trimline/filled/corner
	icon_state = "corner_white_trimline_corner_fill"

/obj/effect/floor_decal/corner/beige/trimline/filled/end
	icon_state = "corner_white_trimline_end_fill"

/obj/effect/floor_decal/corner/beige/trimline/filled/arrow_cw
	icon_state = "corner_white_trimline_arrow_cw_fill"

/obj/effect/floor_decal/corner/beige/trimline/filled/arrow_ccw
	icon_state = "corner_white_trimline_arrow_ccw_fill"

/obj/effect/floor_decal/corner/beige/trimline/filled/warning
	icon_state = "corner_white_trimline_warn_fill"

/obj/effect/floor_decal/corner/beige/trimline/filled/mid_joiner
	icon_state = "corner_white_trimline_mid_fill"

/obj/effect/floor_decal/corner/beige/trimline/filled/shrink_cw
	icon_state = "corner_white_trimline_shrink_cw"

/obj/effect/floor_decal/corner/beige/trimline/filled/shrink_ccw
	icon_state = "corner_white_trimline_shrink_ccw"

/obj/effect/floor_decal/corner/red
	name = "red corner"
	color = COLOR_RED_GRAY

/obj/effect/floor_decal/corner/red/diagonal
	icon_state = "corner_white_diagonal"

/obj/effect/floor_decal/corner/red/three_quarters
	icon_state = "corner_white_three_quarters"

/obj/effect/floor_decal/corner/red/full
	icon_state = "corner_white_full"

/obj/effect/floor_decal/corner/red/mono
	icon_state = "corner_white_mono"

/obj/effect/floor_decal/corner/red/diagonal_centre
	icon_state = "corner_white_diagonal_centre"

/obj/effect/floor_decal/corner/red/diagonal_edge
	icon_state = "corner_white_diagonal_edge"

/obj/effect/floor_decal/corner/red/trimline/line
	icon_state = "corner_white_trimline"

/obj/effect/floor_decal/corner/red/trimline/corner
	icon_state = "corner_white_trimline_corner"

/obj/effect/floor_decal/corner/red/trimline/end
	icon_state = "corner_white_trimline_end"

/obj/effect/floor_decal/corner/red/trimline/arrow_cw
	icon_state = "corner_white_trimline_arrow_cw"

/obj/effect/floor_decal/corner/red/trimline/arrow_ccw
	icon_state = "corner_white_trimline_arrow_ccw"

/obj/effect/floor_decal/corner/red/trimline/warning
	icon_state = "corner_white_trimline_warn"

/obj/effect/floor_decal/corner/red/trimline/mid_joiner
	icon_state = "corner_white_trimline_mid"

/obj/effect/floor_decal/corner/red/trimline/filled
	icon_state = "corner_white_trimline_box_fill"

/obj/effect/floor_decal/corner/red/trimline/filled/line
	icon_state = "corner_white_trimline_fill"

/obj/effect/floor_decal/corner/red/trimline/filled/corner
	icon_state = "corner_white_trimline_corner_fill"

/obj/effect/floor_decal/corner/red/trimline/filled/end
	icon_state = "corner_white_trimline_end_fill"

/obj/effect/floor_decal/corner/red/trimline/filled/arrow_cw
	icon_state = "corner_white_trimline_arrow_cw_fill"

/obj/effect/floor_decal/corner/red/trimline/filled/arrow_ccw
	icon_state = "corner_white_trimline_arrow_ccw_fill"

/obj/effect/floor_decal/corner/red/trimline/filled/warning
	icon_state = "corner_white_trimline_warn_fill"

/obj/effect/floor_decal/corner/red/trimline/filled/mid_joiner
	icon_state = "corner_white_trimline_mid_fill"

/obj/effect/floor_decal/corner/red/trimline/filled/shrink_cw
	icon_state = "corner_white_trimline_shrink_cw"

/obj/effect/floor_decal/corner/red/trimline/filled/shrink_ccw
	icon_state = "corner_white_trimline_shrink_ccw"

/obj/effect/floor_decal/corner/pink
	name = "pink corner"
	color = COLOR_PALE_RED_GRAY

/obj/effect/floor_decal/corner/pink/diagonal
	icon_state = "corner_white_diagonal"

/obj/effect/floor_decal/corner/pink/three_quarters
	icon_state = "corner_white_three_quarters"

/obj/effect/floor_decal/corner/pink/full
	icon_state = "corner_white_full"

/obj/effect/floor_decal/corner/pink/mono
	icon_state = "corner_white_mono"

/obj/effect/floor_decal/corner/pink/diagonal_centre
	icon_state = "corner_white_diagonal_centre"

/obj/effect/floor_decal/corner/pink/diagonal_edge
	icon_state = "corner_white_diagonal_edge"

/obj/effect/floor_decal/corner/pink/trimline/line
	icon_state = "corner_white_trimline"

/obj/effect/floor_decal/corner/pink/trimline/corner
	icon_state = "corner_white_trimline_corner"

/obj/effect/floor_decal/corner/pink/trimline/end
	icon_state = "corner_white_trimline_end"

/obj/effect/floor_decal/corner/pink/trimline/arrow_cw
	icon_state = "corner_white_trimline_arrow_cw"

/obj/effect/floor_decal/corner/pink/trimline/arrow_ccw
	icon_state = "corner_white_trimline_arrow_ccw"

/obj/effect/floor_decal/corner/pink/trimline/warning
	icon_state = "corner_white_trimline_warn"

/obj/effect/floor_decal/corner/pink/trimline/mid_joiner
	icon_state = "corner_white_trimline_mid"

/obj/effect/floor_decal/corner/pink/trimline/filled
	icon_state = "corner_white_trimline_box_fill"

/obj/effect/floor_decal/corner/pink/trimline/filled/line
	icon_state = "corner_white_trimline_fill"

/obj/effect/floor_decal/corner/pink/trimline/filled/corner
	icon_state = "corner_white_trimline_corner_fill"

/obj/effect/floor_decal/corner/pink/trimline/filled/end
	icon_state = "corner_white_trimline_end_fill"

/obj/effect/floor_decal/corner/pink/trimline/filled/arrow_cw
	icon_state = "corner_white_trimline_arrow_cw_fill"

/obj/effect/floor_decal/corner/pink/trimline/filled/arrow_ccw
	icon_state = "corner_white_trimline_arrow_ccw_fill"

/obj/effect/floor_decal/corner/pink/trimline/filled/warning
	icon_state = "corner_white_trimline_warn_fill"

/obj/effect/floor_decal/corner/pink/trimline/filled/mid_joiner
	icon_state = "corner_white_trimline_mid_fill"

/obj/effect/floor_decal/corner/pink/trimline/filled/shrink_cw
	icon_state = "corner_white_trimline_shrink_cw"

/obj/effect/floor_decal/corner/pink/trimline/filled/shrink_ccw
	icon_state = "corner_white_trimline_shrink_ccw"

/obj/effect/floor_decal/corner/purple
	name = "purple corner"
	color = COLOR_PURPLE_GRAY

/obj/effect/floor_decal/corner/purple/diagonal
	icon_state = "corner_white_diagonal"

/obj/effect/floor_decal/corner/purple/three_quarters
	icon_state = "corner_white_three_quarters"

/obj/effect/floor_decal/corner/purple/full
	icon_state = "corner_white_full"

/obj/effect/floor_decal/corner/purple/mono
	icon_state = "corner_white_mono"

/obj/effect/floor_decal/corner/purple/diagonal_centre
	icon_state = "corner_white_diagonal_centre"

/obj/effect/floor_decal/corner/purple/diagonal_edge
	icon_state = "corner_white_diagonal_edge"

/obj/effect/floor_decal/corner/purple/trimline/line
	icon_state = "corner_white_trimline"

/obj/effect/floor_decal/corner/purple/trimline/corner
	icon_state = "corner_white_trimline_corner"

/obj/effect/floor_decal/corner/purple/trimline/end
	icon_state = "corner_white_trimline_end"

/obj/effect/floor_decal/corner/purple/trimline/arrow_cw
	icon_state = "corner_white_trimline_arrow_cw"

/obj/effect/floor_decal/corner/purple/trimline/arrow_ccw
	icon_state = "corner_white_trimline_arrow_ccw"

/obj/effect/floor_decal/corner/purple/trimline/warning
	icon_state = "corner_white_trimline_warn"

/obj/effect/floor_decal/corner/purple/trimline/mid_joiner
	icon_state = "corner_white_trimline_mid"

/obj/effect/floor_decal/corner/purple/trimline/filled
	icon_state = "corner_white_trimline_box_fill"

/obj/effect/floor_decal/corner/purple/trimline/filled/line
	icon_state = "corner_white_trimline_fill"

/obj/effect/floor_decal/corner/purple/trimline/filled/corner
	icon_state = "corner_white_trimline_corner_fill"

/obj/effect/floor_decal/corner/purple/trimline/filled/end
	icon_state = "corner_white_trimline_end_fill"

/obj/effect/floor_decal/corner/purple/trimline/filled/arrow_cw
	icon_state = "corner_white_trimline_arrow_cw_fill"

/obj/effect/floor_decal/corner/purple/trimline/filled/arrow_ccw
	icon_state = "corner_white_trimline_arrow_ccw_fill"

/obj/effect/floor_decal/corner/purple/trimline/filled/warning
	icon_state = "corner_white_trimline_warn_fill"

/obj/effect/floor_decal/corner/purple/trimline/filled/mid_joiner
	icon_state = "corner_white_trimline_mid_fill"

/obj/effect/floor_decal/corner/purple/trimline/filled/shrink_cw
	icon_state = "corner_white_trimline_shrink_cw"

/obj/effect/floor_decal/corner/purple/trimline/filled/shrink_ccw
	icon_state = "corner_white_trimline_shrink_ccw"

/obj/effect/floor_decal/corner/mauve
	name = "mauve corner"
	color = COLOR_PALE_PURPLE_GRAY

/obj/effect/floor_decal/corner/mauve/diagonal
	icon_state = "corner_white_diagonal"

/obj/effect/floor_decal/corner/mauve/three_quarters
	icon_state = "corner_white_three_quarters"

/obj/effect/floor_decal/corner/mauve/full
	icon_state = "corner_white_full"

/obj/effect/floor_decal/corner/mauve/mono
	icon_state = "corner_white_mono"

/obj/effect/floor_decal/corner/mauve/diagonal_centre
	icon_state = "corner_white_diagonal_centre"

/obj/effect/floor_decal/corner/mauve/diagonal_edge
	icon_state = "corner_white_diagonal_edge"

/obj/effect/floor_decal/corner/mauve/trimline/line
	icon_state = "corner_white_trimline"

/obj/effect/floor_decal/corner/mauve/trimline/corner
	icon_state = "corner_white_trimline_corner"

/obj/effect/floor_decal/corner/mauve/trimline/end
	icon_state = "corner_white_trimline_end"

/obj/effect/floor_decal/corner/mauve/trimline/arrow_cw
	icon_state = "corner_white_trimline_arrow_cw"

/obj/effect/floor_decal/corner/mauve/trimline/arrow_ccw
	icon_state = "corner_white_trimline_arrow_ccw"

/obj/effect/floor_decal/corner/mauve/trimline/warning
	icon_state = "corner_white_trimline_warn"

/obj/effect/floor_decal/corner/mauve/trimline/mid_joiner
	icon_state = "corner_white_trimline_mid"

/obj/effect/floor_decal/corner/mauve/trimline/filled
	icon_state = "corner_white_trimline_box_fill"

/obj/effect/floor_decal/corner/mauve/trimline/filled/line
	icon_state = "corner_white_trimline_fill"

/obj/effect/floor_decal/corner/mauve/trimline/filled/corner
	icon_state = "corner_white_trimline_corner_fill"

/obj/effect/floor_decal/corner/mauve/trimline/filled/end
	icon_state = "corner_white_trimline_end_fill"

/obj/effect/floor_decal/corner/mauve/trimline/filled/arrow_cw
	icon_state = "corner_white_trimline_arrow_cw_fill"

/obj/effect/floor_decal/corner/mauve/trimline/filled/arrow_ccw
	icon_state = "corner_white_trimline_arrow_ccw_fill"

/obj/effect/floor_decal/corner/mauve/trimline/filled/warning
	icon_state = "corner_white_trimline_warn_fill"

/obj/effect/floor_decal/corner/mauve/trimline/filled/mid_joiner
	icon_state = "corner_white_trimline_mid_fill"

/obj/effect/floor_decal/corner/mauve/trimline/filled/shrink_cw
	icon_state = "corner_white_trimline_shrink_cw"

/obj/effect/floor_decal/corner/mauve/trimline/filled/shrink_ccw
	icon_state = "corner_white_trimline_shrink_ccw"

/obj/effect/floor_decal/corner/orange
	name = "orange corner"
	color = COLOR_DARK_ORANGE

/obj/effect/floor_decal/corner/orange/diagonal
	icon_state = "corner_white_diagonal"

/obj/effect/floor_decal/corner/orange/three_quarters
	icon_state = "corner_white_three_quarters"

/obj/effect/floor_decal/corner/orange/full
	icon_state = "corner_white_full"

/obj/effect/floor_decal/corner/orange/mono
	icon_state = "corner_white_mono"

/obj/effect/floor_decal/corner/orange/diagonal_centre
	icon_state = "corner_white_diagonal_centre"

/obj/effect/floor_decal/corner/orange/diagonal_edge
	icon_state = "corner_white_diagonal_edge"

/obj/effect/floor_decal/corner/orange/trimline/line
	icon_state = "corner_white_trimline"

/obj/effect/floor_decal/corner/orange/trimline/corner
	icon_state = "corner_white_trimline_corner"

/obj/effect/floor_decal/corner/orange/trimline/end
	icon_state = "corner_white_trimline_end"

/obj/effect/floor_decal/corner/orange/trimline/arrow_cw
	icon_state = "corner_white_trimline_arrow_cw"

/obj/effect/floor_decal/corner/orange/trimline/arrow_ccw
	icon_state = "corner_white_trimline_arrow_ccw"

/obj/effect/floor_decal/corner/orange/trimline/warning
	icon_state = "corner_white_trimline_warn"

/obj/effect/floor_decal/corner/orange/trimline/mid_joiner
	icon_state = "corner_white_trimline_mid"

/obj/effect/floor_decal/corner/orange/trimline/filled
	icon_state = "corner_white_trimline_box_fill"

/obj/effect/floor_decal/corner/orange/trimline/filled/line
	icon_state = "corner_white_trimline_fill"

/obj/effect/floor_decal/corner/orange/trimline/filled/corner
	icon_state = "corner_white_trimline_corner_fill"

/obj/effect/floor_decal/corner/orange/trimline/filled/end
	icon_state = "corner_white_trimline_end_fill"

/obj/effect/floor_decal/corner/orange/trimline/filled/arrow_cw
	icon_state = "corner_white_trimline_arrow_cw_fill"

/obj/effect/floor_decal/corner/orange/trimline/filled/arrow_ccw
	icon_state = "corner_white_trimline_arrow_ccw_fill"

/obj/effect/floor_decal/corner/orange/trimline/filled/warning
	icon_state = "corner_white_trimline_warn_fill"

/obj/effect/floor_decal/corner/orange/trimline/filled/mid_joiner
	icon_state = "corner_white_trimline_mid_fill"

/obj/effect/floor_decal/corner/orange/trimline/filled/shrink_cw
	icon_state = "corner_white_trimline_shrink_cw"

/obj/effect/floor_decal/corner/orange/trimline/filled/shrink_ccw
	icon_state = "corner_white_trimline_shrink_ccw"

/obj/effect/floor_decal/corner/brown
	name = "brown corner"
	color = COLOR_DARK_BROWN

/obj/effect/floor_decal/corner/brown/diagonal
	icon_state = "corner_white_diagonal"

/obj/effect/floor_decal/corner/brown/three_quarters
	icon_state = "corner_white_three_quarters"

/obj/effect/floor_decal/corner/brown/full
	icon_state = "corner_white_full"

/obj/effect/floor_decal/corner/brown/mono
	icon_state = "corner_white_mono"

/obj/effect/floor_decal/corner/brown/diagonal_centre
	icon_state = "corner_white_diagonal_centre"

/obj/effect/floor_decal/corner/brown/diagonal_edge
	icon_state = "corner_white_diagonal_edge"

/obj/effect/floor_decal/corner/brown/trimline/line
	icon_state = "corner_white_trimline"

/obj/effect/floor_decal/corner/brown/trimline/corner
	icon_state = "corner_white_trimline_corner"

/obj/effect/floor_decal/corner/brown/trimline/end
	icon_state = "corner_white_trimline_end"

/obj/effect/floor_decal/corner/brown/trimline/arrow_cw
	icon_state = "corner_white_trimline_arrow_cw"

/obj/effect/floor_decal/corner/brown/trimline/arrow_ccw
	icon_state = "corner_white_trimline_arrow_ccw"

/obj/effect/floor_decal/corner/brown/trimline/warning
	icon_state = "corner_white_trimline_warn"

/obj/effect/floor_decal/corner/brown/trimline/mid_joiner
	icon_state = "corner_white_trimline_mid"

/obj/effect/floor_decal/corner/brown/trimline/filled
	icon_state = "corner_white_trimline_box_fill"

/obj/effect/floor_decal/corner/brown/trimline/filled/line
	icon_state = "corner_white_trimline_fill"

/obj/effect/floor_decal/corner/brown/trimline/filled/corner
	icon_state = "corner_white_trimline_corner_fill"

/obj/effect/floor_decal/corner/brown/trimline/filled/end
	icon_state = "corner_white_trimline_end_fill"

/obj/effect/floor_decal/corner/brown/trimline/filled/arrow_cw
	icon_state = "corner_white_trimline_arrow_cw_fill"

/obj/effect/floor_decal/corner/brown/trimline/filled/arrow_ccw
	icon_state = "corner_white_trimline_arrow_ccw_fill"

/obj/effect/floor_decal/corner/brown/trimline/filled/warning
	icon_state = "corner_white_trimline_warn_fill"

/obj/effect/floor_decal/corner/brown/trimline/filled/mid_joiner
	icon_state = "corner_white_trimline_mid_fill"

/obj/effect/floor_decal/corner/brown/trimline/filled/shrink_cw
	icon_state = "corner_white_trimline_shrink_cw"

/obj/effect/floor_decal/corner/brown/trimline/filled/shrink_ccw
	icon_state = "corner_white_trimline_shrink_ccw"

/obj/effect/floor_decal/corner/white
	name = "white corner"
	icon_state = "corner_white"

/obj/effect/floor_decal/corner/white/diagonal
	icon_state = "corner_white_diagonal"

/obj/effect/floor_decal/corner/white/three_quarters
	icon_state = "corner_white_three_quarters"

/obj/effect/floor_decal/corner/white/full
	icon_state = "corner_white_full"

/obj/effect/floor_decal/corner/white/mono
	icon_state = "corner_white_mono"

/obj/effect/floor_decal/corner/white/diagonal_centre
	icon_state = "corner_white_diagonal_centre"

/obj/effect/floor_decal/corner/white/diagonal_edge
	icon_state = "corner_white_diagonal_edge"

/obj/effect/floor_decal/corner/white/trimline/line
	icon_state = "corner_white_trimline"

/obj/effect/floor_decal/corner/white/trimline/corner
	icon_state = "corner_white_trimline_corner"

/obj/effect/floor_decal/corner/white/trimline/end
	icon_state = "corner_white_trimline_end"

/obj/effect/floor_decal/corner/white/trimline/arrow_cw
	icon_state = "corner_white_trimline_arrow_cw"

/obj/effect/floor_decal/corner/white/trimline/arrow_ccw
	icon_state = "corner_white_trimline_arrow_ccw"

/obj/effect/floor_decal/corner/white/trimline/warning
	icon_state = "corner_white_trimline_warn"

/obj/effect/floor_decal/corner/white/trimline/mid_joiner
	icon_state = "corner_white_trimline_mid"

/obj/effect/floor_decal/corner/white/trimline/filled
	icon_state = "corner_white_trimline_box_fill"

/obj/effect/floor_decal/corner/white/trimline/filled/line
	icon_state = "corner_white_trimline_fill"

/obj/effect/floor_decal/corner/white/trimline/filled/corner
	icon_state = "corner_white_trimline_corner_fill"

/obj/effect/floor_decal/corner/white/trimline/filled/end
	icon_state = "corner_white_trimline_end_fill"

/obj/effect/floor_decal/corner/white/trimline/filled/arrow_cw
	icon_state = "corner_white_trimline_arrow_cw_fill"

/obj/effect/floor_decal/corner/white/trimline/filled/arrow_ccw
	icon_state = "corner_white_trimline_arrow_ccw_fill"

/obj/effect/floor_decal/corner/white/trimline/filled/warning
	icon_state = "corner_white_trimline_warn_fill"

/obj/effect/floor_decal/corner/white/trimline/filled/mid_joiner
	icon_state = "corner_white_trimline_mid_fill"

/obj/effect/floor_decal/corner/white/trimline/filled/shrink_cw
	icon_state = "corner_white_trimline_shrink_cw"

/obj/effect/floor_decal/corner/white/trimline/filled/shrink_ccw
	icon_state = "corner_white_trimline_shrink_ccw"

/obj/effect/floor_decal/corner/grey
	name = "grey corner"
	color = COLOR_GRAY_SPECIAL

/obj/effect/floor_decal/corner/grey/diagonal
	icon_state = "corner_white_diagonal"

/obj/effect/floor_decal/corner/grey/three_quarters
	icon_state = "corner_white_three_quarters"

/obj/effect/floor_decal/corner/grey/full
	icon_state = "corner_white_full"

/obj/effect/floor_decal/corner/grey/mono
	icon_state = "corner_white_mono"

/obj/effect/floor_decal/corner/grey/diagonal_centre
	icon_state = "corner_white_diagonal_centre"

/obj/effect/floor_decal/corner/grey/diagonal_edge
	icon_state = "corner_white_diagonal_edge"

/obj/effect/floor_decal/corner/grey/trimline/line
	icon_state = "corner_white_trimline"

/obj/effect/floor_decal/corner/grey/trimline/corner
	icon_state = "corner_white_trimline_corner"

/obj/effect/floor_decal/corner/grey/trimline/end
	icon_state = "corner_white_trimline_end"

/obj/effect/floor_decal/corner/grey/trimline/arrow_cw
	icon_state = "corner_white_trimline_arrow_cw"

/obj/effect/floor_decal/corner/grey/trimline/arrow_ccw
	icon_state = "corner_white_trimline_arrow_ccw"

/obj/effect/floor_decal/corner/grey/trimline/warning
	icon_state = "corner_white_trimline_warn"

/obj/effect/floor_decal/corner/grey/trimline/mid_joiner
	icon_state = "corner_white_trimline_mid"

/obj/effect/floor_decal/corner/grey/trimline/filled
	icon_state = "corner_white_trimline_box_fill"

/obj/effect/floor_decal/corner/grey/trimline/filled/line
	icon_state = "corner_white_trimline_fill"

/obj/effect/floor_decal/corner/grey/trimline/filled/corner
	icon_state = "corner_white_trimline_corner_fill"

/obj/effect/floor_decal/corner/grey/trimline/filled/end
	icon_state = "corner_white_trimline_end_fill"

/obj/effect/floor_decal/corner/grey/trimline/filled/arrow_cw
	icon_state = "corner_white_trimline_arrow_cw_fill"

/obj/effect/floor_decal/corner/grey/trimline/filled/arrow_ccw
	icon_state = "corner_white_trimline_arrow_ccw_fill"

/obj/effect/floor_decal/corner/grey/trimline/filled/warning
	icon_state = "corner_white_trimline_warn_fill"

/obj/effect/floor_decal/corner/grey/trimline/filled/mid_joiner
	icon_state = "corner_white_trimline_mid_fill"

/obj/effect/floor_decal/corner/grey/trimline/filled/shrink_cw
	icon_state = "corner_white_trimline_shrink_cw"

/obj/effect/floor_decal/corner/grey/trimline/filled/shrink_ccw
	icon_state = "corner_white_trimline_shrink_ccw"

//ALT CORNER DECALS

/obj/effect/floor_decal/corner/alt
	icon = 'icons/turf/flooring/newdecals.dmi'
	icon_state = "brown"

/obj/effect/floor_decal/corner/alt/white
	icon_state = "white"

/obj/effect/floor_decal/corner/alt/white/corner
	icon_state = "whitecorner"

/obj/effect/floor_decal/corner/alt/blue
	icon_state = "blue"

/obj/effect/floor_decal/corner/alt/blue/corner
	icon_state = "bluecorner"

/obj/effect/floor_decal/corner/alt/green
	icon_state = "green"

/obj/effect/floor_decal/corner/alt/green/corner
	icon_state = "greencorner"

/obj/effect/floor_decal/corner/alt/darkgreen
	icon_state = "darkgreen"

/obj/effect/floor_decal/corner/alt/darkgreen/corner
	icon_state = "darkgreencorner"

/obj/effect/floor_decal/corner/alt/red
	icon_state = "red"

/obj/effect/floor_decal/corner/alt/red/corner
	icon_state = "redcorner"

/obj/effect/floor_decal/corner/alt/yellow
	icon_state = "yellow"

/obj/effect/floor_decal/corner/alt/yellow/corner
	icon_state = "yellowcorner"

/obj/effect/floor_decal/corner/alt/purple
	icon_state = "purple"

/obj/effect/floor_decal/corner/alt/purple/corner
	icon_state = "purplecorner"

/obj/effect/floor_decal/corner/alt/brown
	icon_state = "brown"

/obj/effect/floor_decal/corner/alt/brown/corner
	icon_state = "browncorner"

/obj/effect/floor_decal/corner/old
	icon_state = "corner_oldtile"
	alpha = 255

/obj/effect/floor_decal/corner/old/red
	name = "red corner"
	color = "#8C4B4E"

/obj/effect/floor_decal/corner/old/red/diagonal
	icon_state = "corner_oldtile_diagonal"

/obj/effect/floor_decal/corner/old/red/three_quarters
	icon_state = "corner_oldtile_three_quarters"

/obj/effect/floor_decal/corner/old/red/full
	icon_state = "corner_oldtile_full"

/obj/effect/floor_decal/corner/old/red/mono
	icon_state = "corner_oldtile_mono"

/obj/effect/floor_decal/corner/old/red/diagonal_centre
	icon_state = "corner_oldtile_diagonal_centre"

/obj/effect/floor_decal/corner/old/red/diagonal_edge
	icon_state = "corner_oldtile_diagonal_edge"

/obj/effect/floor_decal/corner/old/green
	name = "green corner"
	color = "#4A5F50"

/obj/effect/floor_decal/corner/old/green/diagonal
	icon_state = "corner_oldtile_diagonal"

/obj/effect/floor_decal/corner/old/green/three_quarters
	icon_state = "corner_oldtile_three_quarters"

/obj/effect/floor_decal/corner/old/green/full
	icon_state = "corner_oldtile_full"

/obj/effect/floor_decal/corner/old/green/mono
	icon_state = "corner_oldtile_mono"

/obj/effect/floor_decal/corner/old/green/diagonal_centre
	icon_state = "corner_oldtile_diagonal_centre"

/obj/effect/floor_decal/corner/old/green/diagonal_edge
	icon_state = "corner_oldtile_diagonal_edge"

/obj/effect/floor_decal/corner/old/whitegreen
	name = "whitegreen corner"
	color = "#3F6452"

/obj/effect/floor_decal/corner/old/whitegreen/diagonal
	icon_state = "corner_oldtile_diagonal"

/obj/effect/floor_decal/corner/old/whitegreen/three_quarters
	icon_state = "corner_oldtile_three_quarters"

/obj/effect/floor_decal/corner/old/whitegreen/full
	icon_state = "corner_oldtile_full"

/obj/effect/floor_decal/corner/old/whitegreen/mono
	icon_state = "corner_oldtile_mono"

/obj/effect/floor_decal/corner/old/whitegreen/diagonal_centre
	icon_state = "corner_oldtile_diagonal_centre"

/obj/effect/floor_decal/corner/old/whitegreen/diagonal_edge
	icon_state = "corner_oldtile_diagonal_edge"

/obj/effect/floor_decal/corner/old/cyan
	name = "cyan corner"
	color = "#486164"

/obj/effect/floor_decal/corner/old/cyan/diagonal
	icon_state = "corner_oldtile_diagonal"

/obj/effect/floor_decal/corner/old/cyan/three_quarters
	icon_state = "corner_oldtile_three_quarters"

/obj/effect/floor_decal/corner/old/cyan/full
	icon_state = "corner_oldtile_full"

/obj/effect/floor_decal/corner/old/cyan/mono
	icon_state = "corner_oldtile_mono"

/obj/effect/floor_decal/corner/old/cyan/diagonal_centre
	icon_state = "corner_oldtile_diagonal_centre"

/obj/effect/floor_decal/corner/old/cyan/diagonal_edge
	icon_state = "corner_oldtile_diagonal_edge"

/obj/effect/floor_decal/corner/old/teal
	name = "teal corner"
	color = "#3C6568"

/obj/effect/floor_decal/corner/old/teal/diagonal
	icon_state = "corner_oldtile_diagonal"

/obj/effect/floor_decal/corner/old/teal/three_quarters
	icon_state = "corner_oldtile_three_quarters"

/obj/effect/floor_decal/corner/old/teal/full
	icon_state = "corner_oldtile_full"

/obj/effect/floor_decal/corner/old/teal/mono
	icon_state = "corner_oldtile_mono"

/obj/effect/floor_decal/corner/old/teal/diagonal_centre
	icon_state = "corner_oldtile_diagonal_centre"

/obj/effect/floor_decal/corner/old/teal/diagonal_edge
	icon_state = "corner_oldtile_diagonal_edge"

/obj/effect/floor_decal/corner/old/blue
	name = "blue corner"
	color = "#3F526B"

/obj/effect/floor_decal/corner/old/blue/diagonal
	icon_state = "corner_oldtile_diagonal"

/obj/effect/floor_decal/corner/old/blue/three_quarters
	icon_state = "corner_oldtile_three_quarters"

/obj/effect/floor_decal/corner/old/blue/full
	icon_state = "corner_oldtile_full"

/obj/effect/floor_decal/corner/old/blue/mono
	icon_state = "corner_oldtile_mono"

/obj/effect/floor_decal/corner/old/blue/diagonal_centre
	icon_state = "corner_oldtile_diagonal_centre"

/obj/effect/floor_decal/corner/old/blue/diagonal_edge
	icon_state = "corner_oldtile_diagonal_edge"

/obj/effect/floor_decal/corner/old/purple
	name = "purple corner"
	color = "#71677F"

/obj/effect/floor_decal/corner/old/purple/diagonal
	icon_state = "corner_oldtile_diagonal"

/obj/effect/floor_decal/corner/old/purple/three_quarters
	icon_state = "corner_oldtile_three_quarters"

/obj/effect/floor_decal/corner/old/purple/full
	icon_state = "corner_oldtile_full"

/obj/effect/floor_decal/corner/old/purple/mono
	icon_state = "corner_oldtile_mono"

/obj/effect/floor_decal/corner/old/purple/diagonal_centre
	icon_state = "corner_oldtile_diagonal_centre"

/obj/effect/floor_decal/corner/old/purple/diagonal_edge
	icon_state = "corner_oldtile_diagonal_edge"

/obj/effect/floor_decal/corner/old/yellow
	name = "yellow corner"
	color = "#95784F"

/obj/effect/floor_decal/corner/old/yellow/diagonal
	icon_state = "corner_oldtile_diagonal"

/obj/effect/floor_decal/corner/old/yellow/three_quarters
	icon_state = "corner_oldtile_three_quarters"

/obj/effect/floor_decal/corner/old/yellow/full
	icon_state = "corner_oldtile_full"

/obj/effect/floor_decal/corner/old/yellow/mono
	icon_state = "corner_oldtile_mono"

/obj/effect/floor_decal/corner/old/yellow/diagonal_centre
	icon_state = "corner_oldtile_diagonal_centre"

/obj/effect/floor_decal/corner/old/yellow/diagonal_edge
	icon_state = "corner_oldtile_diagonal_edge"

/obj/effect/floor_decal/corner/old/gray
	name = "red corner"
	color = COLOR_GRAY_SPECIAL

/obj/effect/floor_decal/corner/old/gray/diagonal
	icon_state = "corner_oldtile_diagonal"

/obj/effect/floor_decal/corner/old/gray/three_quarters
	icon_state = "corner_oldtile_three_quarters"

/obj/effect/floor_decal/corner/old/gray/full
	icon_state = "corner_oldtile_full"

/obj/effect/floor_decal/corner/old/gray/mono
	icon_state = "corner_oldtile_mono"

/obj/effect/floor_decal/corner/old/gray/diagonal_centre
	icon_state = "corner_oldtile_diagonal_centre"

/obj/effect/floor_decal/corner/old/gray/diagonal_edge
	icon_state = "corner_oldtile_diagonal_edge"

/obj/effect/floor_decal/corner_steel_grid
	name = "corner steel_grid"
	icon_state = "steel_grid"

/obj/effect/floor_decal/corner_steel_grid/diagonal
	name = "corner tsteel_grid diagonal"
	icon_state = "steel_grid_diagonal"

/obj/effect/floor_decal/corner_steel_grid/three_quarters
	name = "corner steel_grid three quarters"
	icon_state = "steel_grid_three_quarters"

/obj/effect/floor_decal/corner_steel_grid/full
	name = "corner steel_grid full"
	icon_state = "steel_grid_full"

/obj/effect/floor_decal/spline/plain
	name = "spline - plain"
	icon_state = "spline_plain"
	alpha = 229

/obj/effect/floor_decal/spline/plain/corner
	icon_state = "spline_plain_corner"

/obj/effect/floor_decal/rust
	name = "rust"
	icon_state = "rust"
	alpha = 120

/obj/effect/floor_decal/oldflood
	name = "oldfloor"
	icon_state = "oldfloor"
	alpha = 120

/obj/effect/floor_decal/sandfloordec
	name = "sandfloor"
	icon = 'icons/turf/flooring/decals.dmi'
	icon_state = "sandfloordec"
	alpha = 209

/obj/effect/floor_decal/sandfloordec/asteroid
	name = "asteroid floor"
	icon_state = "asteroidfloordec"

/obj/effect/floor_decal/junglepath
	name = "junglepath"
	icon = 'icons/turf/jungle_turfs.dmi'
	icon_state = "pathway"

/obj/effect/floor_decal/junglepath/end
	name = "junglepath"
	icon = 'icons/turf/jungle_turfs.dmi'
	icon_state = "pathway_end"

/obj/effect/floor_decal/jungledirt
	name = "dirt"
	icon = 'icons/turf/jungle_turfs.dmi'
	icon_state = "dirt"

/obj/effect/floor_decal/jungledirt/grass
	name = "grass"
	icon_state = "grass1"

/obj/effect/floor_decal/jungledirt/grass/edge
	icon_state = "grassdirt_edge"

/obj/effect/floor_decal/jungledirt/grass/corner
	icon_state = "grassdirt_corner"

/obj/effect/floor_decal/jungledirt/grass/corner2
	icon_state = "grassdirt_corner2"

/obj/effect/floor_decal/stairs
	name = "stairs"
	icon_state = "stairs"

/obj/effect/floor_decal/stairs/wood
	color = COLOR_WOOD

/obj/effect/floor_decal/stairs/darkwood
	color = "#603413"

/obj/effect/floor_decal/spline/plain/black
	color = COLOR_BLACK30

/obj/effect/floor_decal/spline/plain/corner/black
	color = COLOR_BLACK30

/obj/effect/floor_decal/spline/plain/blue
	color = COLOR_BLUE_GRAY

/obj/effect/floor_decal/spline/plain/corner/blue
	color = COLOR_BLUE_GRAY

/obj/effect/floor_decal/spline/plain/paleblue
	color = COLOR_PALE_BLUE_GRAY

/obj/effect/floor_decal/spline/plain/corner/paleblue
	color = COLOR_PALE_BLUE_GRAY

/obj/effect/floor_decal/spline/plain/green
	color = COLOR_GREEN_GRAY

/obj/effect/floor_decal/spline/plain/corner/green
	color = COLOR_GREEN_GRAY

/obj/effect/floor_decal/spline/plain/lime
	color = COLOR_PALE_GREEN_GRAY

/obj/effect/floor_decal/spline/plain/corner/lime
	color = COLOR_PALE_GREEN_GRAY

/obj/effect/floor_decal/spline/plain/yellow
	color = COLOR_BROWN

/obj/effect/floor_decal/spline/plain/corner/yellow
	color = COLOR_BROWN

/obj/effect/floor_decal/spline/plain/beige
	color = COLOR_BEIGE

/obj/effect/floor_decal/spline/plain/corner/beige
	color = COLOR_BEIGE

/obj/effect/floor_decal/spline/plain/red
	color = COLOR_RED_GRAY

/obj/effect/floor_decal/spline/plain/corner/red
	color = COLOR_RED_GRAY

/obj/effect/floor_decal/spline/plain/pink
	color = COLOR_PALE_RED_GRAY

/obj/effect/floor_decal/spline/plain/corner/pink
	color = COLOR_PALE_RED_GRAY

/obj/effect/floor_decal/spline/plain/purple
	color = COLOR_PURPLE_GRAY

/obj/effect/floor_decal/spline/plain/corner/purple
	color = COLOR_PURPLE_GRAY

/obj/effect/floor_decal/spline/plain/mauve
	color = COLOR_PALE_PURPLE_GRAY

/obj/effect/floor_decal/spline/plain/corner/mauve
	color = COLOR_PALE_PURPLE_GRAY

/obj/effect/floor_decal/spline/plain/orange
	color = COLOR_DARK_ORANGE

/obj/effect/floor_decal/spline/plain/corner/orange
	color = COLOR_DARK_ORANGE

/obj/effect/floor_decal/spline/plain/brown
	color = COLOR_DARK_BROWN

/obj/effect/floor_decal/spline/plain/corner/brown
	color = COLOR_DARK_BROWN

/obj/effect/floor_decal/spline/plain/white
	color = COLOR_WHITE

/obj/effect/floor_decal/spline/plain/corner/white
	color = COLOR_WHITE

/obj/effect/floor_decal/spline/plain/grey
	color = COLOR_GRAY_SPECIAL

/obj/effect/floor_decal/spline/plain/corner/grey
	color = COLOR_GRAY_SPECIAL

/obj/effect/floor_decal/spline/fancy
	name = "spline - fancy"
	icon_state = "spline_fancy"

/obj/effect/floor_decal/spline/fancy/corner
	icon_state = "spline_fancy_corner"

/obj/effect/floor_decal/spline/fancy/wood
	name = "spline - wood"
	color = "#cb9e04"

/obj/effect/floor_decal/spline/fancy/wood/corner
	icon_state = "spline_fancy_corner"

/obj/effect/floor_decal/spline/fancy/wood/cee
	icon_state = "spline_fancy_cee"

/obj/effect/floor_decal/spline/fancy/wood/three_quarters
	icon_state = "spline_fancy_full"

/obj/effect/floor_decal/industrial/warning
	name = "hazard stripes"
	icon_state = "warning"

/obj/effect/floor_decal/industrial/warning/corner
	icon_state = "warningcorner"

/obj/effect/floor_decal/industrial/warning/full
	icon_state = "warningfull"

/obj/effect/floor_decal/industrial/warning/full/tile
	icon_state = "warningfulltile"

/obj/effect/floor_decal/industrial/warning/cee
	icon_state = "warningcee"

/obj/effect/floor_decal/industrial/warning/dust
	name = "hazard stripes"
	icon_state = "warning_dust"

/obj/effect/floor_decal/industrial/warning/dust/corner
	name = "hazard stripes"
	icon_state = "warningcorner_dust"

/obj/effect/floor_decal/industrial/warning/dust/cee
	name = "hazard stripes"
	icon_state = "warningcee_dust"

/obj/effect/floor_decal/industrial/warning/dust/full
	name = "hazard stripes"
	icon_state = "warningfull_dust"

/obj/effect/floor_decal/industrial/warning/dust/full/tile
	icon_state = "warningfulltile_dust"

/obj/effect/floor_decal/industrial/warning/asteroid
	name = "hazard stripes"
	icon_state = "warning_asteroid"

/obj/effect/floor_decal/industrial/warning/asteroid/corner
	name = "hazard stripes"
	icon_state = "warningcorner_asteroid"

/obj/effect/floor_decal/industrial/warning/asteroid/cee
	name = "hazard stripes"
	icon_state = "warningcee_asteroid"

/obj/effect/floor_decal/industrial/warning/asteroid/full
	name = "hazard stripes"
	icon_state = "warningfull_asteroid"

/obj/effect/floor_decal/industrial/warning/asteroid/full/tile
	icon_state = "warningfulltile_asteroid"

/obj/effect/floor_decal/industrial/warning/red
	name = "hazard stripes"
	icon_state = "warning_red"

/obj/effect/floor_decal/industrial/warning/red/corner
	name = "hazard stripes"
	icon_state = "warningcorner_red"

/obj/effect/floor_decal/industrial/warning/red/full
	name = "hazard stripes"
	icon_state = "warningfull_red"

/obj/effect/floor_decal/industrial/warning/red/full/tile
	icon_state = "warningfulltile_red"

/obj/effect/floor_decal/industrial/warning/red/cee
	name = "hazard stripes"
	icon_state = "warningcee_red"

/obj/effect/floor_decal/industrial/warning/wiz
	name = "hazard stripes"
	icon_state = "warning_wiz"

/obj/effect/floor_decal/industrial/warning/wiz/corner
	icon_state = "warningcorner_wiz"

/obj/effect/floor_decal/industrial/warning/wiz/full
	name = "hazard stripes"
	icon_state = "warningfull_wiz"

/obj/effect/floor_decal/industrial/warning/wiz/full/tile
	icon_state = "warningfulltile_wiz"

/obj/effect/floor_decal/industrial/warning/wiz/cee
	name = "hazard stripes"
	icon_state = "warningcee_wiz"

/obj/effect/floor_decal/industrial/hatch
	name = "hatched marking"
	icon_state = "delivery"
	alpha = 229

/obj/effect/floor_decal/industrial/hatch/yellow
	color = "#cfcf55"

/obj/effect/floor_decal/industrial/hatch/red
	color = COLOR_RED_GRAY

/obj/effect/floor_decal/industrial/hatch/orange
	color = COLOR_DARK_ORANGE

/obj/effect/floor_decal/industrial/hatch/blue
	color = COLOR_BLUE_GRAY

/obj/effect/floor_decal/industrial/hatch/gray
	color = COLOR_GRAY

/obj/effect/floor_decal/industrial/standclear
	name = "industrial marking"
	icon_state = "stand_clear"

/obj/effect/floor_decal/industrial/standclear/yellow
	color = "#cfcf55"

/obj/effect/floor_decal/industrial/standclear/red
	color = COLOR_RED_GRAY

/obj/effect/floor_decal/industrial/standclear/orange
	color = COLOR_DARK_ORANGE

/obj/effect/floor_decal/industrial/standclear/blue
	color = COLOR_BLUE_GRAY

/obj/effect/floor_decal/industrial/standclear/gray
	color = COLOR_GRAY

/obj/effect/floor_decal/industrial/caution
	name = "industrial marking"
	icon_state = "caution"

/obj/effect/floor_decal/industrial/caution/yellow
	color = "#cfcf55"

/obj/effect/floor_decal/industrial/caution/red
	color = COLOR_RED_GRAY

/obj/effect/floor_decal/industrial/caution/orange
	color = COLOR_DARK_ORANGE

/obj/effect/floor_decal/industrial/caution/blue
	color = COLOR_BLUE_GRAY

/obj/effect/floor_decal/industrial/caution/gray
	color = COLOR_GRAY

/obj/effect/floor_decal/industrial/box
	name = "industrial marking"
	icon_state = "box"

/obj/effect/floor_decal/industrial/box/yellow
	color = "#cfcf55"

/obj/effect/floor_decal/industrial/box/red
	color = COLOR_RED_GRAY

/obj/effect/floor_decal/industrial/box/orange
	color = COLOR_DARK_ORANGE

/obj/effect/floor_decal/industrial/box/blue
	color = COLOR_BLUE_GRAY

/obj/effect/floor_decal/industrial/box/gray
	color = COLOR_GRAY

/obj/effect/floor_decal/industrial/boxcorners
	name = "industrial marking"
	icon_state = "box_corners"

/obj/effect/floor_decal/industrial/boxcorners/yellow
	color = "#cfcf55"

/obj/effect/floor_decal/industrial/boxcorners/red
	color = COLOR_RED_GRAY

/obj/effect/floor_decal/industrial/boxcorners/orange
	color = COLOR_DARK_ORANGE

/obj/effect/floor_decal/industrial/boxcorners/blue
	color = COLOR_BLUE_GRAY

/obj/effect/floor_decal/industrial/boxcorners/gray
	color = COLOR_GRAY

/obj/effect/floor_decal/industrial/arrows
	name = "industrial marking"
	icon_state = "arrows"

/obj/effect/floor_decal/industrial/arrows/yellow
	color = "#cfcf55"

/obj/effect/floor_decal/industrial/arrows/red
	color = COLOR_RED_GRAY

/obj/effect/floor_decal/industrial/arrows/orange
	color = COLOR_DARK_ORANGE

/obj/effect/floor_decal/industrial/arrows/blue
	color = COLOR_BLUE_GRAY

/obj/effect/floor_decal/industrial/arrows/gray
	color = COLOR_GRAY

/obj/effect/floor_decal/industrial/shutoff
	name = "shutoff valve marker"
	icon_state = "shutoff"

/obj/effect/floor_decal/industrial/outline
	name = "white outline"
	icon_state = "outline"
	alpha = 229

/obj/effect/floor_decal/industrial/outline/blue
	name = "blue outline"
	color = COLOR_BLUE_GRAY

/obj/effect/floor_decal/industrial/outline/yellow
	name = "yellow outline"
	color = "#cfcf55"

/obj/effect/floor_decal/industrial/outline/grey
	name = "grey outline"
	color = COLOR_GRAY

/obj/effect/floor_decal/industrial/outline/red
	name = "red outline"
	color = COLOR_RED_GRAY

/obj/effect/floor_decal/industrial/outline/orange
	name = "orange outline"
	color = COLOR_DARK_ORANGE

/obj/effect/floor_decal/industrial/loading
	name = "loading area"
	icon_state = "loadingarea"
	alpha = 229

/obj/effect/floor_decal/plaque
	name = "plaque"
	icon_state = "plaque"

/obj/effect/floor_decal/asteroid
	name = "random asteroid rubble"
	icon_state = "asteroid0"

/obj/effect/floor_decal/asteroid/New()
	icon_state = "asteroid[rand(0,9)]"
	..()

/obj/effect/floor_decal/chapel
	name = "chapel"
	icon_state = "chapel"

/obj/effect/floor_decal/ss13/l1
	name = "L1"
	icon_state = "L1"

/obj/effect/floor_decal/ss13/l2
	name = "L2"
	icon_state = "L2"

/obj/effect/floor_decal/ss13/l3
	name = "L3"
	icon_state = "L3"

/obj/effect/floor_decal/ss13/l4
	name = "L4"
	icon_state = "L4"

/obj/effect/floor_decal/ss13/l5
	name = "L5"
	icon_state = "L5"

/obj/effect/floor_decal/ss13/l6
	name = "L6"
	icon_state = "L6"

/obj/effect/floor_decal/ss13/l7
	name = "L7"
	icon_state = "L7"

/obj/effect/floor_decal/ss13/l8
	name = "L8"
	icon_state = "L8"

/obj/effect/floor_decal/ss13/l9
	name = "L9"
	icon_state = "L9"

/obj/effect/floor_decal/ss13/l10
	name = "L10"
	icon_state = "L10"

/obj/effect/floor_decal/ss13/l11
	name = "L11"
	icon_state = "L11"

/obj/effect/floor_decal/ss13/l12
	name = "L12"
	icon_state = "L12"

/obj/effect/floor_decal/ss13/l13
	name = "L13"
	icon_state = "L13"

/obj/effect/floor_decal/ss13/l14
	name = "L14"
	icon_state = "L14"

/obj/effect/floor_decal/ss13/l15
	name = "L15"
	icon_state = "L15"

/obj/effect/floor_decal/ss13/l16
	name = "L16"
	icon_state = "L16"

/obj/effect/floor_decal/sign
	name = "floor sign"
	icon_state = "white_1"

/obj/effect/floor_decal/sign/two
	icon_state = "white_2"

/obj/effect/floor_decal/sign/a
	icon_state = "white_a"

/obj/effect/floor_decal/sign/b
	icon_state = "white_b"

/obj/effect/floor_decal/sign/c
	icon_state = "white_c"

/obj/effect/floor_decal/sign/d
	icon_state = "white_d"

/obj/effect/floor_decal/sign/ex
	icon_state = "white_ex"

/obj/effect/floor_decal/sign/m
	icon_state = "white_m"

/obj/effect/floor_decal/sign/cmo
	icon_state = "white_cmo"

/obj/effect/floor_decal/sign/v
	icon_state = "white_v"

/obj/effect/floor_decal/sign/p
	icon_state = "white_p"

/obj/effect/floor_decal/sign/cell1
	icon_state = "cell_1"

/obj/effect/floor_decal/sign/cell2
	icon_state = "cell_2"

/obj/effect/floor_decal/sign/cell3
	icon_state = "cell_3"

/obj/effect/floor_decal/sign/cell4
	icon_state = "cell_4"

/obj/effect/floor_decal/sign/cell5
	icon_state = "cell_5"

/obj/effect/floor_decal/sign/cell6
	icon_state = "cell_6"

/obj/effect/floor_decal/sign/cell7
	icon_state = "cell_7"

/obj/effect/floor_decal/sign/cell8
	icon_state = "cell_8"

/obj/effect/floor_decal/sign/cell9
	icon_state = "cell_9"

/obj/effect/floor_decal/sign/armory
	icon_state = "rigdecal"

/obj/effect/floor_decal/sign/armory/tactical
	icon_state = "tacticaldecal"

/obj/effect/floor_decal/sign/armory/suits
	icon_state = "suitsdecal"

/obj/effect/floor_decal/sign/armory/riot1
	icon_state = "riotdecal_1"

/obj/effect/floor_decal/sign/armory/riot2
	icon_state = "riotdecal_2"

/obj/effect/floor_decal/sign/armory/ballistic1
	icon_state = "ballisticdecal_1"

/obj/effect/floor_decal/sign/armory/ballistic2
	icon_state = "ballisticdecal_2"

/obj/effect/floor_decal/sign/armory/ablative1
	icon_state = "ablativedecal_1"

/obj/effect/floor_decal/sign/armory/ablative2
	icon_state = "ablativedecal_2"

/obj/effect/floor_decal/sign/armory/accelerator1
	icon_state = "acceleratordecal_1"

/obj/effect/floor_decal/sign/armory/accelerator2
	icon_state = "acceleratordecal_2"

/obj/effect/floor_decal/sign/armory/energy
	icon_state = "energydecal"

/obj/effect/floor_decal/sign/armory/taser
	icon_state = "taserdecal"

/obj/effect/floor_decal/solarpanel
	icon_state = "solarpanel"

/obj/effect/floor_decal/snow
	icon = 'icons/turf/overlays.dmi'
	icon_state = "snowfloor"

/obj/effect/floor_decal/snowedge
	icon_state = "snow_edge"

/obj/effect/floor_decal/snowedge/corner
	icon_state = "snow_edge_corner"

/obj/effect/floor_decal/snowedge/cee
	icon_state = "snow_edge_cee"

/obj/effect/floor_decal/floordetail
	layer = TURF_DETAIL_LAYER
	color = COLOR_GUNMETAL
	icon_state = "manydot"
	appearance_flags = DEFAULT_APPEARANCE_FLAGS

/obj/effect/floor_decal/floordetail/New(newloc, newdir, newcolour)
	color = null //color is here just for map preview, if left it applies both our and tile colors.
	..()

/obj/effect/floor_decal/floordetail/tiled
	icon_state = "manydot_tiled"

/obj/effect/floor_decal/floordetail/pryhole
	icon_state = "pryhole"

/obj/effect/floor_decal/floordetail/edgedrain
	icon_state = "edge"

/obj/effect/floor_decal/floordetail/traction
	icon_state = "traction"

/obj/effect/floor_decal/floordetail/borderfloor/black
	icon_state = "borderfloor_black"
	color = null

/obj/effect/floor_decal/floordetail/borderfloor/black/corner
	icon_state = "borderfloorcorner_black"

/obj/effect/floor_decal/floordetail/borderfloor/black/full
	icon_state = "borderfloorfull_black"

/obj/effect/floor_decal/floordetail/borderfloor/black/full/cee
	icon_state = "borderfloorcee_black"

/obj/effect/floor_decal/ntlogo
	icon_state = "ntlogo"

/obj/effect/floor_decal/ntlogo/sec
	icon_state = "ntlogo_sec"

/obj/effect/floor_decal/derelict/l1
	name = "derelict1"
	icon_state = "derelict1"

/obj/effect/floor_decal/derelict/l2
	name = "derelict2"
	icon_state = "derelict2"

/obj/effect/floor_decal/derelict/l3
	name = "derelict3"
	icon_state = "derelict3"

/obj/effect/floor_decal/derelict/l4
	name = "derelict4"
	icon_state = "derelict4"

/obj/effect/floor_decal/derelict/l5
	name = "derelict5"
	icon_state = "derelict5"

/obj/effect/floor_decal/derelict/l6
	name = "derelict6"
	icon_state = "derelict6"

/obj/effect/floor_decal/derelict/l7
	name = "derelict7"
	icon_state = "derelict7"

/obj/effect/floor_decal/derelict/l8
	name = "derelict8"
	icon_state = "derelict8"

/obj/effect/floor_decal/derelict/l9
	name = "derelict9"
	icon_state = "derelict9"

/obj/effect/floor_decal/derelict/l10
	name = "derelict10"
	icon_state = "derelict10"

/obj/effect/floor_decal/derelict/l11
	name = "derelict11"
	icon_state = "derelict11"

/obj/effect/floor_decal/derelict/l12
	name = "derelict12"
	icon_state = "derelict12"

/obj/effect/floor_decal/derelict/l13
	name = "derelict13"
	icon_state = "derelict13"

/obj/effect/floor_decal/derelict/l14
	name = "derelict14"
	icon_state = "derelict14"

/obj/effect/floor_decal/derelict/l15
	name = "derelict15"
	icon_state = "derelict15"

/obj/effect/floor_decal/derelict/l16
	name = "derelict16"
	icon_state = "derelict16"

/obj/effect/floor_decal/techfloor
	name = "techfloor edges"
	icon_state = "techfloor_edges"

/obj/effect/floor_decal/techfloor/corner
	name = "techfloor corner"
	icon_state = "techfloor_corners"

/obj/effect/floor_decal/techfloor/orange
	name = "techfloor edges"
	icon_state = "techfloororange_edges"

/obj/effect/floor_decal/techfloor/orange/corner
	name = "techfloor corner"
	icon_state = "techfloororange_corners"

/obj/effect/floor_decal/techgrid
	name = "techgrid corner"
	icon_state = "corner_techgrid"

/obj/effect/floor_decal/techgrid/diagonal
	name = "techgrid diagonal corner"
	icon_state = "corner_techgrid_diagonal"

/obj/effect/floor_decal/techgrid/full
	name = "techgrid full corner"
	icon_state = "corner_techgrid_full"

/// Trimlines

/obj/effect/floor_decal/trimline
	alpha = 229
	icon_state = "trimline_box"

/// White trimlines

/obj/effect/floor_decal/trimline/white
	color = COLOR_WHITE

/obj/effect/floor_decal/trimline/white/line
	name = "trim decal"
	icon_state = "trimline"

/obj/effect/floor_decal/trimline/white/corner
	icon_state = "trimline_corner"

/obj/effect/floor_decal/trimline/white/end
	icon_state = "trimline_end"

/obj/effect/floor_decal/trimline/white/arrow_cw
	icon_state = "trimline_arrow_cw"

/obj/effect/floor_decal/trimline/white/arrow_ccw
	icon_state = "trimline_arrow_ccw"

/obj/effect/floor_decal/trimline/white/warning
	icon_state = "trimline_warn"

/obj/effect/floor_decal/trimline/white/mid_joiner
	icon_state = "trimline_mid"

/obj/effect/floor_decal/trimline/white/filled
	icon_state = "trimline_box_fill"

/obj/effect/floor_decal/trimline/white/filled/line
	icon_state = "trimline_fill"

/obj/effect/floor_decal/trimline/white/filled/corner
	icon_state = "trimline_corner_fill"

/obj/effect/floor_decal/trimline/white/filled/end
	icon_state = "trimline_end_fill"

/obj/effect/floor_decal/trimline/white/filled/arrow_cw
	icon_state = "trimline_arrow_cw_fill"

/obj/effect/floor_decal/trimline/white/filled/arrow_ccw
	icon_state = "trimline_arrow_ccw_fill"

/obj/effect/floor_decal/trimline/white/filled/warning
	icon_state = "trimline_warn_fill"

/obj/effect/floor_decal/trimline/white/filled/mid_joiner
	icon_state = "trimline_mid_fill"

/obj/effect/floor_decal/trimline/white/filled/shrink_cw
	icon_state = "trimline_shrink_cw"

/obj/effect/floor_decal/trimline/white/filled/shrink_ccw
	icon_state = "trimline_shrink_ccw"

/// Red trimlines

/obj/effect/floor_decal/trimline/red
	color = COLOR_RED

/obj/effect/floor_decal/trimline/red/line
	icon_state = "trimline"

/obj/effect/floor_decal/trimline/red/corner
	icon_state = "trimline_corner"

/obj/effect/floor_decal/trimline/red/end
	icon_state = "trimline_end"

/obj/effect/floor_decal/trimline/red/arrow_cw
	icon_state = "trimline_arrow_cw"

/obj/effect/floor_decal/trimline/red/arrow_ccw
	icon_state = "trimline_arrow_ccw"

/obj/effect/floor_decal/trimline/red/warning
	icon_state = "trimline_warn"

/obj/effect/floor_decal/trimline/red/mid_joiner
	icon_state = "trimline_mid"

/obj/effect/floor_decal/trimline/red/filled
	icon_state = "trimline_box_fill"

/obj/effect/floor_decal/trimline/red/filled/line
	icon_state = "trimline_fill"

/obj/effect/floor_decal/trimline/red/filled/corner
	icon_state = "trimline_corner_fill"

/obj/effect/floor_decal/trimline/red/filled/end
	icon_state = "trimline_end_fill"

/obj/effect/floor_decal/trimline/red/filled/arrow_cw
	icon_state = "trimline_arrow_cw_fill"

/obj/effect/floor_decal/trimline/red/filled/arrow_ccw
	icon_state = "trimline_arrow_ccw_fill"

/obj/effect/floor_decal/trimline/red/filled/warning
	icon_state = "trimline_warn_fill"

/obj/effect/floor_decal/trimline/red/filled/mid_joiner
	icon_state = "trimline_mid_fill"

/obj/effect/floor_decal/trimline/red/filled/shrink_cw
	icon_state = "trimline_shrink_cw"

/obj/effect/floor_decal/trimline/red/filled/shrink_ccw
	icon_state = "trimline_shrink_ccw"

/// Dark red trimlines

/obj/effect/floor_decal/trimline/dark_red
	color = COLOR_DARK_RED

/obj/effect/floor_decal/trimline/dark_red/line
	icon_state = "trimline"

/obj/effect/floor_decal/trimline/dark_red/corner
	icon_state = "trimline_corner"

/obj/effect/floor_decal/trimline/dark_red/end
	icon_state = "trimline_end"

/obj/effect/floor_decal/trimline/dark_red/arrow_cw
	icon_state = "trimline_arrow_cw"

/obj/effect/floor_decal/trimline/dark_red/arrow_ccw
	icon_state = "trimline_arrow_ccw"

/obj/effect/floor_decal/trimline/dark_red/warning
	icon_state = "trimline_warn"

/obj/effect/floor_decal/trimline/dark_red/mid_joiner
	icon_state = "trimline_mid"

/obj/effect/floor_decal/trimline/dark_red/filled
	icon_state = "trimline_box_fill"

/obj/effect/floor_decal/trimline/dark_red/filled/line
	icon_state = "trimline_fill"

/obj/effect/floor_decal/trimline/dark_red/filled/corner
	icon_state = "trimline_corner_fill"

/obj/effect/floor_decal/trimline/dark_red/filled/end
	icon_state = "trimline_end_fill"

/obj/effect/floor_decal/trimline/dark_red/filled/arrow_cw
	icon_state = "trimline_arrow_cw_fill"

/obj/effect/floor_decal/trimline/dark_red/filled/arrow_ccw
	icon_state = "trimline_arrow_ccw_fill"

/obj/effect/floor_decal/trimline/dark_red/filled/warning
	icon_state = "trimline_warn_fill"

/obj/effect/floor_decal/trimline/dark_red/filled/mid_joiner
	icon_state = "trimline_mid_fill"

/obj/effect/floor_decal/trimline/dark_red/filled/shrink_cw
	icon_state = "trimline_shrink_cw"

/obj/effect/floor_decal/trimline/dark_red/filled/shrink_ccw
	icon_state = "trimline_shrink_ccw"

/// Green trimlines

/obj/effect/floor_decal/trimline/green
	color = COLOR_GREEN

/obj/effect/floor_decal/trimline/green/line
	icon_state = "trimline"

/obj/effect/floor_decal/trimline/green/corner
	icon_state = "trimline_corner"

/obj/effect/floor_decal/trimline/green/end
	icon_state = "trimline_end"

/obj/effect/floor_decal/trimline/green/arrow_cw
	icon_state = "trimline_arrow_cw"

/obj/effect/floor_decal/trimline/green/arrow_ccw
	icon_state = "trimline_arrow_ccw"

/obj/effect/floor_decal/trimline/green/warning
	icon_state = "trimline_warn"

/obj/effect/floor_decal/trimline/green/mid_joiner
	icon_state = "trimline_mid"

/obj/effect/floor_decal/trimline/green/filled
	icon_state = "trimline_box_fill"

/obj/effect/floor_decal/trimline/green/filled/line
	icon_state = "trimline_fill"

/obj/effect/floor_decal/trimline/green/filled/corner
	icon_state = "trimline_corner_fill"

/obj/effect/floor_decal/trimline/green/filled/end
	icon_state = "trimline_end_fill"

/obj/effect/floor_decal/trimline/green/filled/arrow_cw
	icon_state = "trimline_arrow_cw_fill"

/obj/effect/floor_decal/trimline/green/filled/arrow_ccw
	icon_state = "trimline_arrow_ccw_fill"

/obj/effect/floor_decal/trimline/green/filled/warning
	icon_state = "trimline_warn_fill"

/obj/effect/floor_decal/trimline/green/filled/mid_joiner
	icon_state = "trimline_mid_fill"

/obj/effect/floor_decal/trimline/green/filled/shrink_cw
	icon_state = "trimline_shrink_cw"

/obj/effect/floor_decal/trimline/green/filled/shrink_ccw
	icon_state = "trimline_shrink_ccw"

/// Dark green Trimlines

/obj/effect/floor_decal/trimline/dark_green
	color = COLOR_DARK_GREEN

/obj/effect/floor_decal/trimline/dark_green/line
	icon_state = "trimline"

/obj/effect/floor_decal/trimline/dark_green/corner
	icon_state = "trimline_corner"

/obj/effect/floor_decal/trimline/dark_green/end
	icon_state = "trimline_end"

/obj/effect/floor_decal/trimline/dark_green/arrow_cw
	icon_state = "trimline_arrow_cw"

/obj/effect/floor_decal/trimline/dark_green/arrow_ccw
	icon_state = "trimline_arrow_ccw"

/obj/effect/floor_decal/trimline/dark_green/warning
	icon_state = "trimline_warn"

/obj/effect/floor_decal/trimline/dark_green/mid_joiner
	icon_state = "trimline_mid"

/obj/effect/floor_decal/trimline/dark_green/filled
	icon_state = "trimline_box_fill"

/obj/effect/floor_decal/trimline/dark_green/filled/line
	icon_state = "trimline_fill"

/obj/effect/floor_decal/trimline/dark_green/filled/corner
	icon_state = "trimline_corner_fill"

/obj/effect/floor_decal/trimline/dark_green/filled/end
	icon_state = "trimline_end_fill"

/obj/effect/floor_decal/trimline/dark_green/filled/arrow_cw
	icon_state = "trimline_arrow_cw_fill"

/obj/effect/floor_decal/trimline/dark_green/filled/arrow_ccw
	icon_state = "trimline_arrow_ccw_fill"

/obj/effect/floor_decal/trimline/dark_green/filled/warning
	icon_state = "trimline_warn_fill"

/obj/effect/floor_decal/trimline/dark_green/filled/mid_joiner
	icon_state = "trimline_mid_fill"

/obj/effect/floor_decal/trimline/dark_green/filled/shrink_cw
	icon_state = "trimline_shrink_cw"

/obj/effect/floor_decal/trimline/dark_green/filled/shrink_ccw
	icon_state = "trimline_shrink_ccw"

/// Blue trimlines

/obj/effect/floor_decal/trimline/blue
	color = COLOR_BLUE

/obj/effect/floor_decal/trimline/blue/line
	icon_state = "trimline"

/obj/effect/floor_decal/trimline/blue/corner
	icon_state = "trimline_corner"

/obj/effect/floor_decal/trimline/blue/end
	icon_state = "trimline_end"

/obj/effect/floor_decal/trimline/blue/arrow_cw
	icon_state = "trimline_arrow_cw"

/obj/effect/floor_decal/trimline/blue/arrow_ccw
	icon_state = "trimline_arrow_ccw"

/obj/effect/floor_decal/trimline/blue/warning
	icon_state = "trimline_warn"

/obj/effect/floor_decal/trimline/blue/mid_joiner
	icon_state = "trimline_mid"

/obj/effect/floor_decal/trimline/blue/filled
	icon_state = "trimline_box_fill"

/obj/effect/floor_decal/trimline/blue/filled/line
	icon_state = "trimline_fill"

/obj/effect/floor_decal/trimline/blue/filled/corner
	icon_state = "trimline_corner_fill"

/obj/effect/floor_decal/trimline/blue/filled/end
	icon_state = "trimline_end_fill"

/obj/effect/floor_decal/trimline/blue/filled/arrow_cw
	icon_state = "trimline_arrow_cw_fill"

/obj/effect/floor_decal/trimline/blue/filled/arrow_ccw
	icon_state = "trimline_arrow_ccw_fill"

/obj/effect/floor_decal/trimline/blue/filled/warning
	icon_state = "trimline_warn_fill"

/obj/effect/floor_decal/trimline/blue/filled/mid_joiner
	icon_state = "trimline_mid_fill"

/obj/effect/floor_decal/trimline/blue/filled/shrink_cw
	icon_state = "trimline_shrink_cw"

/obj/effect/floor_decal/trimline/blue/filled/shrink_ccw
	icon_state = "trimline_shrink_ccw"

/// Dark blue trimlines

/obj/effect/floor_decal/trimline/dark_blue
	color = COLOR_DARK_BLUE

/obj/effect/floor_decal/trimline/dark_blue/line
	icon_state = "trimline"

/obj/effect/floor_decal/trimline/dark_blue/corner
	icon_state = "trimline_corner"

/obj/effect/floor_decal/trimline/dark_blue/end
	icon_state = "trimline_end"

/obj/effect/floor_decal/trimline/dark_blue/arrow_cw
	icon_state = "trimline_arrow_cw"

/obj/effect/floor_decal/trimline/dark_blue/arrow_ccw
	icon_state = "trimline_arrow_ccw"

/obj/effect/floor_decal/trimline/dark_blue/warning
	icon_state = "trimline_warn"

/obj/effect/floor_decal/trimline/dark_blue/mid_joiner
	icon_state = "trimline_mid"

/obj/effect/floor_decal/trimline/dark_blue/filled
	icon_state = "trimline_box_fill"

/obj/effect/floor_decal/trimline/dark_blue/filled/line
	icon_state = "trimline_fill"

/obj/effect/floor_decal/trimline/dark_blue/filled/corner
	icon_state = "trimline_corner_fill"

/obj/effect/floor_decal/trimline/dark_blue/filled/end
	icon_state = "trimline_end_fill"

/obj/effect/floor_decal/trimline/dark_blue/filled/arrow_cw
	icon_state = "trimline_arrow_cw_fill"

/obj/effect/floor_decal/trimline/dark_blue/filled/arrow_ccw
	icon_state = "trimline_arrow_ccw_fill"

/obj/effect/floor_decal/trimline/dark_blue/filled/warning
	icon_state = "trimline_warn_fill"

/obj/effect/floor_decal/trimline/dark_blue/filled/mid_joiner
	icon_state = "trimline_mid_fill"

/obj/effect/floor_decal/trimline/dark_blue/filled/shrink_cw
	icon_state = "trimline_shrink_cw"

/obj/effect/floor_decal/trimline/dark_blue/filled/shrink_ccw
	icon_state = "trimline_shrink_ccw"

/// Yellow trimlines

/obj/effect/floor_decal/trimline/yellow
	color = COLOR_YELLOW

/obj/effect/floor_decal/trimline/yellow/line
	icon_state = "trimline"

/obj/effect/floor_decal/trimline/yellow/corner
	icon_state = "trimline_corner"

/obj/effect/floor_decal/trimline/yellow/end
	icon_state = "trimline_end"

/obj/effect/floor_decal/trimline/yellow/arrow_cw
	icon_state = "trimline_arrow_cw"

/obj/effect/floor_decal/trimline/yellow/arrow_ccw
	icon_state = "trimline_arrow_ccw"

/obj/effect/floor_decal/trimline/yellow/warning
	icon_state = "trimline_warn"

/obj/effect/floor_decal/trimline/yellow/mid_joiner
	icon_state = "trimline_mid"

/obj/effect/floor_decal/trimline/yellow/filled
	icon_state = "trimline_box_fill"

/obj/effect/floor_decal/trimline/yellow/filled/line
	icon_state = "trimline_fill"

/obj/effect/floor_decal/trimline/yellow/filled/corner
	icon_state = "trimline_corner_fill"

/obj/effect/floor_decal/trimline/yellow/filled/end
	icon_state = "trimline_end_fill"

/obj/effect/floor_decal/trimline/yellow/filled/arrow_cw
	icon_state = "trimline_arrow_cw_fill"

/obj/effect/floor_decal/trimline/yellow/filled/arrow_ccw
	icon_state = "trimline_arrow_ccw_fill"

/obj/effect/floor_decal/trimline/yellow/filled/warning
	icon_state = "trimline_warn_fill"

/obj/effect/floor_decal/trimline/yellow/filled/mid_joiner
	icon_state = "trimline_mid_fill"

/obj/effect/floor_decal/trimline/yellow/filled/shrink_cw
	icon_state = "trimline_shrink_cw"

/obj/effect/floor_decal/trimline/yellow/filled/shrink_ccw
	icon_state = "trimline_shrink_ccw"

/// Purple trimlines

/obj/effect/floor_decal/trimline/purple
	color = COLOR_PURPLE

/obj/effect/floor_decal/trimline/purple/line
	icon_state = "trimline"

/obj/effect/floor_decal/trimline/purple/corner
	icon_state = "trimline_corner"

/obj/effect/floor_decal/trimline/purple/end
	icon_state = "trimline_end"

/obj/effect/floor_decal/trimline/purple/arrow_cw
	icon_state = "trimline_arrow_cw"

/obj/effect/floor_decal/trimline/purple/arrow_ccw
	icon_state = "trimline_arrow_ccw"

/obj/effect/floor_decal/trimline/purple/warning
	icon_state = "trimline_warn"

/obj/effect/floor_decal/trimline/purple/mid_joiner
	icon_state = "trimline_mid"

/obj/effect/floor_decal/trimline/purple/filled
	icon_state = "trimline_box_fill"

/obj/effect/floor_decal/trimline/purple/filled/line
	icon_state = "trimline_fill"

/obj/effect/floor_decal/trimline/purple/filled/corner
	icon_state = "trimline_corner_fill"

/obj/effect/floor_decal/trimline/purple/filled/end
	icon_state = "trimline_end_fill"

/obj/effect/floor_decal/trimline/purple/filled/arrow_cw
	icon_state = "trimline_arrow_cw_fill"

/obj/effect/floor_decal/trimline/purple/filled/arrow_ccw
	icon_state = "trimline_arrow_ccw_fill"

/obj/effect/floor_decal/trimline/purple/filled/warning
	icon_state = "trimline_warn_fill"

/obj/effect/floor_decal/trimline/purple/filled/mid_joiner
	icon_state = "trimline_mid_fill"

/obj/effect/floor_decal/trimline/purple/filled/shrink_cw
	icon_state = "trimline_shrink_cw"

/obj/effect/floor_decal/trimline/purple/filled/shrink_ccw
	icon_state = "trimline_shrink_ccw"

/// Brown trimlines

/obj/effect/floor_decal/trimline/brown
	color = COLOR_BROWN

/obj/effect/floor_decal/trimline/brown/line
	icon_state = "trimline"

/obj/effect/floor_decal/trimline/brown/corner
	icon_state = "trimline_corner"

/obj/effect/floor_decal/trimline/brown/end
	icon_state = "trimline_end"

/obj/effect/floor_decal/trimline/brown/arrow_cw
	icon_state = "trimline_arrow_cw"

/obj/effect/floor_decal/trimline/brown/arrow_ccw
	icon_state = "trimline_arrow_ccw"

/obj/effect/floor_decal/trimline/brown/warning
	icon_state = "trimline_warn"

/obj/effect/floor_decal/trimline/brown/mid_joiner
	icon_state = "trimline_mid"

/obj/effect/floor_decal/trimline/brown/filled
	icon_state = "trimline_box_fill"

/obj/effect/floor_decal/trimline/brown/filled/line
	icon_state = "trimline_fill"

/obj/effect/floor_decal/trimline/brown/filled/corner
	icon_state = "trimline_corner_fill"

/obj/effect/floor_decal/trimline/brown/filled/end
	icon_state = "trimline_end_fill"

/obj/effect/floor_decal/trimline/brown/filled/arrow_cw
	icon_state = "trimline_arrow_cw_fill"

/obj/effect/floor_decal/trimline/brown/filled/arrow_ccw
	icon_state = "trimline_arrow_ccw_fill"

/obj/effect/floor_decal/trimline/brown/filled/warning
	icon_state = "trimline_warn_fill"

/obj/effect/floor_decal/trimline/brown/filled/mid_joiner
	icon_state = "trimline_mid_fill"

/obj/effect/floor_decal/trimline/brown/filled/shrink_cw
	icon_state = "trimline_shrink_cw"

/obj/effect/floor_decal/trimline/brown/filled/shrink_ccw
	icon_state = "trimline_shrink_ccw"

/// Gray trimlines

/obj/effect/floor_decal/trimline/gray
	color = COLOR_GRAY_SPECIAL

/obj/effect/floor_decal/trimline/gray/line
	icon_state = "trimline"

/obj/effect/floor_decal/trimline/gray/corner
	icon_state = "trimline_corner"

/obj/effect/floor_decal/trimline/gray/end
	icon_state = "trimline_end"

/obj/effect/floor_decal/trimline/gray/arrow_cw
	icon_state = "trimline_arrow_cw"

/obj/effect/floor_decal/trimline/gray/arrow_ccw
	icon_state = "trimline_arrow_ccw"

/obj/effect/floor_decal/trimline/gray/warning
	icon_state = "trimline_warn"

/obj/effect/floor_decal/trimline/gray/mid_joiner
	icon_state = "trimline_mid"

/obj/effect/floor_decal/trimline/gray/filled
	icon_state = "trimline_box_fill"

/obj/effect/floor_decal/trimline/gray/filled/line
	icon_state = "trimline_fill"

/obj/effect/floor_decal/trimline/gray/filled/corner
	icon_state = "trimline_corner_fill"

/obj/effect/floor_decal/trimline/gray/filled/end
	icon_state = "trimline_end_fill"

/obj/effect/floor_decal/trimline/gray/filled/arrow_cw
	icon_state = "trimline_arrow_cw_fill"

/obj/effect/floor_decal/trimline/gray/filled/arrow_ccw
	icon_state = "trimline_arrow_ccw_fill"

/obj/effect/floor_decal/trimline/gray/filled/warning
	icon_state = "trimline_warn_fill"

/obj/effect/floor_decal/trimline/gray/filled/mid_joiner
	icon_state = "trimline_mid_fill"

/obj/effect/floor_decal/trimline/gray/filled/shrink_cw
	icon_state = "trimline_shrink_cw"

/obj/effect/floor_decal/trimline/gray/filled/shrink_ccw
	icon_state = "trimline_shrink_ccw"

/// Dark trimlines

/obj/effect/floor_decal/trimline/dark
	color = COLOR_DARK

/obj/effect/floor_decal/trimline/dark/line
	icon_state = "trimline"

/obj/effect/floor_decal/trimline/dark/corner
	icon_state = "trimline_corner"

/obj/effect/floor_decal/trimline/dark/end
	icon_state = "trimline_end"

/obj/effect/floor_decal/trimline/dark/arrow_cw
	icon_state = "trimline_arrow_cw"

/obj/effect/floor_decal/trimline/dark/arrow_ccw
	icon_state = "trimline_arrow_ccw"

/obj/effect/floor_decal/trimline/dark/warning
	icon_state = "trimline_warn"

/obj/effect/floor_decal/trimline/dark/mid_joiner
	icon_state = "trimline_mid"

/obj/effect/floor_decal/trimline/dark/filled
	icon_state = "trimline_box_fill"

/obj/effect/floor_decal/trimline/dark/filled/line
	icon_state = "trimline_fill"

/obj/effect/floor_decal/trimline/dark/filled/corner
	icon_state = "trimline_corner_fill"

/obj/effect/floor_decal/trimline/dark/filled/end
	icon_state = "trimline_end_fill"

/obj/effect/floor_decal/trimline/dark/filled/arrow_cw
	icon_state = "trimline_arrow_cw_fill"

/obj/effect/floor_decal/trimline/dark/filled/arrow_ccw
	icon_state = "trimline_arrow_ccw_fill"

/obj/effect/floor_decal/trimline/dark/filled/warning
	icon_state = "trimline_warn_fill"

/obj/effect/floor_decal/trimline/dark/filled/mid_joiner
	icon_state = "trimline_mid_fill"

/obj/effect/floor_decal/trimline/dark/filled/shrink_cw
	icon_state = "trimline_shrink_cw"

/obj/effect/floor_decal/trimline/dark/filled/shrink_ccw
	icon_state = "trimline_shrink_ccw"

/// Black trimlines

/obj/effect/floor_decal/trimline/black
	color = COLOR_BLACK

/obj/effect/floor_decal/trimline/black/line
	name = "trim decal"
	icon_state = "trimline"

/obj/effect/floor_decal/trimline/black/corner
	icon_state = "trimline_corner"

/obj/effect/floor_decal/trimline/black/end
	icon_state = "trimline_end"

/obj/effect/floor_decal/trimline/black/arrow_cw
	icon_state = "trimline_arrow_cw"

/obj/effect/floor_decal/trimline/black/arrow_ccw
	icon_state = "trimline_arrow_ccw"

/obj/effect/floor_decal/trimline/black/warning
	icon_state = "trimline_warn"

/obj/effect/floor_decal/trimline/black/mid_joiner
	icon_state = "trimline_mid"

/obj/effect/floor_decal/trimline/black/filled
	icon_state = "trimline_box_fill"

/obj/effect/floor_decal/trimline/black/filled/line
	icon_state = "trimline_fill"

/obj/effect/floor_decal/trimline/black/filled/corner
	icon_state = "trimline_corner_fill"

/obj/effect/floor_decal/trimline/black/filled/end
	icon_state = "trimline_end_fill"

/obj/effect/floor_decal/trimline/black/filled/arrow_cw
	icon_state = "trimline_arrow_cw_fill"

/obj/effect/floor_decal/trimline/black/filled/arrow_ccw
	icon_state = "trimline_arrow_ccw_fill"

/obj/effect/floor_decal/trimline/black/filled/warning
	icon_state = "trimline_warn_fill"

/obj/effect/floor_decal/trimline/black/filled/mid_joiner
	icon_state = "trimline_mid_fill"

/obj/effect/floor_decal/trimline/black/filled/shrink_cw
	icon_state = "trimline_shrink_cw"

/obj/effect/floor_decal/trimline/black/filled/shrink_ccw
	icon_state = "trimline_shrink_ccw"

/obj/effect/floor_decal/siding/wood
	icon_state = "siding_wood_line"
	color = COLOR_WOOD

/obj/effect/floor_decal/siding/wood/corner
	icon_state = "siding_wood_corner"

/obj/effect/floor_decal/siding/wood/end
	icon_state = "siding_wood_end"

/obj/effect/floor_decal/siding/darkwood
	icon_state = "siding_wood_line"
	color = COLOR_DARKWOOD

/obj/effect/floor_decal/siding/darkwood/corner
	icon_state = "siding_wood_corner"

/obj/effect/floor_decal/siding/darkwood/end
	icon_state = "siding_wood_end"

/obj/effect/floor_decal/numbers
	alpha = 229
	name = "number"
	icon_state = "number"

/obj/effect/floor_decal/numbers/white/zero
	icon_state = "number_0"

/obj/effect/floor_decal/numbers/white/one
	icon_state = "number_1"

/obj/effect/floor_decal/numbers/white/two
	icon_state = "number_2"

/obj/effect/floor_decal/numbers/white/three
	icon_state = "number_3"

/obj/effect/floor_decal/numbers/white/four
	icon_state = "number_4"

/obj/effect/floor_decal/numbers/white/five
	icon_state = "number_5"

/obj/effect/floor_decal/numbers/white/six
	icon_state = "number_6"

/obj/effect/floor_decal/numbers/white/seven
	icon_state = "number_7"

/obj/effect/floor_decal/numbers/white/eight
	icon_state = "number_8"

/obj/effect/floor_decal/numbers/white/nine
	icon_state = "number_9"

/obj/effect/floor_decal/numbers/yellow

	color = COLOR_YELLOW

/obj/effect/floor_decal/numbers/yellow/zero
	icon_state = "number_0"

/obj/effect/floor_decal/numbers/yellow/one
	icon_state = "number_1"

/obj/effect/floor_decal/numbers/yellow/two
	icon_state = "number_2"

/obj/effect/floor_decal/numbers/yellow/three
	icon_state = "number_3"

/obj/effect/floor_decal/numbers/yellow/four
	icon_state = "number_4"

/obj/effect/floor_decal/numbers/yellow/five
	icon_state = "number_5"

/obj/effect/floor_decal/numbers/yellow/six
	icon_state = "number_6"

/obj/effect/floor_decal/numbers/yellow/seven
	icon_state = "number_7"

/obj/effect/floor_decal/numbers/yellow/eight
	icon_state = "number_8"

/obj/effect/floor_decal/numbers/yellow/nine
	icon_state = "number_9"

/obj/effect/floor_decal/numbers/orange

	color = COLOR_ORANGE

/obj/effect/floor_decal/numbers/orange/zero
	icon_state = "number_0"

/obj/effect/floor_decal/numbers/orange/one
	icon_state = "number_1"

/obj/effect/floor_decal/numbers/orange/two
	icon_state = "number_2"

/obj/effect/floor_decal/numbers/orange/three
	icon_state = "number_3"

/obj/effect/floor_decal/numbers/orange/four
	icon_state = "number_4"

/obj/effect/floor_decal/numbers/orange/five
	icon_state = "number_5"

/obj/effect/floor_decal/numbers/orange/six
	icon_state = "number_6"

/obj/effect/floor_decal/numbers/orange/seven
	icon_state = "number_7"

/obj/effect/floor_decal/numbers/orange/eight
	icon_state = "number_8"

/obj/effect/floor_decal/numbers/orange/nine
	icon_state = "number_9"

/obj/effect/floor_decal/numbers/red

	color = COLOR_RED

/obj/effect/floor_decal/numbers/red/zero
	icon_state = "number_0"

/obj/effect/floor_decal/numbers/red/one
	icon_state = "number_1"

/obj/effect/floor_decal/numbers/red/two
	icon_state = "number_2"

/obj/effect/floor_decal/numbers/red/three
	icon_state = "number_3"

/obj/effect/floor_decal/numbers/red/four
	icon_state = "number_4"

/obj/effect/floor_decal/numbers/red/five
	icon_state = "number_5"

/obj/effect/floor_decal/numbers/red/six
	icon_state = "number_6"

/obj/effect/floor_decal/numbers/red/seven
	icon_state = "number_7"

/obj/effect/floor_decal/numbers/red/eight
	icon_state = "number_8"

/obj/effect/floor_decal/numbers/red/nine
	icon_state = "number_9"

/obj/effect/floor_decal/numbers/blue

	color = COLOR_BLUE

/obj/effect/floor_decal/numbers/blue/zero
	icon_state = "number_0"

/obj/effect/floor_decal/numbers/blue/one
	icon_state = "number_1"

/obj/effect/floor_decal/numbers/blue/two
	icon_state = "number_2"

/obj/effect/floor_decal/numbers/blue/three
	icon_state = "number_3"

/obj/effect/floor_decal/numbers/blue/four
	icon_state = "number_4"

/obj/effect/floor_decal/numbers/blue/five
	icon_state = "number_5"

/obj/effect/floor_decal/numbers/blue/six
	icon_state = "number_6"

/obj/effect/floor_decal/numbers/blue/seven
	icon_state = "number_7"

/obj/effect/floor_decal/numbers/blue/eight
	icon_state = "number_8"

/obj/effect/floor_decal/numbers/blue/nine
	icon_state = "number_9"

/obj/effect/floor_decal/bot
	alpha = 229
	name = "bot"
	icon_state = "bot"

/obj/effect/floor_decal/bot/red
	color = COLOR_RED

/obj/effect/floor_decal/bot/yellow
	color = COLOR_YELLOW

/obj/effect/floor_decal/bot/right
	name = "bot right"
	icon_state = "bot_right"

/obj/effect/floor_decal/bot/right/red
	color = COLOR_RED

/obj/effect/floor_decal/bot/right/yellow
	color = COLOR_YELLOW

/obj/effect/floor_decal/bot/left
	name = "bot left"
	icon_state = "bot_left"

/obj/effect/floor_decal/bot/left/red
	color = COLOR_RED

/obj/effect/floor_decal/bot/left/yellow
	color = COLOR_YELLOW

/obj/effect/floor_decal/ss13_new/l1
	name = "L1"
	icon_state = "CL1"

/obj/effect/floor_decal/ss13_new/l2
	name = "L2"
	icon_state = "CL2"

/obj/effect/floor_decal/ss13_new/l3
	name = "L3"
	icon_state = "CL3"

/obj/effect/floor_decal/ss13_new/l4
	name = "L4"
	icon_state = "CL4"

/obj/effect/floor_decal/ss13_new/l5
	name = "L5"
	icon_state = "CL5"

/obj/effect/floor_decal/ss13_new/l6
	name = "L6"
	icon_state = "CL6"

/obj/effect/floor_decal/ss13_new/l7
	name = "L7"
	icon_state = "CL7"

/obj/effect/floor_decal/ss13_new/l8
	name = "L8"
	icon_state = "CL8"

/obj/effect/floor_decal/ss13_new/l9
	name = "L9"
	icon_state = "CL9"

/obj/effect/floor_decal/ss13_new/l10
	name = "L10"
	icon_state = "CL10"

/obj/effect/floor_decal/ss13_new/l11
	name = "L11"
	icon_state = "CL11"

/obj/effect/floor_decal/ss13_new/l12
	name = "L12"
	icon_state = "CL12"

/obj/effect/floor_decal/ss13_new/l13
	name = "L13"
	icon_state = "CL13"

/obj/effect/floor_decal/ss13_new/l14
	name = "L14"
	icon_state = "CL14"
