local M = {}

M.config = function()
	-- vim.g.tmux_navigator_insert_mode = 1
	vim.g.polyglot_disabled = { "php.plugin" }

	lvim.plugins = {
		{ "nvim-treesitter/nvim-treesitter-textobjects" },
		{ "windwp/nvim-ts-autotag", event = "InsertEnter" },
		-- { "intrntbrn/awesomewm-vim-tmux-navigator" },
		{ "shaunsingh/nord.nvim" },
		{ "tpope/vim-abolish" },
		{ "tpope/vim-repeat" },
		{ "tpope/vim-surround" },
		{ "tpope/vim-dadbod" },
		{ "kristijanhusak/vim-dadbod-ui" },
		{ "ThePrimeagen/harpoon" },
		{ "tommcdo/vim-exchange" },
		{ "iamcco/markdown-preview.nvim", run = "cd app && yarn install", cmd = "MarkdownPreview" },
		{ "farmergreg/vim-lastplace" },
		{
			"ayu-theme/ayu-vim",
		},
		{
			"ntpeters/vim-better-whitespace",
			config = function() end,
		},
		{
			"junegunn/vim-easy-align",
			config = function()
				require("user.easyalign").setup()
			end,
		},
		-- {
		-- 	"stevearc/vim-arduino",
		-- 	config = function()
		-- 		require("user.arduino").setup()
		-- 	end,
		-- },
		{
			"github/copilot.vim",
			config = function()
				require("user.copilot").setup()
			end,
		},
		{
			"marko-cerovac/material.nvim",
			config = function()
				require("user.material").setup()
			end,
		},
		{
			"vimwiki/vimwiki",
			config = function()
				require("user.vimwiki").setup()
			end,
		},
		-- {
		-- 	"karb94/neoscroll.nvim",
		-- 	config = function()
		-- 		require("user.neoscroll").setup()
		-- 	end,
		-- },
		-- {
		-- 	"norcalli/nvim-colorizer.lua",
		-- 	config = function()
		-- 		require("colorizer").setup({
		-- 			"*",
		-- 			lua = {
		-- 				RGB = true, -- #RGB hex codes
		-- 				RRGGBB = true, -- #RRGGBB hex codes
		-- 				names = true, -- "Name" codes like Blue
		-- 				RRGGBBAA = true, -- #RRGGBBAA hex codes
		-- 				-- Available modes: foreground, background
		-- 				mode = "background", -- Set the display mode.
		-- 			},
		-- 		})
		-- 	end,
		-- },
		{
			"andweeb/presence.nvim",
			as = "presence",
			config = function()
				require("user.presence").setup()
			end,
		},
		-- {
		-- 	"NTBBloodbath/rest.nvim",
		-- 	requires = { "nvim-lua/plenary.nvim" },
		-- 	config = function()
		-- 		require("user.rest-nvim").setup()
		-- 	end,
		-- },
		{ "ggandor/lightspeed.nvim" },

		-- {
		-- 	"neoclide/coc.nvim",
		-- 	branch = "release",
		-- 	config = function()
		-- 		require("user.coc").setup()
		-- 	end,
		-- },

		-- Laravel
		{ "sheerun/vim-polyglot" },
		-- { "tpope/vim-projectionist" },
		-- { "noahfrederick/vim-composer" },
		-- { "noahfrederick/vim-laravel" },
		{ "jwalton512/vim-blade" },
	}
end

return M
