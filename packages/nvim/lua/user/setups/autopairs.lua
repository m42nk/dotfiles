local ok, autopairs = pcall(require, "nvim-autopairs")
if not ok then
  return
end

autopairs.setup {
  disable_filetype = require("user.disable-filetypes").base,
  disable_in_macro = true,
  fast_wrap = {
    map = "<M-e>",
    chars = { "{", "[", "(", '"', "'" },
    pattern = [=[[%'%"%)%>%]%)%}%,]]=],
    end_key = "$",
    keys = "qwertyuiopzxcvbnmasdfghjkl",
    check_comma = true,
    highlight = "Search",
    highlight_grey = "Comment",
  },
}

autopairs.add_rules(require "nvim-autopairs.rules.endwise-elixir")
