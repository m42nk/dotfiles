local opt = vim.opt
local fn = vim.fn

local get_filepath = function()
  local filepath = fn.fnamemodify(fn.expand "%", ":.:h")
  if filepath == "" or filepath == "." then
    return " "
  end

  return string.format(" %%<%s/", filepath)
end

local get_filename = function()
  local filename = fn.expand "%:t"
  if filename == "" then
    return ""
  end
  return filename
end

_G.Statusline = function()
  return string.format("%s%s", get_filepath(), get_filename())
end

-- opt.winbar = "%!v:lua.Statusline() %m"
-- opt.winbar = "%f %m"
-- opt.laststatus = 3
