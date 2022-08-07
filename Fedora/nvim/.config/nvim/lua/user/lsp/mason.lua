local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
  return
end

local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
  return
end

mason.setup()

mason_lspconfig.setup {
  ensure_installed = {
    "emmet-ls",
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
}

-- Custom `ensure_installed` for Mason (installing other than lsp)
-- NOTE: not implemented
-- although checking it on every startup might be slower and inefficient
-- probably move it to config install script, using headless install

local opts = {
  on_attach = require "user.lsp.on_attach",
  capabilities = require "user.lsp.capabilities",
}

mason_lspconfig.setup_handlers(vim.tbl_deep_extend("force", require("user.lsp.settings").custom_configurations(opts), {
  function(server_name)
    require("lspconfig")[server_name].setup(opts)
  end,
}))
