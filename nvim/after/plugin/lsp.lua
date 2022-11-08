local custom_lsp_attach = function(client)
	-- See `:help nvim_buf_set_keymap()` for more information
	vim.api.nvim_buf_set_keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true })
	vim.api.nvim_buf_set_keymap(0, 'n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true })
	-- ... and other keymappings for LSP

	-- Use LSP as the handler for omnifunc.
	--    See `:help omnifunc` and `:help ins-completion` for more information.
	vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Use LSP as the handler for formatexpr.
	--    See `:help formatexpr` for more information.
	vim.api.nvim_buf_set_option(0, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')

	-- For plugins with an `on_attach` callback, call them here. For example:
	-- require('completion').on_attach()
end

require('lspconfig').sumneko_lua.setup {
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
				-- Setup your lua path
				path = vim.split(package.path, ';')
			},
			diagnostics = { globals = { 'vim' } },
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = { [vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true }
			}
		}
	},
	on_attach = custom_lsp_attach
}

--require('lspconfig').efm.setup {
--    init_options = {documentFormatting = true},
--    filetypes = {'lua'},
--    settings = {
--        rootMarkers = {'.git/'},
--        languages = {
--            lua = {
--                {
--                    formatCommand = 'lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=150 --break-after-table-lb',
--                    formatStdin = true
--                }
--            }
--        }
--    }
--}
--
local lsp_signature_config = {}
require('lsp_signature').setup(lsp_signature_config)

vim.cmd('autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100)')
