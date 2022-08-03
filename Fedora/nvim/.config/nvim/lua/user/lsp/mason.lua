local M = {}

local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
	return
end

local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
	return
end

M.setup = function()
	mason.setup()

	mason_lspconfig.setup({
		ensure_installed = {
			"codespell",
			-- "misspell",
			"sumneko_lua",
			"cssls",
			"html",
			"tsserver",
			"pyright",
			"bashls",
			"jsonls",
			"yamlls",
		},
	})

	local opts = {
		on_attach = require("user.lsp.on_attach"),
		capabilities = require("user.lsp.capabilities"),
	}

	mason_lspconfig.setup_handlers(
		vim.tbl_deep_extend("force", require("user.lsp.settings").custom_configurations(opts), {
			function(server_name)
				require("lspconfig")[server_name].setup(opts)
			end,
		})
	)

	-- mason_lspconfig.setup_handlers({
	--     function(server_name)
	--         require("lspconfig")[server_name].setup(opts)
	--     end,
	--     -- ["sumneko_lua"] = function()
	--     --     require("lspconfig").sumneko_lua.setup({
	--     --         on_attach = opts.on_attach,
	--     --         capabilities = opts.capabilities,
	--     --         settings = {
	--     --             Lua = {
	--     --                 diagnostics = {
	--     --                     globals = { "vim" },
	--     --                 },
	--     --                 workspace = {
	--     --                     library = {
	--     --                         [vim.fn.expand("$VIMRUNTIME/lua")] = true,
	--     --                         [vim.fn.stdpath("config") .. "/lua"] = true,
	--     --                     },
	--     --                 },
	--     --                 telemetry = {
	--     --                     enable = false,
	--     --                 },
	--     --             },
	--     --         },
	--     --     })
	--     -- end,
	--     -- ["sumneko_lua"] = function()
	--     -- 	require("lspconfig").sumneko_lua.setup(require("lua-dev").setup({
	--     -- 		settings = {
	--     -- 			Lua = {
	--     -- 				format = {
	--     -- 					enable = false,
	--     -- 				},
	--     -- 				hint = {
	--     -- 					enable = true,
	--     -- 					arrayIndex = "Disable", -- "Enable", "Auto", "Disable"
	--     -- 					await = true,
	--     -- 					paramName = "Disable", -- "All", "Literal", "Disable"
	--     -- 					paramType = false,
	--     -- 					semicolon = "Disable", -- "All", "SameLine", "Disable"
	--     -- 					setType = true,
	--     -- 				},
	--     -- 				diagnostics = {
	--     -- 					globals = { "P" },
	--     -- 				},
	--     -- 			},
	--     -- 		},
	--     -- 	}))
	--     -- end,
	-- })
end

return M
