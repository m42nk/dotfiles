local ok, comment = pcall(require, "Comment")

if not ok then
  return
end

local pre_hook = function(ctx)
  -- Only calculate commentstring for tsx filetypes
  if
    vim.bo.filetype == "typescriptreact"
    or vim.bo.filetype == "javascriptreact"
  then
    local U = require "Comment.utils"

    -- Determine whether to use linewise or blockwise commentstring
    local type = ctx.ctype == U.ctype.linewise and "__default" or "__multiline"

    -- Determine the location where to calculate commentstring from
    local location = nil
    if ctx.ctype == U.ctype.blockwise then
      location = require("ts_context_commentstring.utils").get_cursor_location()
    elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
      location =
        require("ts_context_commentstring.utils").get_visual_start_location()
    end

    return require("ts_context_commentstring.internal").calculate_commentstring {
      key = type,
      location = location,
    }
  end
end

comment.setup {
  padding = true,
  sticky = true,
  ignore = "^$",
  toggler = {
    line = "gcc",
    block = "gbc",
  },
  opleader = {
    line = "gc",
    block = "gb",
  },
  extra = {
    above = "gcO",
    below = "gco",
    eol = "gcA",
  },
  mappings = {
    basic = true,
    extra = true,
    extended = false,
  },
  pre_hook = pre_hook,
  post_hook = nil,
}

-- Comment string for specific ft
-- can be used if ft doesn't support commenting

local ft = require "Comment.ft"
ft.set("yaml", { "#%s " })

-- require("user.utils.keymaps").map {
--   ["<space>/"] = {
--     "<Plug>(comment_toggle_linewise_current",
--     "Toggle linewise comment",
--     { mode = "n" },
--   },
-- }

local map = require("user.utils.keymaps").map

map({
  ["<leader>/"] = {
    "<Plug>(comment_toggle_linewise_current)",
    "Toggle linewise comment",
  },
}, { mode = "n" })

map({
  ["<leader>/"] = {
    "<Plug>(comment_toggle_linewise_visual)",
    "Toggle linewise comment",
  },
}, { mode = "v" })
