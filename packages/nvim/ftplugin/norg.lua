local k = require "user.utils.keymaps"

vim.wo.conceallevel = 3
-- vim.wo.concealcursor = "nvc"
vim.wo.concealcursor = "n"

k.nmap {
  ["<leader>;"] = {
    [";"] = {
      function()
        vim.wo.conceallevel = vim.wo.conceallevel == 3 and 0 or 3
        vim.notify(
          "Changed conceallevel to " .. vim.wo.conceallevel,
          vim.log.levels.INFO
        )
      end,
      "Toggle conceal",
    },
    ["0"] = { "<cmd>set conceallevel=0<cr>", "Conceal level 0" },
    ["1"] = { "<cmd>set conceallevel=1<cr>", "Conceal level 1" },
    ["2"] = { "<cmd>set conceallevel=2<cr>", "Conceal level 2" },
    ["3"] = { "<cmd>set conceallevel=3<cr>", "Conceal level 3" },
  },
}
