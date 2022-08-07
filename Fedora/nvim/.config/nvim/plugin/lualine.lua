local ok, lualine = pcall(require, "lualine")
if not ok then
  return
end

local diff_section = {
  "diff",
  symbols = {
    added = "[+] ",
    modified = "[~] ",
    removed = "[-] ",
  },
  source = nil,
}

lualine.setup {
  options = {
    icons_enabled = false,
    component_separators = { left = "|", right = "|" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = {
        "NvimTree",
      },
      winbar = {},
    },
  },
  sections = {
    lualine_a = {
      {
        function()
          return " "
        end,
        padding = 0,
      },
    },
    lualine_b = { "branch" },
    lualine_c = {
      "filename",
      diff_section,
      "diagnostics",
    },
    lualine_x = { "fileformat", "filetype" },
    lualine_y = { "location" },
    lualine_z = {},
  },
}

-- lualine.setup {
--   options = {
--     icons_enabled = true,
--     theme = "auto",
--     component_separators = { left = "|", right = "|" },
--     section_separators = { left = "|", right = "|" },
--     disabled_filetypes = {
--       statusline = {},
--       winbar = {},
--     },
--     ignore_focus = {},
--     always_divide_middle = true,
--     globalstatus = false,
--     refresh = {
--       statusline = 1000,
--       tabline = 1000,
--       winbar = 1000,
--     },
--   },
--   sections = {
--     lualine_a = {
--       {
--         "mode",
--         padding = 0,
--         fmt = function(str)
--           return " "
--         end,
--       },
--     },
--     lualine_b = { "branch", "diff", "diagnostics" },
--     lualine_c = { "filename" },
--     lualine_x = { "fileformat", "filetype" },
--     lualine_y = { "location" },
--     lualine_z = {},
--   },
--   inactive_sections = {
--     lualine_a = {},
--     lualine_b = {},
--     lualine_c = { "filename" },
--     lualine_x = { "location" },
--     lualine_y = {},
--     lualine_z = {},
--   },
--   tabline = {},
--   winbar = {},
--   inactive_winbar = {},
--   extensions = {},
-- }
