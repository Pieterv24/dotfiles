hl.window_rule({ tag = "+freecad", match = { class = "^(org.freecad.FreeCAD)$" } })

hl.window_rule({ tag = "+freecad-splash", match = { tag = "freecad", title = "^(FreeCAD)$" } })
hl.window_rule({ tag = "+freecad-main", match = { tag = "freecad", initial_title = "^(FreeCAD {0-9}.{0-9}.{0-9})$" } })

hl.window_rule({ tag = "+freecad-popup", match = { tag = "freecad", title = "^(Addon Manager.*)" } })
hl.window_rule({ tag = "+freecad-popup", match = { tag = "freecad", title = "^(Welcome)" } })
hl.window_rule({ tag = "+freecad-popup", match = { tag = "freecad", title = "^(BIM Setup)" } })

hl.window_rule({
  center = true,
  border_size = 0,
  float = true,
  no_blur = true,
  no_shadow = true,
  match = { tag = "freecad-splash" },
})

hl.window_rule({ center = true, float = true, match = { tag = "freecad-popup" } })
