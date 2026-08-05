require("conf.applications.bitwarden")
require("conf.applications.browser")
require("conf.applications.davinci-resolve")
require("conf.applications.jetbrains")
require("conf.applications.steam")
require("conf.applications.system")
require("conf.applications.terminals")
require("conf.applications.freecad")
require("conf.applications.winetricks")

hl.window_rule({
  name = "suppress-maximize-events",
  match = { class = ".*" },
  suppress_event = "maximize",
})

hl.window_rule({
  name = "fix-xwayland-drags",
  match = {
    class = "^$",
    title = "^$",
    xwayland = true,
    float = true,
    fullscreen = false,
    pin = false,
  },
  no_focus = true,
})

hl.window_rule({
  name = "move-hyprland-run",
  match = { class = "hyprland-run" },
  move = "20 monitor_h-120",
  float = true,
})

hl.window_rule({
  float = true,
  pin = true,
  move = "((monitor_w*0.695)) ((monitor_h*0.04))",
  match = { title = "^(Picture-in-Picture)$" },
})

hl.window_rule({
  name = "xwayland-video-bridge-fixes",
  match = { class = "xwaylandvideobridge" },
  no_initial_focus = true,
  no_focus = true,
  no_anim = true,
  no_blur = true,
  max_size = "1 1",
  opacity = 0.0,
})

hl.window_rule({
  name = "floating-password-firefox",
  match = {
    class = "^(firefox-developer-edition|firefox)$",
    title = "^Password Required - (.*)$",
  },
  float = true,
})

-- Noctalia Settings
hl.window_rule({
    match = { class = "dev.noctalia.Noctalia" },
    float = true,
    size = { 1080, 920 },
})

hl.layer_rule({
  name = "noctalia",
  match = {
    namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd)$",
  },
  no_anim = true,
  ignore_alpha = 0.5,
  blur = true,
  blur_popups = true,
})

hl.window_rule({ float = true, match = { class = "(wineboot.exe)" } })
hl.window_rule({ float = true, match = { class = "(gamescope)" } })

hl.window_rule({ workspace = 10, tile = true, match = { class = "^(Minecraft.*)$" } })
hl.window_rule({ workspace = 10, tile = true, match = { title = "^(Minecraft.*)$" } })
hl.window_rule({ workspace = 10, tile = true, match = { class = "^(minecraft.*)$" } })

hl.window_rule({ workspace = 10, tile = true, match = { class = "^(RuneScape)$" } })
hl.window_rule({ workspace = 10, match = { class = "^(Rs3linux)$" } })

hl.window_rule({ workspace = 10, tile = true, maximize = true, match = { title = "^(HDOS .*)$" } })
hl.window_rule({ workspace = 10, match = { title = "^(HDOS)$" } })

hl.window_rule({ workspace = 10, tile = true, match = { title = "^(RuneLite)$" } })
hl.window_rule({ workspace = 10, match = { title = "^(RuneLite Launcher)$" } })

hl.window_rule({ workspace = 9, match = { title = "^(Bolt Launcher)$" } })

hl.window_rule({ workspace = "11 silent", match = { class = "(fractal)" } })
hl.window_rule({ workspace = "11 silent", match = { class = "(Element)" } })
hl.window_rule({ workspace = "11 silent", match = { class = "(discord)" } })
hl.window_rule({ workspace = "11 silent", match = { class = "(vesktop)" } })

hl.window_rule({ workspace = "12 silent", match = { class = "(spotify)" } })

hl.window_rule({ workspace = 10, tile = true, fullscreen = true, match = { class = "(winboat)" } })
