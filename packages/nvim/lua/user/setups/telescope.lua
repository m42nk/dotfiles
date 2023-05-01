local ok, telescope = pcall(require, "telescope")

if not ok then
  return
end

local action_layout = require "telescope.actions.layout"
local actions = require "telescope.actions"

local toggle_select_next = function(num)
  actions.toggle_selection(num)
  actions.move_selection_next(num)
end

local toggle_select_prev = function(num)
  actions.toggle_selection(num)
  actions.move_selection_previous(num)
end

telescope.setup {
  defaults = {
    sorting_strategy = "ascending",
    layout_strategy = "bottom_pane",
    winblend = 0,
    layout_config = {
      bottom_pane = {
        preview_cutoff = 0,
      },

      vertical = {
        prompt_position = "top",
      },
    },

    borderchars = {
      prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
      results = { " " },
      preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      -- prompt = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      -- results = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    },

    mappings = {
      i = {

        ["<c-l>"] = actions.delete_buffer,
        ["<tab>"] = actions.move_selection_next,
        ["<s-tab>"] = actions.move_selection_previous,

        ["<c-n>"] = toggle_select_next,
        ["<c-p>"] = toggle_select_prev,

        ["<c-h>"] = actions.toggle_selection,
        ["<c-j>"] = action_layout.toggle_preview,
        ["<c-k>"] = { "<cmd>Telescope cder theme=ivy<cr>", type = "command" },

        ["kj"] = "close",
      },
    },
  },
  pickers = {
    buffers = {
      prompt_title = "Buffers",
      results_title = "",
      preview_title = "",
      previewer = false,
      sort_mru = true,
      sort_lastused = true,
      -- path_display = { shorten = 2 },
      path_display = { "smart" },
      dynamic_preview_title = true,
      mappings = {
        i = {
          -- ["<c-l>"] = "noop",
        },
      },
    },
    find_files = {
      mappings = {
        -- i = {
        --   ["<c-l>"] = "noop",
        -- },
      },
      find_command = {
        "fd",
        "--hidden",
        "--type",
        "f",
        "--exclude",
        "node_modules",
        "--exclude",
        ".git",
        "--exclude",
        "_build",
      },
      previewer = false,
    },
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
    cder = {
      dir_command = {
        "fd",
        "--hidden",
        "--type",
        "d",
        "--exclude",
        "go",
        "--exclude",
        ".git",
        "--exclude",
        "_build",
        ".",
        os.getenv "HOME" .. "/Work",
      },
      previewer_command = "exa "
        .. "-a "
        .. "--color=always "
        .. "-T "
        .. "--level=3 "
        .. "--icons "
        .. "--git-ignore "
        .. "--long "
        .. "--no-permissions "
        .. "--no-user "
        .. "--no-filesize "
        .. "--git "
        .. "--ignore-glob=.git",
    },
    -- mappings = {
    --   i = {
    --     ["<CR>"] = function(num)
    --       -- actions.select_default(num)
    --       builtin.resume {
    --         cache_index = 2,
    --       }
    --     end,
    --   },
    -- },
  },
}

telescope.load_extension "fzy_native"
telescope.load_extension "cder"

require("user.utils.keymaps").map {
  ["<c-p>"] = { "<cmd>Telescope find_files<CR>", "Find files" },
  ["<c-n>"] = { "<cmd>Telescope buffers<CR>", "Show buffer list" },
  ["<leader>t"] = {
    name = "Telescope",
    ["!"] = { "<cmd>Telescope command_history<CR>", "Command history" },
    ["P"] = { "<cmd>Telescope projects<CR>", "Projects" },
    ["b"] = { "<cmd>Telescope buffers<CR>", "Buffers" },
    ["h"] = { "<cmd>Telescope help_tags<CR>", "Help pages" },
    ["j"] = { "<cmd>Telescope jumplist<CR>", "Jumplist" },
    ["l"] = { "<cmd>Telescope live_grep<CR>", "Search text" },
    ["m"] = { "<cmd>Telescope man_pages<CR>", "Man pages" },
    ["o"] = { "<cmd>Telescope oldfiles<CR>", "Command history" },
    ["r"] = { "<cmd>Telescope resume<CR>", "Resume" },
    ["t"] = { "<cmd>Telescope<CR>", "List actions" },
    ["w"] = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>",
      "List workspace symbol",
    },
    ["d"] = {
      "<cmd>Telescope lsp_document_symbols<CR>",
      "List document symbol",
    },
    ["D"] = {
      "<cmd>Telescope diagnostics<CR>",
      "List diagnostics",
    },
  },
}

-- local cdPicker = function(name, cmd)
--   pickers
--     .new({}, {
--       prompt_title = name,
--       finder = finders.new_table { results = utils.get_os_command_output(cmd) },
--       previewer = previewers.vim_buffer_cat.new {},
--       sorter = sorters.get_fuzzy_file(),
--       attach_mappings = function(prompt_bufnr)
--         actions_set.select:replace(function(_, type)
--           local entry = actions.get_selected_entry()
--           actions.close(prompt_bufnr)
--           local dir = from_entry.path(entry)
--           vim.cmd("cd " .. dir)
--         end)
--         return true
--       end,
--     })
--     :find()
-- end

-- function Cd(path)
--   path = path or "."
--   cdPicker(
--     "Cd",
--     { vim.o.shell, "-c", "fd . " .. path .. " --type=d 2>/dev/null" }
--   )
-- end

-- local previewers = require "telescope.previewers"
-- local sorters = require "telescope.sorters"
-- local pickers = require "telescope.pickers"
-- local finders = require "telescope.finders"
-- local utils = require "telescope.utils"
-- local actions_set = require "telescope.actions.set"
-- local from_entry = require "telescope.from_entry"
-- local builtin = require "telescope.builtin"

-- READ THIS FOR CDER
-- *telescope.defaults.history*
