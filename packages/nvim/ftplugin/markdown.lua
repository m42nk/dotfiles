vim.opt.wrap = true
vim.opt.linebreak=true
vim.opt.showbreak='…'

vim.cmd [[
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
nnoremap <expr> 0 v:count ? '0' : 'g^'
nnoremap <expr> $ v:count ? '$' : 'g$'
nnoremap <expr> A v:count ? 'A' : 'g$a'
nnoremap <expr> I v:count ? 'A' : 'g^a'
]]
