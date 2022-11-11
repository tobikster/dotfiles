require('packer').startup(
	function(use)
		use 'wbthomason/packer.nvim' -- Packer can manage itself
		use 'tpope/vim-surround'
		use 'tpope/vim-repeat'
		use {
			'neovim/nvim-lspconfig',
			config = function()
				require('lspconfig').intelephense.setup({
					on_attach = function(client, bufnr)
						-- Enable (omnifunc) completion triggered by <c-x><c-o>
						-- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
						-- vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
						-- Here we should add additional keymaps and configuration options.
					end,
					flags = {
						debounce_text_changes = 150,
					}
				})
			end
		}
		use 'ray-x/lsp_signature.nvim'
		use {
			'glacambre/firenvim',
			run = function() vim.fn['firenvim#install'](0) end
		}
		use {
			'nvim-telescope/telescope.nvim',
			tag = '0.1.0',
			requires = {
				{ 'nvim-lua/plenary.nvim' },
			}
		}
		use {
			'folke/zen-mode.nvim',
			config = function()
				require('zen-mode').setup {
					--- Plugin configuration here
				}
			end
		}
		use 'EdenEast/nightfox.nvim'
		use 'jamessan/vim-gnupg'
		use {
			'nvim-treesitter/nvim-treesitter',
			run = function()
				local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
				ts_update()
			end,
		}
		use 'ThePrimeagen/vim-be-good'
		use 'tveskag/nvim-blame-line'
	end
)
