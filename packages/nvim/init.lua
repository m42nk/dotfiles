-- Improve startup time with impatient
pcall(require, "impatient")

--
-- Core plugins
--
require "user.options"
require "user.plugin"
require "user.colorscheme"
require "user.globals"
require "user.commands"
require "user.autocommands"
require "user.lsp"
require "user.cmp"
require "user.treesitter"
require "user.lualine"
require "user.keymaps"
-- require "user.neorg"
require "user.highlight"
require "user.status"

--
-- Other plugins
--
local load = require("user.utils.load").generate_loader "user.setups"

load "auto-session"
load "autopairs"
load "comment"
load "cybu"
load "gitsigns"
load "iswap"
load "lastplace"
load "leap"
load "luasnip"
load "neo-tree"
-- load "neoscroll"
load "project"
load "readline"
load "telescope"
load "tpope"
load "notify"
load "typescript"
load "which-key"
load "dressing"

load "code_runner"
load "colorizer"
load "clipboard-image"

load "chatgpt"

-- load "mini.starter"
-- load "mini.bufremove"
-- load "bufferline"
-- load "dashboard"

vim.cmd [[
imap <silent><script><expr> <C-L> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
]]

vim.g.copilot_filetypes = {
  ['markdown'] = true,
  ['yml'] = true,
  ['yaml'] = true,
}
