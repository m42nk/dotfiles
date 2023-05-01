require("mini.bufremove").setup {
  set_vim_settings = true,
}

require("user.utils.keymaps").nmap {
  ["<leader>c"] = { "<cmd>bdelete<cr>", "Buffer close" },
  ["<leader>C"] = { "<cmd>bwipeout<cr>", "Buffer wipeout" },
}

