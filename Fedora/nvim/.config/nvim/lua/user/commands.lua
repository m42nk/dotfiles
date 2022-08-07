local command = vim.api.nvim_create_user_command

----------------------------------
-- Create and edit sibling
-- eg:
-- :ES b.lua
-- [current]: `nvim/lua/user/a.lua`
-- [sibling]: `nvim/lua/user/b.lua`
----------------------------------
command("ES", function(opts)
  -- Get new filename from argument
  local target_name = opts.args

  -- Get directory name from current file
  local target_dir = vim.fn.expand "%:p:h"

  vim.cmd("e " .. target_dir .. "/" .. target_name)
end, { nargs = 1 })

-----------------------------------
-- Edit init.lua
-----------------------------------
command("E", function(opts)
  vim.cmd [[e $MYVIMRC]]
end, { nargs = 0 })

-- Run PackerSync
command("PS", function(opts)
  vim.cmd [[PackerSync]]
end, { nargs = 0 })

-----------------------------------
-- Source current file
-----------------------------------
command("R", function()
  -- Resolved to $HOME/.config/nvim
  local config_dir = NvimConfigDir
  local current_file = vim.fn.expand "%:p"

  local module_name = current_file:gsub(vim.fn.resolve(config_dir), "")

  if module_name:match "^/lua/user" then
    module_name = module_name
      :gsub("/", ".")   -- replace / with .
      :gsub(".lua", "") -- remove .lua extension
      :sub(2, -1)       -- remove preceding .

    package.loaded[module_name] = nil
  end

  vim.cmd [[source %]]

  vim.schedule(function()
    vim.notify("Reloaded " .. module_name)
  end)
end, {})

----------------------------------
-- Align keymaps
----------------------------------
command("AlignKeymap", function()
  -- vim.cmd [[<line1>,<line2>EasyAlign **,<cr>]]
  vim.cmd [['<,'>EasyAlign *,]]
end, { range = true })

----------------------------------
-- Command line abbreviations
----------------------------------
vim.cmd [[
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
]]
