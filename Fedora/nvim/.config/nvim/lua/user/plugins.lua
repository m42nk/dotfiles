return {
  ----------------------------------
  -- Core
  ----------------------------------
  {
    -- Package manager
    "wbthomason/packer.nvim",
  },
  {
    -- Lua helper function
    "nvim-lua/plenary.nvim",
  },
  {
    -- Neovim lua "lsp"
    "folke/lua-dev.nvim",
  },
  {
    -- Add web dev icon
    "kyazdani42/nvim-web-devicons",
  },
  {
    -- Improve startup time
    "lewis6991/impatient.nvim",
  },
  {
    -- Time tracker
    "wakatime/vim-wakatime",
  },

  ----------------------------------
  -- LSP
  ----------------------------------
  {
    -- LSP package manager
    "williamboman/mason.nvim",

    -- Mason x lspconfig, automates hook setup, etc
    "williamboman/mason-lspconfig.nvim",

    -- Configuration for LSPs
    "neovim/nvim-lspconfig",

    -- Attach non-lsp (linter, formatter)
    -- as lsp
    "jose-elias-alvarez/null-ls.nvim",

    -- Loading spinner for lsp
    "j-hui/fidget.nvim",

    -- Highlight symbols under cursor
    -- like vscode
    "RRethy/vim-illuminate",
  },

  ----------------------------------
  -- Completions
  ----------------------------------
  {
    -- Completion engine
    "hrsh7th/nvim-cmp",
  },
  {
    -- Completion sources
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
  },

  ----------------------------------
  -- Snippets
  ----------------------------------
  {
    -- Snippet engine
    "L3MON4D3/LuaSnip",
  },
  {
    "rafamadriz/friendly-snippets",
    enable = false,
  },

  ----------------------------------
  -- Treesitter
  ----------------------------------
  {
    -- Treesitter engine
    "nvim-treesitter/nvim-treesitter",
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "JoosepAlviste/nvim-ts-context-commentstring",
    "windwp/nvim-ts-autotag",
    "nvim-treesitter/playground",
  },

  ----------------------------------
  -- Minor feature improvement
  ----------------------------------
  {
    -- Powerful autopair
    "windwp/nvim-autopairs",

    -- Readline operation like shell
    "linty-org/readline.nvim",

    -- Remember last place on file reopen
    "ethanholz/nvim-lastplace",

    -- Add more useful textobjects
    -- https://github.com/wellle/targets.vim/blob/master/cheatsheet.md
    "wellle/targets.vim",

    -- Convert single <-> multiline code
    "AndrewRadev/splitjoin.vim",

    -- Git signcolumn colored lines (like vscode)
    "lewis6991/gitsigns.nvim",

    -- Better jump movements with hints
    "ggandor/leap.nvim",

    -- Swap nodes using treesitter
    "mizlan/iswap.nvim",

    -- Improve neovim input ui
    "stevearc/dressing.nvim",

    -- -- Climb the syntax tree
    -- "drybalka/tree-climber.nvim",
  },

  ----------------------------------
  -- General
  ----------------------------------
  {
    -- tpope
    "tpope/vim-surround",
    "tpope/vim-abolish",
    "tpope/vim-repeat",
    "tpope/vim-fugitive",
  },
  {
    -- Colorschemes
    "navarasu/onedark.nvim",
    "folke/tokyonight.nvim",
  },
  {
    -- Comment engine
    "numToStr/Comment.nvim",
  },
  {
    -- Telescope by Telescopic Johnson
    "nvim-telescope/telescope.nvim",
  },
  {
    -- Project management, automate root-change
    "ahmedkhalf/project.nvim",
  },
  {
    -- Alignment tools, good for configs
    "junegunn/vim-easy-align",
  },
  {
    -- Show buffers at top (like tabs in vscode)
    "akinsho/bufferline.nvim",
  },
  {
    -- Status line
    "nvim-lualine/lualine.nvim",
  },
  {
    -- Tree Explorer
    "kyazdani42/nvim-tree.lua",
  },
  {
    -- Colorize color values
    "norcalli/nvim-colorizer.lua",
  },
}
