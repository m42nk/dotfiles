-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- return capabilities

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if status_ok then
  return cmp_nvim_lsp.default_capabilities()
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits",
  },
}

return capabilities
