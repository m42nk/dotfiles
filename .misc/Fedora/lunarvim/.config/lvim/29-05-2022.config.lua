lvim.log.level = "warn"
lvim.format_on_save = false
lvim.transparent_window = true

-- vim.g.ayucolor = "light"
-- lvim.colorscheme = "ayu"
-- vim.cmd([[
-- " set list listchars=tab:\›\ ,trail:-,extends:>,precedes:<,space:·
-- " syntax match TrailingSpace /\s\+$/
-- " hi TrailingSpace guibg=red
-- ]])

-- vim.cmd([[
-- 	highlight ExtraWhitespace ctermbg=red guibg=red
-- 	match ExtraWhitespace /\s\+$/
-- ]])
vim.cmd([[
let g:better_whitespace_filetypes_blacklist=['dashboard', 'diff', 'git', 'gitcommit', 'unite', 'qf', 'help', 'markdown', 'fugitive']
]])

lvim.leader = "space"
vim.opt.relativenumber = true
vim.opt.cmdheight = 1
vim.opt.clipboard = ""
vim.opt.confirm = true
-- vim.opt.foldenable = false
vim.opt.foldmethod = "indent"
vim.opt.foldnestmax = 2
vim.opt.foldlevelstart = 100

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.nvimtree.show_icons.git = true
table.insert(lvim.builtin.project.patterns, ".root-project")
-- lvim.builtin.project.patterns = { ".root-project", unpack(lvim.builtin.project.patterns) }

-- lvim.builtin.dashboard.active = true
-- lvim.builtin.dashboard.custom_section = {
-- 	a = {
-- 		description = { "  Recently Used Files" },
-- 		command = "Telescope oldfiles",
-- 	},
-- 	b = {
-- 		description = { "  New File           " },
-- 		command = ":ene!",
-- 	},
-- 	c = {
-- 		description = { "  Recent Projects    " },
-- 		command = "Telescope projects",
-- 	},
-- 	d = {
-- 		description = { "  Find File          " },
-- 		command = "Telescope find_files",
-- 	},
-- 	e = {
-- 		description = { "  Find Word          " },
-- 		command = "Telescope live_grep",
-- 	},
-- }

-- lvim.builtin.telescope.pickers = { find_files = { hidden = true } }
-- lvim.builtin.telescope.pickers = {
-- 	find_files = {
-- 		hidden = true,
-- 		find_command = {
-- 			"rg",
-- 			-- "--sortr=modified",
-- 			"--files",
-- 			"--hidden",
-- 			-- "--glob='!.git'",
-- 		},
-- 	},
-- }

lvim.builtin.project.show_hidden = true

lvim.builtin.treesitter.context_commentstring.enable = true
lvim.builtin.treesitter.autotag = {
  enable = false,
  filetypes = {
    "html",
    "javascript",
    "javascriptreact",
    "typescriptreact",
    "blade",
    "php",
  },
}

lvim.builtin.treesitter.textobjects.select = {
  enable = true,
  lookahead = true,
  keymaps = {
    ["af"] = "@function.outer",
    ["if"] = "@function.inner",
    ["ac"] = "@class.outer",
    ["ic"] = "@class.inner",
  },
}

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "yaml",
  "c",
  "cpp",

  "lua",
  "python",

  "php",
  "javascript",
  "typescript",
  "tsx",
  "json",

  "css",
  "html",
  "scss",
}

lvim.builtin.treesitter.highlight.enabled = true
lvim.lsp.diagnostics.virtual_text = false

lvim.lsp.automatic_servers_installation = false

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  { exe = "black" },
  { exe = "shfmt" },
  { exe = "stylua" },
  { exe = "phpcsfixer" },
  {
    exe = "prettier",
    filetypes = { "typescript", "typescriptreact", "html", "css", "blade", "javascript", "javascriptreact" },
  },
})

require("user.keybindings").config()
require("user.plugins").config()

-- vim.list_extend(lvim.lsp.override, { "phpactor" })
-- require("lvim.lsp.manager").setup("phpactor", {})

vim.list_extend(lvim.lsp.override, { "intelephense" })
require("lvim.lsp.manager").setup("intelephense", {})

-- vim.list_extend(lvim.lsp.override, { "emmet_ls" })
-- require("lvim.lsp.manager").setup("emmet_ls", {})
-- require("lvim.lsp.manager").setup("emmet_ls", {
-- 	filetypes = { "html", "css", "javascript", "typescript", "typescriptreact", "blade" },
-- })

lvim.autocommands.custom_groups = {
  { "BufWinEnter", "*.mdx,*.md", "setlocal nospell" },
  { "BufWinEnter", "*.mdx,*.md", "setlocal wrap" },
  { "BufWinEnter", "*.mdx,*.md,*.txt", "nnoremap <buffer> 0 g0" },
  { "BufWinEnter", "*.mdx,*.md,*.txt", "nnoremap <buffer> j gj" },
  { "BufWinEnter", "*.mdx,*.md,*.txt", "nnoremap <buffer> k gk" },
  { "BufWinEnter", "*.mdx,*.md,*.txt", "nnoremap <buffer> A g$a" },
  { "BufWinEnter", "*.mdx,*.md,*.txt", "nnoremap <buffer> I g^i" },
  { "BufNewFile", "*.blade.php", "setlocal filetype=blade" },
  { "BufRead", "*.blade.php", "setlocal filetype=blade" },
}

require("luasnip/loaders/from_vscode").load({
  paths = { "~/.config/lvim/snippets/vscode-es7-javascript-react-snippets" },
})

-- lvim.log.level = "warn"
-- lvim.format_on_save = true
-- lvim.colorscheme = "onedarker"

-- lvim.leader = "space"
-- lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- -- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- -- lvim.builtin.which_key.mappings["t"] = {
-- --   name = "+Trouble",
-- --   r = { "<cmd>Trouble lsp_references<cr>", "References" },
-- --   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
-- --   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
-- --   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
-- --   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
-- --   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
-- -- }

-- -- TODO: User Config for predefined plugins
-- -- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
-- lvim.builtin.alpha.active = true
-- lvim.builtin.alpha.mode = "dashboard"
-- lvim.builtin.notify.active = true
-- lvim.builtin.terminal.active = true
-- lvim.builtin.nvimtree.setup.view.side = "left"
-- lvim.builtin.nvimtree.show_icons.git = 0

-- -- if you don't want all the parsers change this to a table of the ones you want
-- lvim.builtin.treesitter.ensure_installed = {
--   "bash",
--   "c",
--   "javascript",
--   "json",
--   "lua",
--   "python",
--   "typescript",
--   "tsx",
--   "css",
--   "rust",
--   "java",
--   "yaml",
-- }

-- lvim.builtin.treesitter.ignore_install = { "haskell" }
-- lvim.builtin.treesitter.highlight.enabled = true

-- -- generic LSP settings

-- -- ---@usage disable automatic installation of servers
-- -- lvim.lsp.automatic_servers_installation = false

-- -- ---@usage Select which servers should be configured manually. Requires `:LvimCacheReset` to take effect.
-- -- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- -- vim.list_extend(lvim.lsp.override, { "pyright" })

-- -- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- -- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- -- require("lvim.lsp.manager").setup("pylsp", opts)

-- -- -- you can set a custom on_attach function that will be used for all the language servers
-- -- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- -- lvim.lsp.on_attach_callback = function(client, bufnr)
-- --   local function buf_set_option(...)
-- --     vim.api.nvim_buf_set_option(bufnr, ...)
-- --   end
-- --   --Enable completion triggered by <c-x><c-o>
-- --   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- -- end

-- -- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- -- local formatters = require "lvim.lsp.null-ls.formatters"
-- -- formatters.setup {
-- --   { command = "black", filetypes = { "python" } },
-- --   { command = "isort", filetypes = { "python" } },
-- --   {
-- --     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
-- --     command = "prettier",
-- --     ---@usage arguments to pass to the formatter
-- --     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
-- --     extra_args = { "--print-with", "100" },
-- --     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
-- --     filetypes = { "typescript", "typescriptreact" },
-- --   },
-- -- }

-- -- -- set additional linters
-- -- local linters = require "lvim.lsp.null-ls.linters"
-- -- linters.setup {
-- --   { command = "flake8", filetypes = { "python" } },
-- --   {
-- --     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
-- --     command = "shellcheck",
-- --     ---@usage arguments to pass to the formatter
-- --     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
-- --     extra_args = { "--severity", "warning" },
-- --   },
-- --   {
-- --     command = "codespell",
-- --     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
-- --     filetypes = { "javascript", "python" },
-- --   },
-- -- }

-- -- Additional Plugins
-- -- lvim.plugins = {
-- --     {"folke/tokyonight.nvim"},
-- --     {
-- --       "folke/trouble.nvim",
-- --       cmd = "TroubleToggle",
-- --     },
-- -- }

-- -- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- -- lvim.autocommands.custom_groups = {
-- --   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- -- }
