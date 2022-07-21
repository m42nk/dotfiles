local M = {}

M.setup = function()
	require("neoscroll").setup({
		mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>" },
		easing_function = "quadratic",
	})

	local t = {}

	t["<C-y>"] = { "scroll", { "-0.10", "true", "100" } }
	t["<C-e>"] = { "scroll", { "0.10", "true", "100" } }

	require("neoscroll.config").set_mappings(t)
end

return M
