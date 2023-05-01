-- Completion engine
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

-- Snippet
local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

-- require("luasnip.loaders.from_vscode").lazy_load()

local formatting = require "user.cmp.formatting"
local keymaps = require "user.cmp.keymaps"

local src_nvim_lsp = {
  name = "nvim_lsp",
  entry_filter = function(entry, ctx)
    local kind = require("cmp.types").lsp.CompletionItemKind[entry:get_kind()]
    if kind == "Snippet" and ctx.prev_context.filetype == "java" then
      return false
    end
    if kind == "Text" then
      return false
    end
    return true
  end,
}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sources = cmp.config.sources({
    -- { name = "nvim_lsp" },
    src_nvim_lsp,
    { name = 'nvim_lsp_signature_help' },
    { name = "nvim_lua" },
    { name = "luasnip" },
    { name = "path" },
    { name = "buffer" },
  }, {
    -- Don't show these sources if all source above
    -- still have items to complete
    { name = "neorg" },
  }),
  mapping = keymaps,
  formatting = formatting,
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  confirm_opts = {
    -- TODO: read more on this
    -- current behavior is when there are other
    -- text before cursor when completing
    -- results in weird behaviour
    -- eg.
    -- local x = some_funxx('args')
    -- become
    -- local x = some_function()xx('args')
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  experimental = {
    ghost_text = true,
  },
}

--
-- Cmdline cmd
--
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  -- view = {
  --   entries = { name = "wildmenu", separator = " | " },
  -- },
  completion = { keyword_length = 3 },
  sources = cmp.config.sources {
    { name = "cmdline" },
    { name = "path" },
  },
})

--
-- Cmdline Search
--
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  -- view = {
  --   entries = { name = "wildmenu", separator = "|" },
  -- },
  completion = { keyword_length = 3 },
  sources = {
    { name = "buffer" },
  },
})
