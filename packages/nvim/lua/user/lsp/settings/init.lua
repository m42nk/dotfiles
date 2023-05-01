local M = {}

-- Create a table of custom configurations for language servers
-- :h mason-lspconfig.setup_handlers

M.custom_configurations = function(opts)
  -- List lsp server settings
  local init_path = debug.getinfo(1, "S").source:sub(2)
  local base_dir = init_path:match("(.*[/\\])"):sub(1, -2)
  local configs = vim.split(vim.fn.glob(base_dir .. "/*.lua"), "\n")

  local tbl = {}

  for _, config in pairs(configs) do
    -- Get the actual server name
    local name = string.gsub(config, ".*/(.*).lua", "%1", 1)

    if name ~= "" and name ~= "init" then
      -- Check if settings found
      local ok, _opts = pcall(require, "user.lsp.settings." .. name)

      if ok then
        -- Add the configuration to the table
        tbl[name] = function()
          opts = vim.tbl_extend("force", _opts, opts)
          -- put(name, opts)
          require("lspconfig")[name].setup(opts)
        end
      end
    end
  end

  -- return unpack(tbl)
  return tbl
end

return M
