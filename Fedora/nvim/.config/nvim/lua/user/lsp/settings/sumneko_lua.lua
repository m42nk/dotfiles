local opts = {
	-- _disable_formatting = true,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
			telemetry = {
				enable = false,
			},
		},
	},
}

local ok, lua_dev = pcall(require, "lua-dev")
if ok then
	opts = lua_dev.setup(opts)
end

opts._disable_formatting = true

return opts
