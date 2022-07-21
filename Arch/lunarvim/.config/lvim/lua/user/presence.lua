local M = {}
M.setup = function()
	vim.g.presence_neovim_image_text = "Buang vscode mu, ngoding di vim bersamaku"
	vim.g.presence_main_image = "file"
	vim.g.presence_enable_line_number = false
	vim.g.presence_editing_text = "Buang vscode mu,\n ngoding di vim bersamaku"
	vim.g.presence_file_explorer_text = "Browsing %s"
	vim.g.presence_git_commit_text = "Committing changes"
	vim.g.presence_plugin_manager_text = "Managing plugins"
	vim.g.presence_reading_text = "Reading %s"
	vim.g.presence_workspace_text = "Working on something"
	vim.g.presence_line_number_text = "Line %s out of %s"

	-- require("presence").setup({
	-- 	neovim_image_text = "Buang vscode mu, ngoding di vim bersamaku",
	-- 	main_image = "file",
	-- 	enable_line_number = false,
	-- 	-- editing_text        = "Mengoding %s",
	-- 	editing_text = "Buang vscode mu,\n ngoding di vim bersamaku",
	-- 	file_explorer_text = "Browsing %s",
	-- 	git_commit_text = "Committing changes",
	-- 	plugin_manager_text = "Managing plugins",
	-- 	reading_text = "Reading %s",
	-- 	workspace_text = "Working on something",
	-- 	-- workspace_text      = "",
	-- 	line_number_text = "Line %s out of %s",
	-- })
end
return M
