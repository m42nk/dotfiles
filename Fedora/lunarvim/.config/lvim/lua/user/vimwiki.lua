local M = {}

M.setup = function()
	-- vim.g.vimwiki_list = {
	-- 	path = "~/vimwiki/",
	-- 	name = "Vimwiki",
	-- 	syntax = "markdown",
	-- 	ext = ".md",
	-- }

	vim.cmd([[
	let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

	" Load new notes with frontmatter
	func! LoadFrontmatter()
	" build frontmatter
	let $Frontmatter = "---\ntitle: " . expand('%:t:r')  . "\ndate: " . strftime("%Y-%m-%d") . "\ntags: \nreferences: \n---\n"

	" echo frontmatter into file
	0r !echo $Frontmatter
	endfunc

	autocmd BufNewFile ~/vimwiki/*.md silent! call LoadFrontmatter()
	]])
end

return M
