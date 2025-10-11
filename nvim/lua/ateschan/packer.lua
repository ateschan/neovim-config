-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
use 'wbthomason/packer.nvim'
use {'nvim-telescope/telescope.nvim', tag = '0.1.8', requires = { {'nvim-lua/plenary.nvim'}}}
use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
use({'mason-org/mason.nvim'})
use({'mason-org/mason-lspconfig.nvim'})
use {'neoclide/coc.nvim', branch = 'release'}
use {'rose-pine/neovim'}
end)

