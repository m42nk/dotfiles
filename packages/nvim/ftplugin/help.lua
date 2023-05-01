if vim.api.nvim_win_get_width(0) > 100 then
  vim.cmd [[ wincmd L ]]
end
