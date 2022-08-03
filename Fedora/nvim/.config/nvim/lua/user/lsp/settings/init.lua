local M = {}

-- Create a table of custom configurations for language servers
-- :h mason-lspconfig.setup_handlers

M.custom_configurations = function(opts)
    -- List lsp server settings

	-- local configs = vim.split(vim.fn.glob("./*lua"), "\n")
    local configs = require("mason-lspconfig").get_installed_servers()
	local tbl = {}

	for _, config in ipairs(configs) do
        -- Get the actual server name
		-- local name = string.gsub(config, "./(.*).lua", "%1", 1)
        local name = config

		if name ~= "" and name ~= "init" then
            -- Check if settings found
			local ok, _opts = pcall(require, "user.lsp.settings." .. name)

			if ok then
                -- Add the configuration to the table
				tbl[name] = function()
					opts = vim.tbl_deep_extend("force", _opts, opts)
					require("lspconfig")[name].setup(opts)
				end
			end
		end
	end

	return tbl
end

return M
