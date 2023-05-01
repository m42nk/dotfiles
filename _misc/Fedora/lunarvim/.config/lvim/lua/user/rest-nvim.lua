local M = {}

M.setup = function()
	require("rest-nvim").setup({
		result_split_horizontal = true,
		skip_ssl_verification = true,

		highlight = {
			enabled = true,
			timeout = 150,
		},

		jump_to_request = false,
	})

	vim.api.nvim_set_keymap("n", "gRr", "<Plug>RestNvim", {})
	vim.api.nvim_set_keymap("n", "gRp", "<Plug>RestNvimPreview", {})
	vim.api.nvim_set_keymap("n", "gRl", "<Plug>RestNvimLast", {})
end
return M
