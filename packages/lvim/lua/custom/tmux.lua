local M = {}

-- Simple lua reimplementation of https://github.com/christoomey/vim-tmux-navigator

local tmux_dir = {
  ["h"] = "-L",
  ["j"] = "-D",
  ["k"] = "-U",
  ["l"] = "-R",
}

local check_tmux = function()
  return vim.env["TMUX"] and true or false
end

local check_edge = function(direction)
  return vim.fn.winnr() == vim.fn.winnr(direction)
end

M._navigate = function(direction)
  local is_tmux = check_tmux()
  local ok, is_on_edge = pcall(check_edge, direction)

  if not ok then
    vim.notify(string.format("Direction %s is not a valid direction", direction), vim.log.levels.WARN)
    return
  end

  if is_on_edge and is_tmux then
    vim.fn.system("tmux select-pane " .. tmux_dir[direction])
  else
    vim.cmd("wincmd " .. direction)
  end
end

-- Return a function that is keymap-ready
M.tmux_nav = function(direction)
  return function()
    M._navigate(direction)
  end
end

return M
