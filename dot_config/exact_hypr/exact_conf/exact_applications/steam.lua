hl.window_rule({ float = true, opacity = "1 1", idle_inhibit = "fullscreen", match = { class = "steam" } })
hl.window_rule({ center = true, size = "1100 700", match = { class = "steam", title = "Steam" } })
hl.window_rule({ size = "460 800", match = { class = "steam", title = "Friends List" } })

hl.window_rule({ workspace = 10, tile = true, match = { class = "^(steam_app_.*)$" } })
