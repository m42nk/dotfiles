local plenary_ok, plenary_reload = pcall(require, "plenary.reload")
local reloader = plenary_ok and plenary_reload.reload_module or require

-- TO BE USED IN SCRIPTS
RELOAD = function(...)
  return reloader(...)
end

R = function(name)
  RELOAD(name)
  return require(name)
end
-- Source: https://github.com/tjdevries/config_manager

_G.put = function(...)
  local objects = {}
  for i = 1, select("#", ...) do
    local v = select(i, ...)
    table.insert(objects, vim.inspect(v))
  end

  print(table.concat(objects, "\n"))
  return ...
end
