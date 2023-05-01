-- local with = vim.lsp.with
-- local handlers = vim.lsp.handlers

-- handlers["textdocument/hover"] = with(handlers.hover, {
--   border = "single",
-- })

-- handlers["textdocument/signaturehelp"] = with(handlers.signature_help, {
--   border = "single",
-- })

local float = {
  focusable = false,
  style = "minimal",
  border = "rounded",
  source = "always",
  header = "",
  prefix = "",
  -- format = function(d)
  --   local code = d.code or (d.user_data and d.user_data.lsp.code)
  --   if code then
  --     return string.format("%s [%s]", d.message, code):gsub("1. ", "")
  --   end
  --   return d.message
  -- end,
}

local config = { -- your config
  virtual_text = false,
  -- signs = lvim.lsp.diagnostics.signs,
  -- underline = lvim.lsp.diagnostics.underline,
  update_in_insert = true,
  float = float,
}

vim.diagnostic.config(config)
vim.lsp.handlers["textDocument/hover"] =
  vim.lsp.with(vim.lsp.handlers.hover, float)
vim.lsp.handlers["textDocument/signatureHelp"] =
  vim.lsp.with(vim.lsp.handlers.signature_help, float)
