local ok, wk = pcall(require, "which-key")
if not ok then
  return
end

wk.setup {
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = true,
      suggestions = 20,
    },
    presets = {
      operators = true,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
  },
  operators = { gc = "Comments" },
  key_labels = {
    ["<space>"] = "<Space>",
    -- ["/"] = "<Slash>",
    -- ["<space>"] = "[SPC]",
    -- ["<leader>"] = "[LEAD]",
    -- ["<Tab>"] = "[TAB]",
  },
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "+",
  },
  popup_mappings = {
    scroll_down = "<c-d>",
    scroll_up = "<c-u>",
  },
  window = {
    border = "none",
    position = "bottom",
    margin = { 1, 0, 1, 0 },
    padding = { 1, 0, 1, 0 },
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 100 },
    width = { min = 20, max = 50 },
    spacing = 2,
    align = "left",
  },
  ignore_missing = false,
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
  show_help = true,
  triggers = "auto",

  triggers_blacklist = {
    i = { "j", "k" },
    v = { "j", "k" },
  },
}
