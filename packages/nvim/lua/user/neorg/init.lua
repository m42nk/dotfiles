local ok, neorg = pcall(require, "neorg")
if not ok then
  return
end

-- TODO:
-- pick available element/symbol, like notion "/"
-- shortcut for bold, italic, etc
-- insert snippet for inserting symbol
-- -- `page` will generate new template: {name}[name] to create file easily

neorg.setup {
  load = {
    ["core.defaults"] = {},
    ["external.context"] = {},
    ["core.keybinds"] = {},
    ["core.norg.concealer"] = {},
    ["core.norg.qol.toc"] = {},
    ["core.integrations.telescope"] = {},
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-cmp",
      },
    },
    ["core.gtd.base"] = {
      config = {
        workspace = "todo",
      },
    },
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          todo = "~/Notes/Todo",
          brain = "~/Notes/brain",
          elixir = "~/Notes/elixir",
        },
      },
    },
  },
}

require "user.neorg.keymaps"
