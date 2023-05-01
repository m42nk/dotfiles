local k = require "user.utils.keymaps"
local packer_install = function()
  require("packer").clean()
  require("packer").install()
end

-----------------------
-- Base keymaps
-----------------------
-- k.nmap {
--   [""]
-- }

-----------------------
-- Tmux Keymaps
-----------------------

local tmux_nav = require("user.utils.tmux-integration").tmux_nav

k.nmap(
  "<leader>s",
  ":s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
  "Sed word under cursor",
  { silent = false }
)
k.nmap(
  "<leader>S",
  ":S/<C-r><C-w>/<C-r><C-w>/g<Left><Left>",
  "Sed word under cursor (case-aware)",
  { silent = false }
)

vim.cmd [[
autocmd cursorhold * set nohlsearch
noremap n :set hlsearch<cr>n
noremap N :set hlsearch<cr>N
noremap / :set hlsearch<cr>/
noremap ? :set hlsearch<cr>?
]]

k.map {
  ["<C-w>h"] = { tmux_nav "h", "Focus left" },
  ["<C-w>l"] = { tmux_nav "l", "Focus right" },
  ["<C-w>j"] = { tmux_nav "j", "Focus bottom" },
  ["<C-w>k"] = { tmux_nav "k", "Focus left" },
}

k.imap("jk", "<esc>", "Normal mode")
k.nmap("<c-q>", "<cmd>QuickFixToggle<cr>", "Toggle quickfix list")
k.nmap("<leader>ps", packer_install, "Clean and install new packer plugin")

k.nmap("[q", "<cmd>cprev<cr>", "Previous entry in qflist")
k.nmap("]q", "<cmd>cnext<cr>", "Next entry in qflist")

k.nmap("<leader><space>", "<cmd>:w<cr>", "Save file")
k.nmap("<c-s>", "<cmd>:w<cr>", "Save file")

k.nmap {
  ["<leader><bslash>"] = {
    name = "Config",
    i = {
      "<cmd>e ~/.config/nvim/init.lua<cr>",
      "edit init.lua",
    },
    u = {
      "<cmd>e ~/.config/nvim/user/<cr>",
      "edit user",
    },
    p = {
      "<cmd>e ~/.config/nvim/lua/user/plugin/plugins.lua<cr>",
      "edit plugins.lua",
    },
    c = {
      "<cmd>e ~/.config/nvim/plugin/setups/<cr>",
      "edit plugins setup",
    },
  },
}

k.nmap("<leader>h", "<cmd>nohlsearch<cr>", "Remove highlight")
-- k.nmap("<esc>", "<cmd>nohlsearch<cr>", "Remove highlight")

-- Don't jump to next match on * or #
k.nmap("*", "<cmd>keepjumps normal! mi*`i<cr>", "Highlight/jump next match")
k.nmap("#", "<cmd>keepjumps normal! mi#`i<cr>", "Highlight/jump prev match")

k.vmap("<", "<gv", "Remove indent")
k.vmap(">", ">gv", "Add indent")

k.nmap {
  -- ["<leader>c"] = { "<cmd>bdelete<cr>", "Buffer close" },
  -- ["<leader>C"] = { "<cmd>bwipeout<cr>", "Buffer wipeout" },
  ["<leader>c"] = { "<cmd>bp|bd #<cr>", "Buffer close, preserve split" },
  ["<leader>C"] = { "<cmd>bdelete<cr>", "Buffer close" },
  ["<c-a>"] = { "<cmd>b#<cr>", "Alternate (last) buffer" },
}
