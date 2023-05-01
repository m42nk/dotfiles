local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local custom = augroup("CustomGroup", { clear = true })

-- Highlight on yank
autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
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

-- Toggle line number mode based on events_setup
-- Show relativenumber if buffer is focused
autocmd({ "BufEnter", "FocusGained" }, {
  callback = function(opts)
    -- Don't toggle relativenumber if number is hidden
    if vim.wo.number then
      vim.wo.relativenumber = true
    end
  end,
  group = custom,
})

autocmd({ "BufLeave", "FocusLost" }, {
  callback = function(opts)
    vim.wo.relativenumber = false
  end,
  group = custom,
})

autocmd({ "BufReadPost" }, {
  callback = function()
    vim.bo.modifiable = true
  end,
  group = custom,
})

-- Autoreload config files
-- Kitty
autocmd("BufWritePost", {
  -- pattern = vim.fn.expand("~") .. '/.config/kitty/*.conf',
  -- Handles when vim resolve the symlinks to other than home dir
  pattern = {"*/.config/kitty/*.conf", "*/kitty/*.conf"},
  callback = function()
    vim.fn.system "kill -SIGUSR1 $(pgrep kitty)"
  end,
  group = custom,
})

-- Tmux
-- see https://github.com/m42nk/dotfiles-tmux
autocmd("BufWritePost", {
  -- pattern = vim.fn.expand("~") .. '*/.config/tmux/*.conf',
  -- Handles when vim resolve the symlinks to other than home dir
  pattern = {"*/.config/tmux/*.conf", "*/tmux/*.conf"},
  callback = function()
    if not vim.env["TMUX"] then
      vim.schedule(function()
        vim.notify "Not inside tmux"
      end)
      return
    end

    local output = vim.fn.system [[
    tmux source "$_cfg_default" "$_cfg_main" 2>&1 && \
    tmux display 'Config reloaded!'
    ]]

    if output ~= "" then
      -- NOTE: unsure how to pipe shell output to tmux new-window
      -- vim.fn.system("tmux new-window", output)
      -- Use vim output instead
      vim.pretty_print(output)
    end
  end,
  group = custom,
})
