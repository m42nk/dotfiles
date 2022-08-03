local M = {}

M.custom_configurations = function(opts)
    local configs = vim.split(vim.fn.glob('./settings/*lua'), '\n')
    local tbl = {}

    for _, config in ipairs(configs) do
        local name = string.gsub(config, './settings/(.*).lua', '%1', 1)

        if name ~= "init" then
            local ok, _opts = pcall(require, "user.lsp.settings." .. name)

            if ok then
                tbl[name] = function()
                    opts = vim.tbl_deep_extend("force", _opts, opts)
                    require("lspconfig")[name].setup(opts)
                end
            end
        end
    end

    return tbl
end

return M
