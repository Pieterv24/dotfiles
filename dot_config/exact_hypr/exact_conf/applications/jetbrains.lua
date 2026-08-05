hl.window_rule({
  tag = "+jetbrains-splash",
  match = { class = "^(jetbrains-.*)$", title = "^(splash)$", float = 1 },
})

hl.window_rule({ center = true, no_focus = true, border_size = 0, match = { tag = "jetbrains-splash" } })

hl.window_rule({
  tag = "+jetbrains",
  min_size = "(monitor_w*0.5) (monitor_h*0.5)",
  match = { class = "^(jetbrains-.*)", title = "^()$", float = 1 },
})

hl.window_rule({ center = true, stay_focused = true, border_size = 0, match = { tag = "jetbrains" } })

hl.window_rule({ no_initial_focus = true, match = { class = "^(jetbrains-.*)$", title = "^(win.*)$", float = 1 } })
hl.window_rule({ no_follow_mouse = true, match = { class = "^(jetbrains-.*)$" } })
hl.window_rule({ float = true, match = { class = "^(jetbrains-.*)$", initial_title = "^Welcome .*" } })
hl.window_rule({ no_initial_focus = true, match = { class = "^(jetbrains-.*)$", xwayland = 1 } })
