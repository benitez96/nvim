-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		-- or                            , branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	use 'nvim-telescope/telescope-file-browser.nvim'

	use({
		'rose-pine/neovim',
		as = 'rose-pine',
		config = function()
			require("rose-pine").setup()
			vim.cmd('colorscheme rose-pine')
		end
	})

	use 'nvim-lualine/lualine.nvim' -- Statusline

	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("null-ls").setup()
		end,
		requires = { "nvim-lua/plenary.nvim" },
	})

	-- use 'github/copilot.vim'


	use { 'mg979/vim-visual-multi', branch = 'master' }
	use 'tpope/vim-surround'
	use 'tpope/vim-commentary'

	use 'jiangmiao/auto-pairs'

	-- guide linef
	use "lukas-reineke/indent-blankline.nvim"


	use 'NvChad/nvim-colorizer.lua'

	use "mbbill/undotree"
	use "tpope/vim-fugitive"
	use 'dinhhuy258/git.nvim' -- For git blame & browse
	use 'lewis6991/gitsigns.nvim'

	use 'kyazdani42/nvim-web-devicons' -- File icons

	-- LSP UIs
  use ({
    'nvimdev/lspsaga.nvim',
    after = 'nvim-lspconfig',
    config = function()
      require('lspsaga').setup({})
    end,
		dependencies = {
			{"nvim-tree/nvim-web-devicons"},
			{"nvim-treesitter/nvim-treesitter"}
		}
  })

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {

			-- cool cmp
			{ 'onsails/lspkind.nvim' },

			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lua' },

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },
			{ 'rafamadriz/friendly-snippets' },
		}

	}

	use { 'mrshmllow/document-color.nvim', config = function()
		require("document-color").setup {
			-- Default options
			mode = "background", -- "background" | "foreground" | "single"
		}
	end
	}

	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}

	use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

	use 'windwp/nvim-ts-autotag'

  --Debugger
  use {'mfussenegger/nvim-dap'}
  use {'rcarriga/nvim-dap-ui'}
  use {'nvim-telescope/telescope-dap.nvim'}
  use {'theHamsta/nvim-dap-virtual-text'}

  -- JS Debugger Adapter
  use { "mxsdev/nvim-dap-vscode-js", requires = {"mfussenegger/nvim-dap"} }

  -- Python Debugger Adapter
  use {'mfussenegger/nvim-dap-python'}


  -- emojis
  use "stevearc/dressing.nvim"
  use({ "ziontee113/icon-picker.nvim", })

  -- rust support
  use "rust-lang/rust.vim"

  -- astro support
  use 'wuelnerdotexe/vim-astro'



end)
