----------------------------------
-- Colorscheme
----------------------------------

local catpuccin = function()
  vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha

  require("catppuccin").setup {
    transparent_background = true,
    term_colors = true,
    integration = {
      leap = true,
      neotree = {
        enabled = true,
        transparent_panel = true,
      },
    },
  }

  -- require("catppuccin").setup {}

  vim.cmd [[colorscheme catppuccin]]
end

local tokyonight = function()
  require("tokyonight").setup {
    transparent = true,
  }

  vim.cmd [[colorscheme tokyonight-night]]
end

-- catpuccin()
tokyonight()
