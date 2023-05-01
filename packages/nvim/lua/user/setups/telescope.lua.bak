local ok, telescope = pcall(require, "telescope")
local action_layout = require "telescope.actions.layout"

if not ok then
  return
end

telescope.setup {
  defaults = {
    sorting_strategy = "ascending",
    layout_strategy = "bottom_pane",
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
        ["<c-l>"] = require("telescope.actions").delete_buffer,
        ["<c-j>"] = action_layout.toggle_preview,
        ["<c-k>"] = function()
          vim.cmd "Telescope cder theme=dropdown"
        end,
      },
      n = {
        ["<c-l>"] = require("telescope.actions").delete_buffer,
        ["<leader><leader>"] = function()
          vim.cmd "Telescope cder theme=ivy"
        end,
      },
    },
  },
  pickers = {
    buffers = {
      -- layout_strategy = "vertical",
      -- layout_config = {
      --   mirror = true,
      -- },
      borderchars = {
        preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
        prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
      },
      sorting_strategy = "ascending",
      results_title = "",
      prompt_title = "Buffers",
      preview_title = "Preview",
      previewer = false,
    },
    find_files = {
      layout_config = {
        mirror = true,
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
  },
}

telescope.load_extension "fzy_native"
telescope.load_extension "cder"

local find_files = function()
  local opts = {}

  local dropdown = {
    layout_strategy = "vertical",
    border = true,
    borderchars = {
      preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      -- prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
      -- results = { " " },
      results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
      prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
    },
    results_title = "",
    prompt_title = "Find",
    preview_title = "Preview",
    sorting_strategy = "ascending",
  }

  opts = vim.tbl_deep_extend("force", opts, dropdown)

  -- opts.cwd = vim.fn.stdpath "config"
  -- put(opts)

  require("telescope.builtin").find_files(opts)
end

local find_buffers = function()
  require("telescope.builtin").buffers {
    sort_mru = true,
    sort_lastused = true,
  }
end

require("user.utils.keymaps").map {
  -- ["<leader>f"] = { "<cmd>Telescope find_files<CR>", "Find files" },
  -- ["<leader>b"] = { "<cmd>Telescope buffers<CR>", "Show buffer list" },
  ["<c-p>"] = { find_files, "Find files" },
  ["<c-n>"] = { find_buffers, "Show buffer list" },
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
    -- nmap("<leader>tp", require("user.utils").telescope_find_configs, "Find configs")
    -- nmap("<leader>tn", require("user.utils").telescope_find_notes, "Find notes")
  },
}
