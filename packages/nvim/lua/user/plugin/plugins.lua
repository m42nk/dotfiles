return {
  ----------------------------------
  -- LSP
  ----------------------------------
  -- Configuration for LSPs
  "neovim/nvim-lspconfig",

  -- LSP package manager
  "williamboman/mason.nvim",

  -- Mason x lspconfig, automates hook setup, etc
  "williamboman/mason-lspconfig.nvim",

  -- Add "ensured_installed"-like feature for mason
  -- NOTE: probably remove this when merged to mason
  "WhoIsSethDaniel/mason-tool-installer.nvim",

  -- Attach non-lsp (linter, formatter) as lsp
  "jose-elias-alvarez/null-ls.nvim",

  -- Lsp settings with json
  "tamago324/nlsp-settings.nvim",

  -- Provide json schema autocomplete (like vscode)
  "b0o/schemastore.nvim",

  -- Lsp typescript utils
  "jose-elias-alvarez/typescript.nvim",

  ----------------------------------
  -- Completion and snippets
  ----------------------------------
  -- Completion engine
  "hrsh7th/nvim-cmp",

  -- Completion sources
  "saadparwaiz1/cmp_luasnip",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-nvim-lsp-signature-help",

  "hrsh7th/cmp-copilot",
  "github/copilot.vim",

  "L3MON4D3/LuaSnip",
  "rafamadriz/friendly-snippets",

  ----------------------------------
  -- Treesitter
  ----------------------------------
  -- Treesitter engine
  "nvim-treesitter/nvim-treesitter",

  "nvim-treesitter/nvim-treesitter-context",
  "nvim-treesitter/playground",
  "nvim-treesitter/nvim-treesitter-textobjects",
  "RRethy/nvim-treesitter-textsubjects",
  "JoosepAlviste/nvim-ts-context-commentstring",
  "windwp/nvim-ts-autotag",
  -- Swap nodes using treesitter
  "mizlan/iswap.nvim",

  ----------------------------------
  -- Telescope
  ----------------------------------
  -- Telescope by Telescopic Johnson
  "nvim-telescope/telescope.nvim",

  -- Telescope fzy sorter
  "nvim-telescope/telescope-fzy-native.nvim",

  -- Telescope helper for changing directories
  "zane-/cder.nvim",

  ----------------------------------
  -- UI Features
  ----------------------------------
  -- Colorscheme
  { "catppuccin/nvim", as = "catppuccin" },
  'folke/tokyonight.nvim',

  -- Add web dev icon
  "kyazdani42/nvim-web-devicons",

  -- Pretty notification
  "rcarriga/nvim-notify",

  -- Status line
  -- TODO: config
  "nvim-lualine/lualine.nvim",

  -- Show buffers at top (like tabs in vscode)
  -- "akinsho/bufferline.nvim",

  -- Git signcolumn colored lines (like vscode)
  "lewis6991/gitsigns.nvim",

  -- Improve neovim input ui
  -- TODO: config
  "stevearc/dressing.nvim",

  ----------------------------------
  -- Quality of Life
  ----------------------------------
  -- Comment engine
  "numToStr/Comment.nvim",

  -- Keymapping popup helper
  "folke/which-key.nvim",

  -- Time tracker
  "wakatime/vim-wakatime",

  -- Smooth scrolling
  "karb94/neoscroll.nvim",

  -- Neo-tree explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    requires = "MunifTanjim/nui.nvim",
  },

  -- Remember last place on file reopen
  "ethanholz/nvim-lastplace",

  -- Readline operation like shell
  "linty-org/readline.nvim",

  -- Convert single <-> multiline code
  "AndrewRadev/splitjoin.vim",

  -- TODO: config
  -- Project management, automate root-change
  "ahmedkhalf/project.nvim",

  -- Alignment tools, good for configs
  -- TODO: config
  "junegunn/vim-easy-align",

  -- Colorize color values
  "norcalli/nvim-colorizer.lua",

  -- Swiss-army knife of neovim plugins
  { "echasnovski/mini.nvim" },

  -- Better jump movements with hints
  "ggandor/leap.nvim",

  ----------------------------------
  -- tpope
  ----------------------------------
  "tpope/vim-surround",
  "tpope/vim-abolish",
  "tpope/vim-repeat",
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",

  ----------------------------------
  -- Core
  ----------------------------------
  -- Lua helper function
  "nvim-lua/plenary.nvim",

  -- Improve startup time
  "lewis6991/impatient.nvim",

  -- Visualize startup time
  "dstein64/vim-startuptime",

  -- Neovim lua "lsp"
  "folke/neodev.nvim",

  -- Powerful autopair
  "windwp/nvim-autopairs",

  -- Neorg
  -- TODO: config
  {
    "nvim-neorg/neorg",
    requires = {
      "nvim-neorg/neorg-telescope",
      "max397574/neorg-contexts",
    },
  },
  {
    "CRAG666/code_runner.nvim",
  },

  -- Add more useful textobjects
  -- https://github.com/wellle/targets.vim/blob/master/cheatsheet.md
  "wellle/targets.vim",

  -- "glepnir/dashboard-nvim",
  "ghillb/cybu.nvim",
  "rmagatti/auto-session",
  "rmagatti/session-lens",
  -- "nvim-pack/nvim-spectre",
  "ekickx/clipboard-image.nvim",

  {
    "kkoomen/vim-doge",
    run = ":call doge#install()",
  },

  {
    "ThePrimeagen/refactoring.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  },

  "jackMort/ChatGPT.nvim",

  -- "chr4/nginx.vim",
}
