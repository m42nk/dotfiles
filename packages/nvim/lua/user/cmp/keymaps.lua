local cmp = require "cmp"
local utils = require "user.cmp.utils"

-- Desc
-- use `cmp.mapping` to specify mode
-- ['<CR>'] = cmp.mapping(your_mapping_function, { 'i', 'c' })
return cmp.mapping.preset.insert {
  ["<C-k>"] = cmp.mapping.select_prev_item(),
  ["<C-j>"] = cmp.mapping.select_next_item(),

  ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
  ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),

  ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
  ["<C-e>"] = cmp.mapping {
    i = cmp.mapping.abort(),
    c = cmp.mapping.close(),
  },
  -- ["<CR>"] = cmp.mapping.confirm { select = false },
  ["<CR>"] = utils.handle_cr,
  ["<Tab>"] = cmp.mapping(utils.handle_tab, { "i", "s" }),
  ["<S-Tab>"] = cmp.mapping(utils.handle_s_tab, { "i", "s" }),
}
