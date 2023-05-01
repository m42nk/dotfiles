local ok, bufferline = pcall(require, "bufferline")

if not ok then
  return
end

bufferline.setup {
  options = {
    show_close_icon = false,
    show_buffer_icons = false,
    color_icons = false,
    -- separator_style = { "°", "|" },
  },
}

local keymaps = {
  -- ["<S-h>"] = { "<cmd>BufferLineCyclePrev<cr>", "Focus previous buffer" },
  -- ["<S-l>"] = { "<cmd>BufferLineCycleNext<cr>", "Focus next buffer" },

  ["<leader>b"] = {
    name = "Buffer",
    ["h"] = { "<cmd>BufferLineMovePrev<cr>", "Move left" },
    ["l"] = { "<cmd>BufferLineMoveNext<cr>", "Move right" },

    ["s"] = {
      name = "Sort",
      ["e"] = { "<cmd>BufferLineSortByExtension<cr>", "By extension" },
      ["d"] = { "<cmd>BufferLineSortByDirectory<cr>", "By directory" },
    },
    ["c"] = {
      name = "Close",
      ["l"] = { "<cmd>BufferLineCloseLeft<cr>", "Close all left" },
      ["r"] = { "<cmd>BufferLineCloseRight<cr>", "Close all right" },
    },
  },
};

(function()
  for i = 1, 5 do
    keymaps["<M-" .. i .. ">"] = {
      "<cmd>BufferLineGoToBuffer " .. i .. "<cr>",
      "Go to buffer" .. i,
    }
  end
end)()

require("user.utils.keymaps").map(keymaps)
