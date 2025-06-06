local M = {}

function M.setup()
	-- lazy.nvim bootstrap
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not vim.loop.fs_stat(lazypath) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable",
			lazypath,
		})
	end
	vim.opt.rtp:prepend(lazypath)

	require("lazy").setup({
		-- ✦ colour & UI
		{ "Mofiqul/vscode.nvim", lazy = false, priority = 1000 },
		{ "kdheepak/monochrome.nvim", lazy = false, priority = 1000 },
		{ "EdenEast/nightfox.nvim", lazy = false, priority = 1000 },
		{ "mcchrish/zenbones.nvim", dependencies = { "rktjmp/lush.nvim" }, lazy = false, priority = 1000 },

		-- ✦ file-explorer
		{
			"nvim-tree/nvim-tree.lua",
			dependencies = { "nvim-tree/nvim-web-devicons" },
			lazy = false,
			config = function()
				require("nvim-tree").setup({
					hijack_cursor = true,
					view = { width = 30, side = "left" },
					renderer = { highlight_opened_files = "all" },
				})
				vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")
			end,
		},

		-- ✦ bufferline (top bar)
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
						diagnostics = "nvim_lsp",
						indicator = { style = "icon" },
						offsets = {
							{
								filetype = "NvimTree",
								text = "Explorer",
								separator = true,
							},
						},
					},
                                })
                        end,
                },

                -- ✦ tabline
                {
                        "nanozuki/tabby.nvim",
                        dependencies = { "nvim-tree/nvim-web-devicons" },
                },

                -- ✦ statusline (bottom)
                {
                        "famiu/feline.nvim",
                        dependencies = { "nvim-tree/nvim-web-devicons" },
                        config = function()
                                require("core.feline")
                        end,
                },

		-- ✦ LSP + completion
		{ "neovim/nvim-lspconfig" },
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "L3MON4D3/LuaSnip" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },

		-- ✦ git
		{
			"TimUntersberger/neogit",
			dependencies = { "nvim-lua/plenary.nvim" },
			config = function()
				require("neogit").setup()
				vim.keymap.set("n", "<leader>G", "<cmd>Neogit kind=vsplit<CR>")
			end,
		},
		{ "lewis6991/gitsigns.nvim", opts = {} },

		-- ✦ telescope
		{ "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

		-- ✦ treesitter
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			config = function()
				require("nvim-treesitter.configs").setup({
					highlight = { enable = true },
					indent = { enable = true },
					ensure_installed = { "rust", "lua", "tsx", "typescript", "javascript", "html", "css" },
				})
			end,
		},

		-- ✦ misc
		{ "numToStr/Comment.nvim", opts = {} },
		{
			"lukas-reineke/indent-blankline.nvim",
			main = "ibl",
			opts = { indent = { char = "│" }, scope = { enabled = false } },
		},
		{ "JoosepAlviste/nvim-ts-context-commentstring" },
	})
end

return M
