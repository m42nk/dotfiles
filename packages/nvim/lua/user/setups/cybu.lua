local ok, cybu = pcall(require, "cybu")

if not ok then
  return
end

cybu.setup {
  position = {
    relative_to = "editor", -- win, editor, cursor
    anchor = "bottomright", -- topleft, topcenter, topright,
    -- centerleft, center, centerright,
    -- bottomleft, bottomcenter, bottomright
    vertical_offset = 0, -- vertical offset from anchor in lines
    horizontal_offset = 0, -- vertical offset from anchor in columns
    max_win_height = vim.api.nvim_win_get_height(0), -- height of cybu window in lines
    max_win_width = 0.3, -- integer for absolute in columns
    -- float for relative to win/editor width
  },
  style = {
    path = "relative", -- absolute, relative, tail (filename only)
    path_abbreviation = "none", -- none, shortened
    border = "single", -- single, double, rounded, none
    separator = " ", -- string used as separator
    prefix = "…", -- string used as prefix for truncated paths
    padding = 1, -- left & right padding in number of spaces
    hide_buffer_id = false, -- hide buffer IDs in window
    devicons = {
      enabled = true, -- enable or disable web dev icons
      colored = true, -- enable color for web dev icons
      truncate = true, -- truncate wide icons to one char width
    },
    highlights = { -- see highlights via :highlight
      current_buffer = "CybuFocus", -- current / selected buffer
      adjacent_buffers = "CybuAdjacent", -- buffers not in focus
      background = "CybuBackground", -- window background
      border = "CybuBorder", -- border of the window
    },
  },
  behavior = { -- set behavior for different modes
    mode = {
      default = {
        switch = "immediate", -- immediate, on_close
        view = "paging", -- paging, rolling
      },
      last_used = {
        switch = "on_close", -- immediate, on_close
        view = "paging", -- paging, rolling
      },
      auto = {
        view = "rolling",
      },
    },
    show_on_autocmd = false, -- event to trigger cybu (eg. "BufEnter")
  },
  display_time = 750, -- time the cybu window is displayed
  exclude = { -- filetypes, cybu will not be active
    "neo-tree",
    "fugitive",
    "qf",
  },
  fallback = function() end, -- arbitrary fallback function
  -- used in excluded filetypes
}

-- vim.keymap.set("n", "K", "<Plug>(CybuPrev)")
-- vim.keymap.set("n", "J", "<Plug>(CybuNext)")
-- vim.keymap.set({ "n", "v" }, "<c-s-tab>", "<plug>(CybuLastusedPrev)")
-- vim.keymap.set({ "n", "v" }, "<c-tab>", "<plug>(CybuLastusedNext)")

require("user.utils.keymaps").nmap {
  -- ["<S-h>"] = { "<Plug>(CybuPrev)", "Focus previous buffer" },
  -- ["<S-l>"] = { "<Plug>(CybuNext)", "Focus next buffer" },

  ["<S-h>"] = { "<Plug>(CybuLastusedPrev)", "Focus previous buffer" },
  ["<S-l>"] = { "<Plug>(CybuLastusedNext)", "Focus next buffer" },
}
