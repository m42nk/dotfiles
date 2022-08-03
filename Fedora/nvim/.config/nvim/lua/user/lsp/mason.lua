local M = {}

local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
  return
end

local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
  return
end

M.setup = function()
  mason.setup()

  mason_lspconfig.setup({
    ensure_installed = {
      "codespell",
      -- "misspell",
      "sumneko_lua",
      "cssls",
      "html",
      "tsserver",
      "pyright",
      "bashls",
      "jsonls",
      "yamlls",
    },
  })

  local opts = {
    on_attach = require("user.lsp.on_attach"),
    capabilities = require("user.lsp.capabilities"),
  }

  -- stylua: ignore
  local x = 1

  mason_lspconfig.setup_handlers(
    vim.tbl_deep_extend("force", require("user.lsp.settings").custom_configurations(opts), {
      function(server_name)
        require("lspconfig")[server_name].setup(opts)
      end,
    })
  )
end

return M
