local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local custom = augroup("CustomGroup", { clear = true })

-- Highlight on yank
autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
  group = custom,
})

-- Don't continue commenting when pressing `o/O`
autocmd("FileType", {
  pattern = "*",
  command = [[
  set formatoptions-=o
  setlocal formatoptions-=o
  ]],
  group = custom,
})

-- Start insert mode on opening gitcommit file
autocmd("FileType", {
  pattern = "gitcommit",
  command = [[startinsert]],
  group = custom,
})

-- Map q to close
autocmd("FileType", {
  pattern = { "help", "startuptime", "qf", "lspinfo" },
  command = [[nnoremap <buffer><silent> q :close<CR>]],
  group = custom,
})

-- Map q to close
autocmd("FileType", {
  pattern = "man",
  command = [[nnoremap <buffer><silent> q :quit<CR>]],
  group = custom,
})

-- Map q to close
autocmd("FileType", {
  pattern = { "fugitive", "git" },
  command = [[ nnoremap <buffer><silent> q :bwipeout<CR> ]],
  group = custom,
})
