local ok, gitsigns = pcall(require, "gitsigns")

if not ok then
  return
end

gitsigns.setup {
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  -- current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
}

require("user.utils.keymaps").nmap {
  ["<leader>g"] = {
    name = "Git",
    ["b"] = { "<cmd>Gitsigns blame_line<cr>", "Show blame on current line" },
    ["l"] = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle current line blame" },
    ["d"] = { "<cmd>Gitsigns diffthis<cr>", "Diff this" },
    ["p"] = { "<cmd>Gitsigns prev_hunk<cr>", "Previous hunk" },
    ["n"] = { "<cmd>Gitsigns next_hunk<cr>", "Next hunk" },
    ["P"] = { "<cmd>Gitsigns preview_hunk_inline<cr>", "Preview hunk inline" },
    ["O"] = { "<cmd>Gitsigns preview_hunk<cr>", "Preview hunk popup" },
  },
}
