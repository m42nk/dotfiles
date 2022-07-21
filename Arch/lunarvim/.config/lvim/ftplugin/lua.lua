vim.list_extend(lvim.lsp.override, { "sumneko_lua" })
require("lvim.lsp.manager").setup("sumneko_lua", {
	settings = {
		Lua = {
			workspace = {
				library = {
					["/usr/share/nvim/runtime/lua"] = true,
					["/usr/share/nvim/runtime/lua/lsp"] = true,
					["/usr/share/awesome/lib"] = true,
				},
			},
			diagnostics = {
				enable = true,
				globals = {
					-- VIM
					"vim",
					"use", -- Packer use keyword
					-- AwesomeWM
					"awesome",
					"client",
					"root",
				},
			},
		},
	},
})
