local M = {}

local cmd = function(name, action)
	vim.cmd("command! " .. name .. " " .. action)
end

M.config = function()
	lvim.leader = "space"
	local bslash = "\\"

	lvim.builtin.which_key.mappings["S"] = {
		name = "Session",
		s = { "<cmd>SessionSave<CR>", "Save Session" },
		l = { "<cmd>SessionLoad<CR>", "Load Session" },
	}

	lvim.builtin.which_key.mappings["C"] = { "<cmd>Copilot panel<CR>", "Copilot Panel" }
	lvim.builtin.which_key.mappings["n"] = { "<cmd>lua require('notify').dismiss()<CR>", "Dismiss notification" }
	lvim.builtin.which_key.mappings["F"] = { "<cmd>Ex %:p:h<CR>", "Indent Buffer" }
	lvim.builtin.which_key.mappings["lF"] = { "<cmd>norm mmggVG='m<CR>", "Indent Buffer" }
	lvim.builtin.which_key.mappings["w"] = { "", "Vimwiki" }
	lvim.builtin.which_key.mappings["W"] = { "<cmd>w!<CR>", "Save" }
	lvim.builtin.which_key.mappings[" "] = { "<cmd>w!<CR>", "Save" }
	lvim.builtin.which_key.mappings["t"] = { "<cmd>ToggleTerm<CR>", "Save" }

	-- leader is space
	-- lvim.builtin.which_key.mappings["f"] = {
	-- 	name = "Telescope",
	-- 	f = {"<cmd>Telescope find_files find_command=rg,--hidden,--files,--sortr=accessed,-g=!.git<CR>", "Find Files"}
	-- }

	lvim.keys.visual_mode["<leader>" .. "i"] = "!trans en:id -b<CR>"
	lvim.keys.visual_mode["<leader>" .. "e"] = "!trans id:en -b<CR>"

	lvim.keys.normal_mode["Y"] = "y$" -- Yank to end of line
	lvim.keys.normal_mode["n"] = "nzzzv" -- Next line then center
	lvim.keys.normal_mode["N"] = "Nzzzv" -- Prev line then center

	lvim.keys.normal_mode[bslash .. "d"] = '"_d' -- Delete not going to register
	lvim.keys.normal_mode[bslash .. "D"] = '"_D' -- Delete not going to register
	lvim.keys.normal_mode["<leader>!"] = "i#!/bin/env "

	-- lvim.keys.normal_mode["c"] = '"_c' -- Change not going to register
	lvim.keys.normal_mode["ci"] = '"_ci' -- Change whole line not going to register
	lvim.keys.normal_mode["ca"] = '"_ca' -- Change whole line not going to register
	lvim.keys.normal_mode["C"] = '"_C' -- Change whole line not going to register
	lvim.keys.normal_mode["gJ"] = "gJ" -- Join lines without space

	lvim.keys.visual_mode["p"] = '"_dP' -- Paste not going to register

	lvim.keys.normal_mode[bslash .. "y"] = '"+y'
	lvim.keys.visual_mode[bslash .. "y"] = '"+y'

	lvim.keys.normal_mode[bslash .. "Y"] = '"+Y'
	lvim.keys.visual_mode[bslash .. "Y"] = '"+Y'

	lvim.keys.normal_mode[bslash .. "p"] = '"+p'
	lvim.keys.visual_mode[bslash .. "p"] = '"+p'

	lvim.keys.normal_mode[bslash .. "P"] = '"+P'
	lvim.keys.visual_mode[bslash .. "P"] = '"+P'

	lvim.keys.normal_mode['c"`'] = '<cmd>norm cs"`ysa`}<CR>}'
	lvim.keys.normal_mode["<A-S-j>"] = "mmyyP`m"
	lvim.keys.normal_mode["<A-S-k>"] = "mmyyP`mk"

	vim.cmd([[
	" Re-order to previous/next
	nnoremap <silent>    <A-<> :BufferLineMovePrev<CR>
	nnoremap <silent>    <A->> :BufferLineMoveNext<CR>
	" Goto buffer in position...
	nnoremap <silent>    <A-1> :BufferLineGoToBuffer 1<CR>
	nnoremap <silent>    <A-2> :BufferLineGoToBuffer 2<CR>
	nnoremap <silent>    <A-3> :BufferLineGoToBuffer 3<CR>
	nnoremap <silent>    <A-4> :BufferLineGoToBuffer 4<CR>
	nnoremap <silent>    <A-5> :BufferLineGoToBuffer 5<CR>
	nnoremap <silent>    <A-6> :BufferLineGoToBuffer 6<CR>
	nnoremap <silent>    <A-7> :BufferLineGoToBuffer 7<CR>
	nnoremap <silent>    <A-8> :BufferLineGoToBuffer 8<CR>
	]])

	-- leader is \
	vim.cmd([[nnoremap <leader>s :s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
	vim.cmd([[nnoremap <leader>S :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

	vim.cmd([[
	nnoremap <space>h<space> :lua require("harpoon.mark").add_file()<CR>

	nnoremap <space>ht :lua require("harpoon.ui").toggle_quick_menu()<CR>

	nnoremap <space>hh :lua require("harpoon.ui").nav_file(1)<CR>
	nnoremap <space>hj :lua require("harpoon.ui").nav_file(2)<CR>
	nnoremap <space>hk :lua require("harpoon.ui").nav_file(3)<CR>
	nnoremap <space>hl :lua require("harpoon.ui").nav_file(4)<CR>
	]])

	-- vim.g.tmux_navigator_insert_mode = 1

	lvim.keys.normal_mode[bslash .. "b"] = "<cmd>.!boxen<CR>"
	lvim.keys.visual_block_mode[bslash .. "b"] = "<cmd>.!boxen<CR>"

	-- add your own keymapping
	-- lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
	vim.keymap.del("i", "kj")
	-- override a default keymapping
	-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )
end
return M
