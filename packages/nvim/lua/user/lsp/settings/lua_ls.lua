local opts = {
  -- _disable_formatting = true,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      completion = {
        callSnippet = "Replace",
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
        --   [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

opts._disable_formatting = true

return opts
