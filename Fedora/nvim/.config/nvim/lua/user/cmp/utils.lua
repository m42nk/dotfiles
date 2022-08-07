local M = {}

-- Completion engine
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

-- Snippet
local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

M.handle_tab = function(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  elseif luasnip.expandable() then
    luasnip.expand()
  elseif luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  elseif check_backspace() then
    fallback()
  else
    fallback()
  end
end

M.handle_s_tab = function(fallback)
  if cmp.visible() then
    cmp.select_prev_item()
  elseif luasnip.jumpable(-1) then
    luasnip.jump(-1)
  else
    fallback()
  end
end

-- M.format_fn = function(entry, vim_item)
--   local kind_icons = require "user.cmp.kind_icons"
--   local max_width = 30

--   if max_width ~= 0 and #vim_item.abbr > max_width then
--     vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 1) .. "…"
--   end

--   vim_item.kind = kind_icons[vim_item.kind]
--   -- vim_item.kind = cmp.formatting.kind_icons[vim_item.kind]
--   -- vim_item.menu = cmp.formatting.source_names[entry.source.name]
--   -- vim_item.dup = cmp.formatting.duplicates[entry.source.name] or cmp.formatting.duplicates_default
--   return vim_item
-- end

return M
