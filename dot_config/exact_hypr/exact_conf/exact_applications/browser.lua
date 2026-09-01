hl.window_rule({ tag = "+chromium-based-browser", match = { class = "((google-)?[cC]hrom(e|ium)|[bB]rave-browser|[mM]icrosoft-edge|Vivaldi-stable|helium)" } })
hl.window_rule({ tag = "+firefox-based-browser", match = { class = "([fF]irefox|zen|librewolf)" } })

hl.window_rule({ tile = true, opacity = "1 0.97", match = { tag = "chromium-based-browser" } })
hl.window_rule({ opacity = "1 0.97", match = { tag = "firefox-based-browser" } })
hl.window_rule({ opacity = "1.0 1.0", match = { initial_title = "((?i)(?:[a-z0-9-]+\\.)*youtube\\.com_/|app\\.zoom\\.us_/wc/home)" } })
