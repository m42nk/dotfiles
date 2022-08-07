----------------------------------
-- UI related configuration
-- for LSP
----------------------------------

-- Change diagnostics signs in signcolumn and etc
local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

-- Configuration for vim.diagnostics
local config = {
  virtual_text = false, -- disable virtual text
  signs = {
    active = signs, -- show signs
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = true,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
}

vim.diagnostic.config(config)

local with = vim.lsp.with
local handlers = vim.lsp.handlers

handlers["textDocument/hover"] = with(
handlers.hover, {
  border = "rounded"
})

handlers["textDocument/signatureHelp"] = with(
handlers.signature_help, {
  border = "rounded",
})
