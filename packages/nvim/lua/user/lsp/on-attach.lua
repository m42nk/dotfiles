local on_attach = function(client, bufnr)
  if client.name == "tsserver" then
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end

  -- Attach keymaps
  require("user.lsp.keymaps").attach(bufnr)
end

return on_attach
