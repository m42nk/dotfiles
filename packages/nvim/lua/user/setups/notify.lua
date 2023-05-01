local ok, notify = pcall(require, "notify")

if not ok then
  return
end

notify.setup {
  background_colour = "#00000000",
}

vim.notify = notify

require("user.utils.keymaps").nmap {
  ["<leader>tn"] = { "<cmd>Telescope notify<cr>", "Show notifications" },
  ["<leader>nd"] = {
    "<cmd>lua require('notify').dismiss()<cr>",
    "Dismiss notifications",
  },
}
