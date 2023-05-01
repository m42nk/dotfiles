local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local sources = {
  diagnostics.codespell,
  diagnostics.shellcheck,
  diagnostics.zsh,
  diagnostics.credo,
  diagnostics.eslint_d,
  diagnostics.actionlint.with {
    filetypes = { "yaml.action" },
  },

  formatting.prettierd,
  -- formatting.prettier,
  formatting.stylua,
  formatting.shfmt,
  -- formatting.phpcbf,
  formatting.phpcsfixer,

  code_actions.gitsigns,
  code_actions.eslint_d,
  require "typescript.extensions.null-ls.code-actions",
}

null_ls.setup {
  sources = sources,
  -- on_attach = require("user.lsp.on-attach")
}
