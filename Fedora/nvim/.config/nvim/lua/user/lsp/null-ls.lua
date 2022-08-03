local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
    sources = {
        diagnostics.codespell,
        -- diagnostics.misspell,
        -- diagnostics.actionlint,
        -- diagnostics.shellcheck,
        -- formatting.markdownlint,
        -- formatting.prettierd,
        formatting.stylua,
    }
}

-- null_ls.setup {
--   debug = false,
--   sources = {
--     formatting.prettier.with {
--       extra_filetypes = { "toml" },
--       extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
--     },
--     formatting.black.with { extra_args = { "--fast" } },
--     formatting.stylua,
--     formatting.google_java_format,
--     diagnostics.flake8,
--   },
-- }
--
