local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
  return
end

local cb = require("nvim-tree.config").nvim_tree_callback

-- let g:Illuminate_ftblacklist = ['nerdtree']
vim.g.Illuminate_ftblacklist = { "NvimTree" }

nvim_tree.setup {
  hijack_cursor = true,
  auto_reload_on_write = true,
  hijack_unnamed_buffer_when_opening = false,
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = "right",
    signcolumn = "yes",
    mappings = {
      custom_only = false,
      list = {
        { key = { "l", "<CR>", "o" }, cb = cb "edit" },
        { key = "h", cb = cb "close_node" },
        { key = "v", cb = cb "vsplit" },
        { key = "C", cb = cb "collapse_all" },
      },
    },
    number = false,
    relativenumber = false,
  },
  update_focused_file = {
    enable = true,
    update_cwd = false,
    ignore_list = {},
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  renderer = {
    highlight_opened_files = "name",
    root_folder_modifier = ":t",
    indent_markers = {
      enable = true,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = false,
      git_placement = "after",
      symlink_arrow = " ➛ ",
      show = {
        folder = false,
      },
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
}
