local M = {}
local api = vim.api

-- local buf_id = api.nvim_create_buf(true, true)
-- local win_id = api.nvim_open_win(buf_id, true, {
--   relative = "win",
--   width = 80,
--   height = 80,
--   bufpos = { 0, 0 },
--   border = 'single'
-- })

M.buffers = function()
  local bufnrs = vim.tbl_filter(function(b)
    if 1 ~= vim.fn.buflisted(b) then
      return false
    end

    if not vim.api.nvim_buf_is_loaded(b) then
      return false
    end

    return true
  end, vim.api.nvim_list_bufs())

  put(bufnrs)
end

M.buffers()

-- return M
