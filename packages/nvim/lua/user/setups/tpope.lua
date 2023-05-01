local k = require "user.utils.keymaps"

-- k.nmap("<leader>s", "<plug>Ysurround", "Surround object")
-- k.nmap("<leader>ss", "<plug>Yssurround", "Surround line")

-- require("user.utils.keymaps").nmap({
-- ["<leader>g"] = {":Git<cr>", "Git status"}
-- })

require("user.utils.keymaps").nmap {
  ["<c-g>"] = { ":Git<cr>", "Git status" },
}
