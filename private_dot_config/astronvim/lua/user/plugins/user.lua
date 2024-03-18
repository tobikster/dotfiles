return {
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function() require("nvim-surround").setup() end,
	},
	{
		"ggandor/leap.nvim",
		dependencies = {
			"tpope/vim-repeat",
		},
		event = "VeryLazy",
		config = function() require("leap").add_default_mappings() end,
	},
	{
		"folke/zen-mode.nvim",
		opts = {},
		event = "VeryLazy",
	},
	-- You can also add new plugins here as well:
	-- Add plugins, the lazy syntax
	-- "andweeb/presence.nvim",
	-- {
	--   "ray-x/lsp_signature.nvim",
	--   event = "BufRead",
	--   config = function()
	--     require("lsp_signature").setup()
	--   end,
	-- },
}
