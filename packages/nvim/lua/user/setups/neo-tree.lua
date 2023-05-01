local ok, neo_tree = pcall(require, "neo-tree")
if not ok then
  return
end

neo_tree.setup {
  use_popups_for_input = false,
  popup_border_style = "single",
  add_blank_line_at_top = false,
  enable_diagnostics = true,

  sources = { "filesystem", "buffers", "git_status" },
  source_selector = {
    winbar = false,
    statusline = true,
    content_layout = "center",
  },
  window = {
    popup = {
      size = {
        width = "100%",
        height = "60%",
      },
      position = {
        col = "100%",
        row = "100%",
      },
    },
    mappings = {
      ["<Esc>"] = function()
        vim.cmd "Neotree close"
      end,
    },
  },
  buffers = {
    window = {
      mappings = {
        ["h"] = { "close_node" },
        ["l"] = { "toggle_node" },
        ["P"] = { "toggle_preview", config = { use_float = true } },
      },
    },
  },
  filesystem = {
    hijack_netrw_behavior = "open_current",
    window = {
      position = "float",
      mappings = {
        ["<C-l>"] = { "clear_filter" },
        ["<C-h>"] = { "toggle_hidden" },
        ["h"] = { "close_node" },
        ["l"] = { "toggle_node" },
        ["H"] = { "navigate_up" },
        ["f"] = { "fuzzy_finder" },
        ["F"] = { "fuzzy_finder" },
        ["/"] = { --[[ use vim default / ]]
        },
        -- s/S is used for opening in (v)split
        -- ["s"] = { --[[ use leap ]]
        -- },
        -- ["S"] = { --[[ use leap ]]
        -- },
        ["w"] = function() --[[noop]]
        end,
        ["b"] = function() --[[noop]]
        end,
      },
    },
  },
  default_component_configs = {
    highlights = {
      hint = "DiagnosticSignHint",
      info = "DiagnosticSignInfo",
      warn = "DiagnosticSignWarn",
      error = "DiagnosticSignError",
    },
    indent = {
      with_expanders = true,
      expander_collapsed = "",
      expander_expanded = "",
      expander_highlight = "NeoTreeExpander",
    },
  },
  event_handlers = {
    {
      event = "neo_tree_buffer_enter",
      handler = function(arg)
        vim.cmd [[
          setlocal relativenumber
        ]]
      end,
    },
  },
}

vim.g.neo_tree_remove_legacy_commands = 1

require("user.utils.keymaps").nmap {
  ["<c-k>"] = {
    "<cmd>Neotree buffers float reveal toggle<cr>",
    "Neotree Buffers",
  },

  ["<leader>e"] = { "<cmd>Neotree float reveal toggle<cr>", "Neotree" },
  -- ["<leader>E"] = { "<cmd>Neotree float reveal toggle<cr>", "Neotree" },
}
