hl.window_rule({ float = true, center = true, size = "875 600", match = { tag = "floating-window" } })

hl.window_rule({ tag = "+floating-window", match = { class = "(org.gnome.NautilusPreviewer|org.gnome.Evince|imv|mpv|viewnior)" } })
hl.window_rule({
  tag = "+floating-window",
  match = {
    class = "(xdg-desktop-portal-gtk|sublime_text|DesktopEditors|org.gnome.Nautilus)",
    title = "^(Open.*Files?|Open [F|f]older.*|Save.*Files?|Save.*As|Save|All Files|.*wants to [open|save].*|[C|c]hoose.*|.*[I|i]mport.*|blob:.*)",
  },
})

hl.window_rule({ float = true, match = { class = "org.gnome.Calculator" } })
hl.window_rule({ float = true, match = { class = "^(org.pulseaudio.pavucontrol)$" } })
hl.window_rule({ float = true, match = { class = "^(blueman-manager)$" } })
hl.window_rule({ float = true, match = { class = "^(nm-connection-editor)$" } })
hl.window_rule({ float = true, match = { class = "^(qalculate-gtk)$" } })
hl.window_rule({ float = true, center = true, match = { class = "^(org.gnome.FileRoller)$" } })

hl.window_rule({ opacity = "1 1", match = { class = "^(zoom|vlc|mpv|org.kde.kdenlive|com.obsproject.Studio|imv|org.gnome.NautilusPreviewer|viewnior)$" } })
hl.window_rule({ rounding = 8, match = { tag = "pop" } })
