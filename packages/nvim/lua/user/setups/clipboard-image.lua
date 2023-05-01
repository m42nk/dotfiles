local ok, ci = pcall(require, "clipboard-image")
if not ok then
  return
end

ci.setup {
  -- Default configuration for all filetype
  default = {
    img_dir = "images",
    affix = "<\n  %s\n>", -- Multi lines affix
    img_name = function()
      vim.fn.inputsave()
      local name = vim.fn.input {
        prompt = "Name: ",
        default = vim.fn.fnamemodify(vim.fn.expand "%", ":p:t:r"),
      }

      vim.fn.inputrestore()

      if name == nil or name == "" then
        return os.date "%y-%m-%d-%H-%M-%S"
      end
      return name
    end,
  },
  -- You can create configuration for ceartain filetype by creating another field (markdown, in this case)
  -- If you're uncertain what to name your field to, you can run `lua print(vim.bo.filetype)`
  -- Missing options from `markdown` field will be replaced by options from `default` field
  markdown = {
    img_dir = { "public", "static", "images", "blog" }, -- Use table for nested dir (New feature form PR #20)
    img_dir_txt = "/static/images/blog",
    -- img_handler = function()
    --   return function(path)
    --     -- string.format("cp %s temp.png; imagemin temp.png > %s &", path, path)
    --     -- return os.execute(
    --     --   string.format("cp %s %s-temp.png", path, path)
    --     -- )
    --     return os.execute("touch /tmp/a.txt")
    --   end
    -- end,

    img_name = function()
      vim.fn.inputsave()

      local default_name = vim.fn.fnamemodify(vim.fn.expand "%", ":p:t:r")
      local target_dir = vim.fn.fnamemodify(vim.fn.expand "%", ":p:h")
      local number = 1

      local get_target_filename = function()
        return vim.fn.getcwd()
          .. "/public/static/images/blog/"
          .. default_name
          .. "-"
          .. number
          .. ".png"
      end

      local target_filename = get_target_filename()

      while vim.fn.filereadable(target_filename) ~= 0 do
        number = number + 1
        target_filename = get_target_filename()
      end

      default_name = vim.fn.fnamemodify(vim.fn.expand "%", ":p:t:r")
        .. "-"
        .. number

      local name = vim.fn.input {
        prompt = "Name: ",
        default = default_name,
      }

      vim.fn.inputrestore()

      if name == nil or name == "" then
        return os.date "%y-%m-%d-%H-%M-%S"
      end
      return name
    end,
  },
}

require("user.utils.keymaps").nmap {
  ["<leader>P"] = { "<cmd>PasteImg<cr>", "Paste Image" },
}
