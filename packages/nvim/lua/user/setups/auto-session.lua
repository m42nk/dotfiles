local ok, autosession = pcall(require, "auto-session")
if not ok then
  return
end

autosession.setup {
  log_level = "error",
  auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
}

-- vim.o.sessionoptions =
--   "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

vim.o.sessionoptions =
  "buffers,curdir,folds,help,tabpages,winsize,winpos"

require("user.utils.keymaps").nmap {
  ["<leader>o"] = {
    name = "Session",
    ["l"] = { "<cmd>RestoreSession<cr>", "Load (restore) session" },
    ["s"] = { "<cmd>SaveSession<cr>", "Save session" },
    ["o"] = {
      "<cmd>Telescope session-lens search_session<cr>",
      "Search session",
    },
  },
}
