local hl = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- vim.cmd [[ nmap \\ :Telescope highlights<cr> ]]

hl("@text.warning", { fg = "#ffffff", bg = "#333333" })
hl("Todo", { link = "@text.warning" })
hl("luaTodo", { link = "@text.warning" })
hl("helpTodo", { link = "@text.warning" })

hl("WinBar", { fg = "#ffffff" })
hl("WinBarNC", { link = "Comment" })
hl(
  "NeoTreeCursorLine",
  { fg = "#ffffff", bg = "#333333", cterm = { bold = true } }
)

hl("Folded", {
  bg = "#333333",
  fg = "#aaaaaa",
})
