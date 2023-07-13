-- This file can be loaded by calling `lua require('plugins')` from your init.vim
--
-- -- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
--
return require('packer').startup(function(use)
--   -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
	    'nvim-telescope/telescope.nvim', tag = '0.1.1',
	    -- or                            , branch = '0.1.x',
	    requires = { {'nvim-lua/plenary.nvim'} }

    }
    use({
	    'rose-pine/neovim',
	    as = 'rose-pine',
		-- config = function()
		-- 		require("rose-pine").setup()
		-- 		vim.cmd('colorscheme rose-pine')
		-- end
    })
    use 'sainnhe/sonokai'
    use 'folke/tokyonight.nvim'
    use {'nyoom-engineering/oxocarbon.nvim'}
    use 'nyoom-engineering/nyoom.nvim'
    use 'NLKNguyen/papercolor-theme'
    use 'savq/melange-nvim'
    use 'mcchrish/zenbones.nvim'
	use({
			"kylechui/nvim-surround",
			tag = "*", -- Use for stability; omit to use `main` branch for the latest features
			config = function()
					require("nvim-surround").setup({
							-- Configuration here, or leave empty to use defaults
					})
			end
	})
	use {
			'numToStr/Comment.nvim',
			config = function()
					require('Comment').setup()
			end
	}

    use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')
    use 'mbbill/undotree'
    use 'tpope/vim-fugitive'
    use({
	    "L3MON4D3/LuaSnip",
	    -- follow latest release.
	    tag = "v1.*",
	    -- install jsregexp (optional!:).
	    run = "make install_jsregexp"
    })
	use 'lervag/vimtex'
	use 'jiangmiao/auto-pairs'

end)
