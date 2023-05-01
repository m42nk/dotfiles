-- local session_dir = vim.fn.stdpath "data" .. "/session"

-- local get_session_name = function()
--   -- local project_path = vim.fn.getcwd()
--   local project_path = require("user.utils.project-root").project_root()

--   if project_path then
--     return project_path:gsub("/", "%%")
--   end

--   vim.notify "project_path is nil"
-- end

-- local save_session = function()
--   local session_name = get_session_name()
--   require("mini.sessions").write(session_name, {})
-- end

-- require("mini.sessions").on_vimenter = function()
--   if vim.fn.argc() ~= 0 then
--     return
--   end

--   local session_name = get_session_name()
--   if not session_name then
--     return
--   end

--   local exists = vim.fn.filereadable(session_dir .. "/" .. session_name) ~= 0

--   put(exists)

--   if exists then
--     require("mini.sessions").read(session_name, {})
--   end
-- end

-- require("mini.sessions").setup {
--   -- Whether to read latest session if Neovim opened without file arguments
--   autoread = false,

--   -- Whether to write current session before quitting Neovim
--   autowrite = true,

--   -- Directory where global sessions are stored (use `''` to disable)
--   directory = session_dir,

--   -- File for local session (use `''` to disable)
--   file = "",

--   -- Whether to force possibly harmful actions (meaning depends on function)
--   force = { read = false, write = true, delete = false },

--   -- Hook functions for actions. Default `nil` means 'do nothing'.
--   hooks = {
--     -- Before successful action
--     pre = { read = nil, write = nil, delete = nil },
--     -- After successful action
--     post = { read = nil, write = nil, delete = nil },
--   },

--   -- Whether to print session path after action
--   verbose = { read = true, write = true, delete = true },
-- }

-- require("user.utils.keymaps").nmap {
--   ["<leader>S"] = {
--     name = "Sessions",
--     ["s"] = { save_session, "Save session" },
--     ["l"] = { require("mini.sessions").select, "Select sessions" },
--   },
-- }
