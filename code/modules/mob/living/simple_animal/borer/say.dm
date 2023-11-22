/mob/living/simple_animal/borer/say(message)

	message = sanitize(message)
	message = capitalize(message)

	if(!message)
		return

	if (stat == 2)
		return say_dead(message)

	if (stat)
		return

	if (src.client)
		if(client.prefs.muted & MUTE_IC)
			to_chat(src, "<span class='warning'>You cannot speak in IC (muted).</span>")
			return

	if (copytext(message, 1, 2) == "*")
		return emote(copytext(message, 2))

	var/datum/language/L = parse_language(message)
	if(!L)
		L = get_default_language()
	if(L && L.flags & HIVEMIND)
		L.broadcast(src,trim(copytext(message,3)),src.truename)
		return

	if(!host)
		//TODO: have this pick a random mob within 3 tiles to speak for the borer.
		to_chat(src, "You have no host to speak to.")
		return //No host, no audible speech.

	to_chat(src, "You drop words into [host]'s mind: \"[message]\"")
	to_chat(host, "Your own thoughts speak: \"[message]\"")

	log_say("\[BORER\] [name]([key])->[host.name]([host.key]): \"[message]\"")
	for (var/mob/M in GLOB.player_list)
		if (istype(M, /mob/new_player))
			continue
		else if(M.is_ooc_dead() && M.get_preference_value(/datum/client_preference/ghost_ears) == GLOB.PREF_ALL_SPEECH)
			to_chat(M, "[src.truename] whispers to [host], \"[message]\"")
