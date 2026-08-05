local primary = "rgb(ffb4a6)"
local surface = "rgb(181211)"
local secondary = "rgb(e7bdb5)"
local err = "rgb(ffb4ab)"

hl.config({
  general = {
    col = {
      active_border = primary,
      inactive_border = surface,
    },
  },
  group = {
    col = {
      border_active = secondary,
      border_inactive = surface,
      border_locked_active = err,
      border_locked_inactive = surface,
    },
    groupbar = {
      col = {
        active = secondary,
        inactive = surface,
        locked_active = err,
        locked_inactive = surface,
      },
    },
  },
})
