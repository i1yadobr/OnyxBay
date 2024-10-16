//These are a bunch of regex datums for use /((any|every|no|some|head|foot)where(wolf)?\sand\s)+(\.[\.\s]+\s?where\?)?/i
GLOBAL_DATUM_INIT(is_http_protocol, /regex, regex("^https?://"))

GLOBAL_DATUM_INIT(is_website, /regex, regex("http|www.|\[a-z0-9_-]+.(com|org|net|mil|edu)+", "i"))
GLOBAL_DATUM_INIT(is_email, /regex, regex("\[a-z0-9_-]+@\[a-z0-9_-]+.\[a-z0-9_-]+", "i"))
GLOBAL_DATUM_INIT(is_alphanumeric, /regex, regex("\[a-z0-9]+", "i"))
GLOBAL_DATUM_INIT(is_punctuation, /regex, regex("\[.!?]+", "i"))
GLOBAL_DATUM_INIT(is_color, /regex, regex("^#\[0-9a-fA-F]{6}$"))
// Used to remove symbols in range of the private usage area.
GLOBAL_DATUM_INIT(pua, /regex, regex("\[\uE000-\uF8FF]", "g"))

//finds text strings recognized as links on discord. Mainly used to stop embedding.
GLOBAL_DATUM_INIT(has_discord_embeddable_links, /regex, regex("(https?://\[^\\s|<\]{2,})"))

GLOBAL_DATUM_INIT(is_json, /regex, regex("\\.json$"))
GLOBAL_DATUM_INIT(is_image, /regex, regex("\\.(png|gif|jpg|dmi)$"))
