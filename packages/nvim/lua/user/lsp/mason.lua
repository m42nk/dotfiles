require("mason").setup {}

require("mason-tool-installer").setup {
  auto_update = false,

  -- Lazy load autostart by 3 seconds
  -- So it doesn't effect startup time
  run_on_start = true,
  start_delay = 3000,

  ensure_installed = {
    -- "gopls",
    "bash-language-server",
    "html-lsp",
    "codespell",
    "dockerfile-language-server",
    "fixjson",
    "yamllint",
    "marksman",
    -- "rome",
    "lua-language-server",
    "elixir-ls",
    "tailwindcss-language-server",
    "pyright",
    "shfmt",
    "css-lsp",
    "cmake-language-server",
    "typescript-language-server",
    "python-lsp-server",
    "svelte-language-server",
    "emmet-ls",
    "stylua",
    "shellcheck",
    "prettierd",
  },
}

local opts = {
  on_attach = require "user.lsp.on-attach",
  capabilities = require "user.lsp.capabilities",
}

local configs = {
  function(server_name)
    require("lspconfig")[server_name].setup(opts)
  end,
}

-- Load user custom config from settings
configs = vim.tbl_extend(
  "force",
  configs,
  require("user.lsp.settings").custom_configurations(opts)
)

-- Configure schemastore
configs["jsonls"] = function()
  local _opts = vim.tbl_extend("force", opts, {
    settings = {
      json = {
        schemas = require("schemastore").json.schemas(),
        validate = { enable = true },
      },
    },
  })

  require("lspconfig").jsonls.setup(_opts)
end

configs["elixirls"] = function()
  local install_path =
    require("mason-registry").get_package("elixir-ls"):get_install_path()

  local bin = install_path .. "/language_server.sh"

  require("lspconfig").elixirls.setup {
    on_attach = opts.on_attach,
    capabilities = opts.capabilities,
    cmd = { bin },
  }
end

configs["emmet_ls"] = function()
  require("lspconfig").emmet_ls.setup {
    on_attach = opts.on_attach,
    capabilities = opts.capabilities,
    filetypes = {
      "html",
      "vue",
      "typescriptreact",
      "javascriptreact",
      "css",
      "sass",
      "scss",
      "less",
    },
    init_options = {
      html = {
        options = {
          -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
          ["bem.enabled"] = true,
        },
      },
    },
  }
end

configs["ansiblels"] = function()
  require("lspconfig").ansiblels.setup {
    on_attach = opts.on_attach,
    capabilities = opts.capabilities,
    cmd = { "ansible-language-server", "--stdio" },
    filetypes = { "yaml.ansible" },
    settings = {
      ansible = {
        ansible = {
          path = "ansible",
        },
        executionEnvironment = {
          enabled = false,
        },
        python = {
          interpreterPath = "python",
        },
        validation = {
          enabled = false,
          lint = {
            enabled = false,
            path = "ansible-lint",
          },
        },
      },
    },
  }
end

configs["tsserver"] = function()
  -- FAKLAH DUNIA INI
  -- this settings is handled by typescript.nvim
end

-- configs["volar"] = function()
--   require("lspconfig").volar.setup {
--     init_options = {
--       typescript = {
--         tsdk = vim.fn.getenv "HOME"
--           .. "/.asdf/installs/nodejs/16.16.0/.npm/lib/node_modules/typescript/lib",
--       },
--     },
--     on_attach = opts.on_attach,
--     capabilities = opts.capabilities,
--     filetypes = {
--       "typescript",
--       "javascript",
--       "javascriptreact",
--       "typescriptreact",
--       "vue",
--       "json",
--     },
--   }
-- end

-- configs["volar"] = function()
-- end

-- Autosetup installed lsp
require("mason-lspconfig").setup_handlers(configs)
