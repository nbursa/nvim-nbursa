local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "nvim-lualine/lualine.nvim", opts = {} },
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "neovim/nvim-lspconfig" },
	-- { "folke/tokyonight.nvim" },
	-- {
	-- 	"rose-pine/neovim",
	-- 	name = "rose-pine",
	-- 	config = function()
	-- 		require("rose-pine").setup({
	-- 			disable_background = true, -- koristiš transparentnost
	-- 		})
	-- 		vim.cmd("colorscheme rose-pine")
	-- 	end,
	-- },
	-- {
	-- 	"kvrohit/vaque.nvim",
	-- 	config = function()
	-- 		vim.cmd("colorscheme vaque")
	-- 	end,
	-- },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "L3MON4D3/LuaSnip" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "lewis6991/gitsigns.nvim", opts = {} },
	{ "tpope/vim-fugitive" },
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					go = { "gofmt" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					html = { "prettier" },
					css = { "prettier" },
					json = { "prettier" },
					yaml = { "prettier" },
					python = { "black" },
				},
				format_on_save = {
					timeout_ms = 5000,
					lsp_fallback = true,
				},
			})

			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function(args)
					require("conform").format({
						bufnr = args.buf,
						lsp_fallback = true,
					})
				end,
			})
		end,
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("bufferline").setup({
				options = {
					mode = "buffers",
					separator_style = "slant",
					always_show_bufferline = true,
					show_buffer_close_icons = false,
					show_close_icon = false,
					diagnostics = "nvim_lsp",
					offsets = {
						{
							filetype = "NvimTree",
							text = "Explorer",
							highlight = "Directory",
							text_align = "left",
							separator = true,
						},
					},
					themable = true,
					indicator = { style = "icon" },
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				highlight = { enable = true },
				indent = { enable = true },
				ensure_installed = {
					"tsx",
					"javascript",
					"typescript",
					"html",
					"css",
					"vue",
				},
			})
		end,
	},
	{ "numToStr/Comment.nvim", opts = {} },
	{ "JoosepAlviste/nvim-ts-context-commentstring" },
})
