package.loaded['comment'] = nil

local ok, comment = pcall(require, "Comment")
if not ok then
  return
end

comment.setup {
  -- Add a space b/w comment and the line
  padding = true,

  --Whether the cursor should stay at its position
  sticky = true,

  -- Lines to be ignored while comment/uncomment.
  ignore = '^$',

  -- LHS of toggle mappings in NORMAL + VISUAL mode
  toggler = {
    line = "gcc",
    block = "gbc",
  },

  -- LHS of operator-pending mappings in NORMAL + VISUAL mode
  opleader = {
    line = "gc",
    block = "gb",
  },

  -- LHS of extra mappings
  extra = {
    -- Add comment on the line above
    above = "gcO",
    -- Add comment on the line below
    below = "gco",
    -- Add comment at the end of line
    eol = "gcA",
  },

  -- Pre-hook, called before commenting the line
  -- Enable integration with treesitter
  pre_hook = function(ctx)
    local U = require "Comment.utils"

    local location = nil
    if ctx.ctype == U.ctype.block then
      location = require("ts_context_commentstring.utils").get_cursor_location()
    elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
      location = require("ts_context_commentstring.utils").get_visual_start_location()
    end

    return require("ts_context_commentstring.internal").calculate_commentstring {
      key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
      location = location,
    }
  end,

  -- Post-hook, called after commenting is done
  post_hook = nil,
}
