hl.on("hyprland.start", function()
  hl.exec_cmd("hyprctl setcursor Breeze_Default 24")
  hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme 'Breeze_Default'")
end)

hl.config({
  cursor = {
    no_hardware_cursors = 2,
  },
})
