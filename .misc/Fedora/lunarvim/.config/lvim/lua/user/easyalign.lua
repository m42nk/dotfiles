local M = {}

M.setup = function()
	-- nmap ga <Plug>(EasyAlign)
	-- xmap ga <Plug>(EasyAlign)
	-- lvim.keys.normal_mode[bslash .. "d"] = '"_d' -- Delete not going to register
	-- lvim.keys.normal_mode[bslash .. "D"] = '"_D' -- Delete not going to register

	vim.api.nvim_set_keymap("n", "\\ga", "<Plug>(EasyAlign)", {})
	vim.api.nvim_set_keymap("x", "\\ga", "<Plug>(EasyAlign)", {})
end

return M
