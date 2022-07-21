local M = {}
M.setup = function()
	vim.cmd([[
	imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
	let g:copilot_no_tab_map = v:true
	]])
	-- vim.g.copilot_no_tab_map = true
	-- vim.g.copilot_assume_mapped = false
end
return M
