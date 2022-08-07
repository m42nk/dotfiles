-- stylua: ignore start
---------------------------------------
-- Neovim settings and configuration
---------------------------------------

-- local g = vim.g -- Global Variables
local opt = vim.opt

---------------------------------------
-- General
---------------------------------------

opt.mouse = "a"               -- Enable mouse support
opt.clipboard = "unnamedplus" -- Use system clipboard
opt.wrap = false              -- Disable line wrap
opt.scrolloff = 8             -- Scroll offset
opt.undofile = true           -- Persistent undo even when the file is closed
opt.ignorecase = true         -- Ignore case letters when search
opt.smartcase = true          -- Ignore lowercase for the whole pattern
opt.swapfile = false          -- Don't use swapfile
opt.completeopt = "menuone,noinsert,noselect" -- Autocomplete options

---------------------------------------
-- Neovim UI
---------------------------------------

opt.number = true         -- Show line number
opt.relativenumber = true -- Show relative line number
opt.showmatch = false     -- Stop jumping to first matching parent/bracket
opt.colorcolumn = "80"    -- Line length marker at 80 columns
opt.splitright = true     -- Vertical split to the right
opt.splitbelow = true     -- Horizontal split to the bottom
opt.termguicolors = true  -- Enable 24-bit RGB colors
opt.hlsearch = true       -- Highlight search
opt.conceallevel = 0      -- Make `` visible in markdown
opt.cursorline = true     -- Highlight current line
opt.signcolumn = "yes:1"  -- Always show the sign columns (diagnostics, etc)
opt.showmode = false      -- Hide mode like "-- INSERT --" in cmdline

-- opt.laststatus = 3 -- Set global statusline
opt.laststatus = 2        -- Every pane has statusline

-- opt.foldmethod = "marker" -- Enable folding (default "foldmarker")
-- opt.linebreak = false -- [?] Wrap on word boundary

opt.shortmess:append "I"

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true   -- Use spaces instead of tabs
opt.shiftwidth = 2     -- Shift 2 spaces when tab
opt.tabstop = 2        -- 1 tab == 2 spaces
opt.smartindent = true -- Autoindent new lines

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true     -- Enable background buffers
opt.history = 100     -- Remember N lines in history
opt.lazyredraw = true -- Faster scrolling
opt.synmaxcol = 240   -- Max column for syntax highlight
opt.updatetime = 700  -- ms to wait for trigger an event
