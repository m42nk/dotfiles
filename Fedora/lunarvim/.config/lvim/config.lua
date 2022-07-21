-- general
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "onedarker"
lvim.transparent_window = true

-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

vim.opt.relativenumber = true
vim.opt.cmdheight = 1
vim.opt.clipboard = ""
vim.opt.confirm = true
-- vim.opt.foldenable = false
vim.opt.foldmethod = "indent"
vim.opt.foldnestmax = 2
vim.opt.foldlevelstart = 100

lvim.builtin.nvimtree.setup.view.side = "right"
-- lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.notify.active = true

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

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

lvim.builtin.treesitter.textobjects.swap = {
	enable = true,
	swap_next = {
		["<leader>a"] = "@parameter.inner",
	},
	swap_previous = {
		["<leader>A"] = "@parameter.inner",
	},
}

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
	-- {
	-- 	exe = "prettier_d_slim",
	-- 	-- args = { "--stdin" },
	-- 	filetypes = { "typescript", "typescriptreact", "html", "css", "blade", "javascript", "javascriptreact" },
	-- },
	{
		exe = "eslint_d",
		filetypes = { "typescript", "typescriptreact", "html", "css", "blade", "javascript", "javascriptreact" },
	},
})

-- local linters = require("lvim.lsp.null-ls.linters")
-- linters.setup({
-- 	{
-- 		exe = "eslint",
-- 		filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
-- 	},
-- })

local code_actions = require("lvim.lsp.null-ls.code_actions")
code_actions.setup({
	{
		exe = "eslint_d",
		filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "vue" },
	},
})

require("user.keybindings").config()
require("user.plugins").config()

-- vim.list_extend(lvim.lsp.override, { "intelephense" })
lvim.lsp.automatic_configuration.skipped_server = {
	"intelephense",
	-- "phpactor",
}
require("lvim.lsp.manager").setup("intelephense", {})

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

-- require("lvim.lsp.manager").setup("emmet_ls", {
-- 	capabilities = capabilities,
-- 	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
-- })

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lvim.lsp.manager").setup("tailwindcss")

require("lvim.lsp.manager").setup("emmet_ls", {
	cmd = { "ls_emmet", "--stdio" },
	filetypes = {
		"html",
		"css",
		"scss",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"haml",
		"xml",
		"xsl",
		"pug",
		"slim",
		"sass",
		"stylus",
		"less",
		"sss",
		"hbs",
		"handlebars",
	},
})

-- local autocmd_groups = {
--   { "BufWinEnter", "*.mdx,*.md", "setlocal nospell" },
--   { "BufWinEnter", "*.mdx,*.md", "setlocal wrap" },
--   { "BufWinEnter", "*.mdx,*.md,*.txt", "nnoremap <buffer> 0 g0" },
--   { "BufWinEnter", "*.mdx,*.md,*.txt", "nnoremap <buffer> j gj" },
--   { "BufWinEnter", "*.mdx,*.md,*.txt", "nnoremap <buffer> k gk" },
--   { "BufWinEnter", "*.mdx,*.md,*.txt", "nnoremap <buffer> A g$a" },
--   { "BufWinEnter", "*.mdx,*.md,*.txt", "nnoremap <buffer> I g^i" },
-- }

local markdown_autocmds = {
	"setlocal nospell",
	"setlocal wrap",
	"nnoremap <buffer> 0 g0",
	"nnoremap <buffer> j gj",
	"nnoremap <buffer> k gk",
	"nnoremap <buffer> A g$a",
	"nnoremap <buffer> I g^i",
}

for _, value in ipairs(markdown_autocmds) do
	vim.api.nvim_create_autocmd("BufWinEnter", {
		pattern = { "*.mdx", "*.md" },
		command = value,
	})
end

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "*.blade.php",
	command = "setlocal filetype=blade",
})

require("luasnip/loaders/from_vscode").load({
	paths = { "~/.config/lvim/snippets/lib/vscode-es7-javascript-react-snippets" },
})

vim.cmd([[

nnoremap <Tab> :lua require('luasnip').jump(1)<CR>
nnoremap <S-Tab> :lua require('luasnip').jump(-1)<CR>

]])

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
