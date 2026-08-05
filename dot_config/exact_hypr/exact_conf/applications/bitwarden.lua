hl.window_rule({
  no_screen_share = true,
  match = { class = "^(Bitwarden)$" },
})

local handled_bitwarden_windows = {}

local function normalize_address(address)
  local addr = tostring(address or "")
  if addr == "" then
    return nil
  end
  if not addr:match("^0x") then
    addr = "0x" .. addr
  end
  return "address:" .. addr
end

local function mark_key_for_window(window)
  if not window then
    return nil
  end
  return normalize_address(window.address)
end

local function clear_window_state(window)
  local key = mark_key_for_window(window)
  if key then
    handled_bitwarden_windows[key] = nil
  end
end

hl.on("window.title", function(window)
  if not window then
    return
  end

  local title = tostring(window.title or "")
  local is_bitwarden_popup = title:find("(Bitwarden", 1, true)
    and title:find("Password Manager) - Bitwarden", 1, true)

  if not is_bitwarden_popup then
    return
  end

  local selector = normalize_address(window.address)
  if not selector then
    return
  end

  if handled_bitwarden_windows[selector] then
    return
  end
  handled_bitwarden_windows[selector] = true

  hl.dispatch(hl.dsp.window.float({ action = "on", window = selector }))
  hl.dispatch(hl.dsp.exec_raw("resizewindowpixel exact 20% 54%," .. selector))
  hl.dispatch(hl.dsp.window.center({ window = selector }))
end)

hl.on("window.close", clear_window_state)
hl.on("window.destroy", clear_window_state)
