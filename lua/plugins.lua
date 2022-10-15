local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.api.nvim_command('packadd packer.nvim')
end


local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use {'svrana/neosolarized.nvim', requires = {
    'tjdevries/colorbuddy.nvim'
  }}
  use 'nvim-lualine/lualine.nvim'
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind-nvim'
  use 'L3MON4D3/LuaSnip'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'
  use 'windwp/nvim-ts-autotag'
  use 'windwp/nvim-autopairs'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use "nvim-telescope/telescope-file-browser.nvim"
  use 'akinsho/nvim-bufferline.lua'
  use {'glepnir/lspsaga.nvim', branch = 'main' }
  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'dart-lang/dart-vim-plugin'
  use {'Shougo/defx.nvim', run = ':UpdateRemotePlugins'}
  use 'kristijanhusak/defx-git'
  use 'kristijanhusak/defx-icons'
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  use {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim'}
  if packer_bootstrap then
    require('packer').sync()
  end
end)
