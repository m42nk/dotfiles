local M = {}

M.bufcount = function()
  local bufnrs = vim.tbl_filter(function(b)
    if 1 ~= vim.fn.buflisted(b) then
      return false
    end

    -- only hide unloaded buffers if opts.show_all_buffers is false, keep them listed if true or nil
    -- if not vim.api.nvim_buf_is_loaded(b) then
    --   return false
    -- end

    return true
  end, vim.api.nvim_list_bufs())

  return bufnrs
end

M.statusline = function()
  return "[" .. "#" .. vim.tbl_count(M.bufcount()) .. "]"
end

return M
