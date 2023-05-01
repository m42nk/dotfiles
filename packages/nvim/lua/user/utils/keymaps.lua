local M = {}

local wk_ok, wk = pcall(require, "which-key")
if not wk_ok then
  vim.notify("ERROR: which-key is not installed", vim.log.levels.ERROR)
  vim.notify("ERROR: " .. wk, vim.log.levels.ERROR)
  return
end

M.map = wk.register

local _map = function(mode, ...)
  local args = { ... }

  if type(args[1]) == "string" then
    if type(args[3]) ~= "string" then
      vim.notify("KEYMAP: keymap description is required", vim.log.levels.ERROR)
    end

    local opts = vim.tbl_extend("force", { mode = mode }, args[4] or {})
    HALO = opts

    wk.register({
      [args[1]] = { args[2], args[3] },
    }, opts)

    return
  end

  wk.register(..., { mode = mode })
end

M.nmap = function(...)
  _map("n", ...)
end

M.imap = function(...)
  _map("i", ...)
end

M.vmap = function(...)
  _map("v", ...)
end

return M
