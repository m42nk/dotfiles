require("dressing").setup {
  input = {
    enabled = true,
    relative = "editor",
    border = "single",
    min_width = { 0, 0.5 },
    win_options = {
      winblend = 0,
    },
  },
  select = {
    nui = {
      win_options = {
        winblend = 0,
      },
    },
    builtin = {
      win_options = {
        winblend = 0,
      }
    },
  },
}
