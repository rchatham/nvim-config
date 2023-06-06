-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use 'echasnovski/mini.colors'

  use({ 
	  'rose-pine/neovim', 
	  as = 'rose-pine', 
	  -- requires = { {'echasnovski/mini.nvim'} },
	  config = function() 
		  -- Requires `rose-pine/neovim` and `echasnovski/mini.colors`
		  vim.cmd('colorscheme rose-pine')
		  require("mini.colors").get_colorscheme():add_cterm_attributes():apply()
		  vim.opt.termguicolors = false
	  end 
  })

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  
end)
