local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

require("packer").startup(function(use)
  use("wbthomason/packer.nvim")
  use("tpope/vim-abolish")
  use("tpope/vim-repeat")
  use("tpope/vim-surround")
  use("ggandor/lightspeed.nvim")
end)
