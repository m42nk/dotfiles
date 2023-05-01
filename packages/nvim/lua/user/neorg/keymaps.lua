local k = require "user.utils.keymaps"

k.nmap("<C-s>", "<cmd>Telescope neorg find_linkable<cr>", "Find linkable")
-- k.imap("<C-i>", "<cmd>Telescope neorg insert_link<cr>", "Insert link")

k.nmap {
  ["<leader>o"] = {
    name = "Orgmode",

    ["H"] = { "<cmd>h neorg<cr>", "Open neorg help" },
    ["o"] = { "<cmd>Neorg start<cr>", "Start neorg" },
    ["d"] = { "<cmd>Neorg inject_metadata<cr>", "Inject metadata" },
    ["c"] = { "<cmd>Neorg context toggle<cr>", "Toggle context" },
    ["k"] = { "<cmd>Neorg keybind all<cr>", "Search keybind" },

    ["t"] = {
      name = "Todo",

      ["t"] = { "<cmd>Neorg gtd capture<cr>", "Capture" },
      ["e"] = { "<cmd>Neorg gtd edit<cr>", "Edit" },
      ["v"] = { "<cmd>Neorg gtd view<cr>", "View" },
      ["c"] = { "<cmd>Neorg gtd capture<cr>", "Capture" },
    },

    ["T"] = {
      name = "Table of content",

      ["t"] = { "<cmd>Neorg toc split<cr>", "Open in split" },
      ["i"] = { "<cmd>Neorg toc inline<cr>", "Open inline" },
      ["c"] = { "<cmd>Neorg toc close<cr>", "Close" },
    },

    ["m"] = {
      name = "Mode",

      ["h"] = {
        "<cmd>Neorg mode traverse_heading<cr>",
        "Traverse heading mode",
      },
      ["n"] = { "<cmd>Neorg<cr>", "Neorg mode" },
    },

    ["w"] = {
      "<cmd>Telescope neorg switch_workspace<cr>",
      "Switch workspace",
    },
    ["h"] = {
      "<cmd>Telescope neorg search_headings<cr>",
      "Search headings",
    },
    ["l"] = {
      "<cmd>Telescope neorg find_linkable<cr>",
      "Find linkable (jump)",
    },
    ["i"] = {
      "<cmd>Telescope neorg insert_file_link<cr>",
      "Insert file link",
    },
  },
}
