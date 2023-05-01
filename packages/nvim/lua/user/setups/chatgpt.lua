local ok, chatgpt = pcall(require, "chatgpt")
if not ok then
  return
end

-- vim.fn.setenv("OPENAI_API_KEY", )

chatgpt.setup {
  openai_params = {
    model = "gpt-3.5-turbo",
    frequency_penalty = 0,
    presence_penalty = 0,
    max_tokens = 300,
    temperature = 0,
    top_p = 1,
    n = 1,
  },
  openai_edit_params = {
    model = "code-davinci-edit-001",
    temperature = 0,
    top_p = 1,
    n = 1,
  },
  keymaps = {
    close = { "<C-c>" },
    submit = "<C-J>",
    yank_last = "<C-y>",
    yank_last_code = "<C-k>",
    scroll_up = "<C-u>",
    scroll_down = "<C-d>",
    toggle_settings = "<C-o>",
    new_session = "<C-n>",
    cycle_windows = "<Tab>",
    -- in the Sessions pane
    select_session = "<Space>",
    rename_session = "r",
    delete_session = "d",
  },
}

require("user.utils.keymaps").nmap("<leader>GG", "<cmd>:ChatGPT<CR>", "Open ChatGPT Prompt")
require("user.utils.keymaps").nmap("<leader>Gg", "<cmd>:ChatGPT<CR>", "Open ChatGPT Prompt")
require("user.utils.keymaps").vmap("<leader>Gg", "<cmd>:ChatGPTEditWithInstructions<CR>", "ChatGPTEditWithInstructions")

