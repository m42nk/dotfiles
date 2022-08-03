local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
    return
end

local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
    return
end

local servers = {
    "sumneko_lua",
    "cssls",
    "html",
    "tsserver",
    "pyright",
    "bashls",
    "jsonls",
    "yamlls",
}

mason.setup()
mason_lspconfig.setup({
    ensure_installed = servers
})

local opts = {}

local lspconfig = require("lspconfig")

local lsp_attach_keymap = function(bufnr)
    local _opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_buf_set_keymap
    keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", _opts)
    keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", _opts)
    keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", _opts)
    keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", _opts)
    keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", _opts)
    keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", _opts)
    keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<cr>", _opts)
    keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", _opts)
    keymap(bufnr, "n", "<leader>lI", "<cmd>Mason<cr>", _opts)
    keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", _opts)
    keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", _opts)
    keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", _opts)
    keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", _opts)
    keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", _opts)
    keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", _opts)
end

for _, server in pairs(servers) do
    opts = {
        on_attach = function(client, bufnr)
            lsp_attach_keymap(bufnr)
        end
    }

    local ok, setting = pcall(require, "user.lsp.settings." .. server)
    if ok then
        opts = vim.tbl_deep_extend("force", setting, opts)
    end

    lspconfig[server].setup(opts)
end
