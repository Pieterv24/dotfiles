hl.window_rule({
  match = { class = "^(resolve)$", title = "^(resolve)%", float = 1 },
  tag = "+davinci-splash",
})

hl.window_rule({
  stay_focused = true,
  match = { class = ".*[Rr]esolve.*", float = 1 },
})
