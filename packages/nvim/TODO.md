## TODO

- Telescope
  - change directory on find_files

- Buffer
  - try find better way to navigate buffers

- cmp
  - disable tab jump snippet position

- LSP
  - `gd` in lua opens quickfix, disable this.

- typescript lsp keybinds

## Done

- Declutter
  - change statusline, only show useful stuff

- change TODO: colors highlight
- change winbar colors highlight
- buffer cycler (preview buffers)
- telescope show preview even when window is small
  - preview shown on top
- customize buffer line to show minimal info
  since details will be shown on cybu

- (not possible) modify/arrange bufferline in a buffer (like harpoon)

- telescope cd on find files

- neotree search functions
  - how to jump to parent
  - how to select on "/" mode

- Bufferline
  - remove bufferline, try using telescope/neotree instead
  - it's unintuitive when spliting window there only 1 bufferline
  - will remove clutter

- General:
  - make help page open on left if screen is large 

- Neotree
  - move float to bottom?
  - bind escape to exit open float
  - ~highlight current file on open like yank post~
    - changed to better cursorline

- Buffer
  - add mapping to switch to last buffer [done]
  - ~remove buffer in telescope buffers normal mode, with first args as buf id~ [done]
    - use telescope.actions.delete_buffer()
  - arrange buffers like harpoon [wontfix]

- Session
  - dashboard.nvim forced to use session, change dashboard plugin
  - probably change to auto-session
  - show recent file/session in dashboard

- Telescope
  - fix ascending sort on: grep, help, etc
  - sort mru find_files [not possible]
  - change layout to bottom_pane again [done]

