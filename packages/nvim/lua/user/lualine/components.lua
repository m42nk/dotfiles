local colors = require "user.lualine.colors"

local lsp_status_ok, lsp_status = pcall(require, "lsp-status")
if lsp_status_ok then
  lsp_status.register_progress()
end

local diff_source = function()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

local conditions = {
  hide_in_width = function()
    return vim.fn.winwidth(0) > 90
  end,
}

return {
  mode = {
    function()
      return " "
    end,
    padding = { left = 0, right = 0 },
    color = {},
    cond = nil,
  },
  branch = {
    "b:gitsigns_head",
    icon = "",
    -- color = { gui = "bold" },
  },
  filename = {
    function()
      local fname = vim.fn.expand "%:t"
      --[[ local tbl = vim.split(vim.fn.expand "%:~:.", "/") ]]
      --[[ local fname = "" ]]

      --[[ for i, v in pairs(tbl) do ]]
      --[[   if i == #tbl then ]]
      --[[     fname = fname .. v ]]
      --[[   elseif vim.fn.winwidth(0) > 84 then ]]
      --[[     -- Display full ]]
      --[[     fname = fname .. v .. "/" ]]
      --[[   else ]]
      --[[     -- Get first two letter ]]
      --[[     fname = fname .. v:sub(1, 2) .. "/" ]]
      --[[   end ]]
      --[[ end ]]

      return fname
    end,
    color = {},
    cond = nil,
    on_click = function()
      put(vim.fn.expand "%:~:.")
    end,
  },
  diff = {
    "diff",
    source = diff_source,
    symbols = { added = " ", modified = " ", removed = " " },
    diff_color = {
      added = { fg = colors.green },
      modified = { fg = colors.yellow },
      removed = { fg = colors.red },
    },
    cond = conditions.hide_in_width,
  },
  python_env = {
    function()
      local utils = require "lvim.core.lualine.utils"
      if vim.bo.filetype == "python" then
        local venv = os.getenv "CONDA_DEFAULT_ENV"
        if venv then
          return string.format("  (%s)", utils.env_cleanup(venv))
        end
        venv = os.getenv "VIRTUAL_ENV"
        if venv then
          return string.format("  (%s)", utils.env_cleanup(venv))
        end
        return ""
      end
      return ""
    end,
    color = { fg = colors.green },
    -- cond = conditions.hide_in_width,
  },
  diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = { error = " ", warn = " ", info = " ", hint = "" },
    cond = conditions.hide_in_width,
  },
  treesitter = {
    function()
      return ""
    end,
    color = function()
      local buf = vim.api.nvim_get_current_buf()
      local ts = vim.treesitter.highlighter.active[buf]
      return {
        fg = ts and not vim.tbl_isempty(ts) and colors.green or colors.red,
      }
    end,
    -- cond = conditions.hide_in_width,
  },
  lsp_progress = {
    function()
      local msgs = lsp_status.messages()
      for _, msg in ipairs(msgs) do
        if not tonumber(msg.name) then
          return string.format("%s %s", msg.name, msg.percentage) .. "%%"
        end

        return string.format("%s %s", msg.title, msg.percentage) .. "%%"
      end

      return ""
    end,
  },
  lsp = {
    function(msg)
      msg = msg or "LS Inactive"
      local buf_clients = vim.lsp.get_active_clients { bufnr = 0 }

      if next(buf_clients) == nil then
        -- TODO: clean up this if statement
        if type(msg) == "boolean" or #msg == 0 then
          return "LS Inactive"
        end
        return msg
      end

      local buf_ft = vim.bo.filetype
      local buf_client_names = {}

      -- add client
      for _, client in pairs(buf_clients) do
        if client.name ~= "null-ls" then
          table.insert(buf_client_names, client.name)
        end
      end

      local nls_sources = require "null-ls.sources"
      local avail = nls_sources.get_available(buf_ft)
      for _, client in pairs(avail) do
        local skip = false

        local skips = { "codespell", "misspell", "gitsigns" }
        for _, sk in pairs(skips) do
          if client.name == sk then
            skip = true
          end
        end

        if not skip then
          table.insert(buf_client_names, client.name)
        end
      end

      local unique_client_names = vim.fn.uniq(buf_client_names)
      return "[" .. table.concat(unique_client_names, ", ") .. "]"
    end,
    color = { gui = "bold" },
    -- cond = conditions.hide_in_width,
  },
  location = {
    "location",
    -- cond = conditions.hide_in_width,
    color = {},
  },
  progress = {
    "progress",
    -- cond = conditions.hide_in_width,
    color = {},
  },
  spaces = {
    function()
      if not vim.api.nvim_buf_get_option(0, "expandtab") then
        return "Tab size: " .. vim.api.nvim_buf_get_option(0, "tabstop") .. " "
      end
      local size = vim.api.nvim_buf_get_option(0, "shiftwidth")
      if size == 0 then
        size = vim.api.nvim_buf_get_option(0, "tabstop")
      end
      return "Spaces: " .. size .. " "
    end,
    cond = conditions.hide_in_width,
    color = {},
  },
  encoding = {
    "o:encoding",
    fmt = string.upper,
    color = {},
    cond = conditions.hide_in_width,
  },
  filetype = { "filetype", cond = conditions.hide_in_width },
  fileformat = {
    "fileformat",
    icons_enabled = false,
  },

  buf_count = {
    function()
      local len = 0
      local buffers = vim.api.nvim_list_bufs()
      for b in pairs(buffers) do
        if vim.fn.buflisted(b) ~= 1 then
          len = len + 1
        end
      end

      return "[Buf]: " .. len - 1
    end,
  },

  -- WINBAR
  relative_pathname = {
    "filename",
    path = 1,
    fmt = function(msg)
      if vim.bo.filetype == "help" then
        return vim.fn.fnamemodify(vim.fn.expand "%", ":t")
      end
      return msg
    end,
  },
  ft_icon = {
    "filetype",
    icon_only = true,
    padding = { left = 1, right = 0 },
    icon = { align = "right" },
  },
  ft_icon_nocolor = {
    "filetype",
    icon_only = true,
    padding = { left = 1, right = 0 },
    colored = false,
    icon = { align = "right" },
  },
}
