local command = vim.api.nvim_create_user_command

command("QuickFixToggle", function()
  local win_infos = vim.fn.getwininfo()

  for _, t in pairs(win_infos) do
    if t.quickfix == 1 then
      vim.cmd "cclose"
    else
      vim.cmd "copen"
    end
  end
end, {})

----------------------------------
-- Lua put (custom global function)
----------------------------------
--TODO: add `redir` to add to split buffer
command("Inspect", function(opts)
  local args = opts.args
  vim.cmd("lua =" .. args)

  -- if #fargs == 1 then
  --   vim.cmd("lua =" .. opts.args)
  --   return
  -- end

  -- for _, arg in pairs(fargs) do
  --   vim.cmd("lua =" .. arg)
  -- end
end, { nargs = "+" })

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
  local config_dir = vim.env.XDG_CONFIG_HOME .. "/nvim"
  local current_file = vim.fn.expand "%:p" or ""

  local module_name = current_file:gsub(vim.fn.resolve(config_dir), "")

  if module_name:match "^/lua/user" then
    module_name = module_name
      :gsub("/", ".") -- replace / with .
      :gsub(".lua", "") -- remove .lua extension
      :sub(2, -1) -- remove preceding .

    if module_name:match ".init$" then
      module_name = module_name:gsub(".init", "")
    end

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
-- LSP Servers
----------------------------------
command("LSP", function()
  local msg = "LS Inactive"
  local buf_clients = vim.lsp.get_active_clients { bufnr = 0 }

  if next(buf_clients) == nil then
    -- TODO: clean up this if statement
    if type(msg) == "boolean" or #msg == 0 then
      return "LS Inactive"
    end
    return msg
  end

  local buf_ft = vim.bo.filetype
  local buf_client_names = {}

  -- add client
  for _, client in pairs(buf_clients) do
    if client.name ~= "null-ls" then
      table.insert(buf_client_names, client.name)
    end
  end

  local nls_sources = require "null-ls.sources"
  local avail = nls_sources.get_available(buf_ft)
  for _, client in pairs(avail) do
    local skip = false

    local skips = { "codespell", "misspell", "gitsigns" }
    for _, sk in pairs(skips) do
      if client.name == sk then
        skip = true
      end
    end

    if not skip then
      table.insert(buf_client_names, client.name)
    end
  end

  local unique_client_names = vim.fn.uniq(buf_client_names)
  local clients = "[" .. table.concat(unique_client_names, ", ") .. "]"

  print(clients)
end, {})

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
