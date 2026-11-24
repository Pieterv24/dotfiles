-- Dropdown terminal
local dropdown_cmd = "ghostty --class=com.pieter.dropdown"

hl.workspace_rule({ workspace = "special:dropdown", on_created_empty = dropdown_cmd })

hl.window_rule({
    name = "dropdown-terminal",
    match = { class = "^com\\.pieter\\.dropdown$" },
    float = true,
    size = { "monitor_w * 0.9", "monitor_h * 0.55" },
    move = { "monitor_w * 0.05", "52" },
    workspace = "special:dropdown",
})

hl.bind("ALT + grave", hl.dsp.workspace.toggle_special("dropdown"))

-- Slide the special workspace in from the top
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 4, bezier = "easeOutQuint", style = "slidefadevert -100%" })