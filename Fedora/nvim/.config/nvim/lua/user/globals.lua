function _G.UnloadCurrentFile()
  local current_file = vim.fn.expand "%"

  package.loaded[current_file] = nil

  vim.notify("Unloaded " .. current_file)
end

-- Use :R instead
-- function _G.ReloadConfig()
--   for name, _ in pairs(package.loaded) do
--     -- if name:match('^user') and not name:match('nvim-tree') then
--     --
--     if name:match "^user" then
--       package.loaded[name] = nil
--     end
--   end

--   dofile(vim.env.MYVIMRC)
--   vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
-- end

_G.P = function(o)
  print(vim.inspect(o))
end

_G.NvimConfigDir = vim.fn.resolve(vim.env.MYVIMRC:match("(.*[/\\])"))

-- Source: https://stackoverflow.com/a/72504767/7200504
