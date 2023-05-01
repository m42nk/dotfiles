local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  vim.cmd [[packadd packer.nvim]]
end

-- TODO: change to lua
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua 
    \ source <afile>:p:h/packer.lua | 
    \ exe 'PackerClean' | 
    \ exe 'PackerCompile'
  augroup end
]]

-- Use a protected call so we don't error out on first use
local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
  return
end

-- Have packer use a popup window
packer.init {
  -- git = {
  --   timeout = 120,
  -- },
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end,
  },
}

return packer.startup(function(use)
  package.loaded["user.plugins"] = nil

  -- Load packer first
  use "wbthomason/packer.nvim"

  local plugins_ok, plugins = pcall(require, "user.plugin.plugins")
  if not plugins_ok then
    vim.notify(
    "INIT: Failed to parse plugins.lua, r u missing a comma?",
    vim.log.levels.ERROR
    )
  else
    for _, plugin in pairs(plugins) do
      use(plugin)
    end
  end

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
