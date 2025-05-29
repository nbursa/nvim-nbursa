-- require("core.options")
-- require("core.plugins")
-- require("core.colors")
-- require("core.lsp")
-- require("core.cmp")
-- require("core.statusline")
-- require("core.keymaps")
-- require("core.autocmds")
--
-- Leader
vim.g.mapleader = " "

-- UI
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.scrolloff = 3
vim.opt.termguicolors = true

-- Lazy.nvim bootstrap
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

-- Plugins
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
	{ "folke/tokyonight.nvim" },

	-- Autocomplete & Snippets
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "L3MON4D3/LuaSnip" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },

	-- Git plugins
	{ "lewis6991/gitsigns.nvim", opts = {} },
	{ "tpope/vim-fugitive" },

	--	{
	--		"vim-airline/vim-airline",
	--		lazy = false,
	--	},
	--	{
	--		"vim-airline/vim-airline-themes",
	--		lazy = false,
	--	},

	-- Formatter
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
					separator_style = "slant", -- ugaoni izgled
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
					indicator = {
						style = "icon",
					},
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
				ensure_installed = { "tsx", "javascript", "typescript", "html", "css", "vue" },
				-- context_commentstring = {
				-- 	enable = true,
				-- 	enable_autocmd = false,
				-- },
			})
		end,
	},
	{ "numToStr/Comment.nvim", opts = {} },
	{ "JoosepAlviste/nvim-ts-context-commentstring" },
})

vim.g.skip_ts_context_commentstring_module = true

require("ts_context_commentstring").setup({
	enable_autocmd = false,
})

-- nvim-tree
require("nvim-tree").setup({
	update_focused_file = {
		enable = true,
		update_root = false,
	},
	filters = {
		dotfiles = false,
	},
})

require("Comment").setup({
	pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
})

vim.keymap.set("n", "<leader>e", function()
	require("nvim-tree.api").tree.toggle()
end, { desc = "Toggle file tree" })
vim.keymap.set("n", "<leader>t", function()
	local view = require("nvim-tree.view")
	if view.is_visible() then
		if vim.bo.filetype == "NvimTree" then
			vim.cmd("wincmd l") -- Go right if in NvimTree
		else
			vim.cmd("NvimTreeFocus")
		end
	else
		vim.cmd("NvimTreeToggle")
	end
end, { desc = "Toggle NvimTree and focus" })

-- telescope
vim.keymap.set("n", "<leader>f", function()
	require("telescope.builtin").find_files()
end, { desc = "Find files" })
vim.keymap.set("n", "<leader>g", function()
	require("telescope.builtin").live_grep()
end, { desc = "Grep text" })

-- LSP
local lspconfig = require("lspconfig")
lspconfig.gopls.setup({
	cmd = { "gopls" },
})
lspconfig.ts_ls.setup({})
lspconfig.pyright.setup({})
lspconfig.html.setup({})
lspconfig.cssls.setup({})
lspconfig.tailwindcss.setup({})

require("lspconfig").volar.setup({
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
})

-- Clear search highlight on <Esc>
vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>", { silent = true, desc = "Clear highlights" })

-- clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from clipboard" })

-- Delete without yanking
vim.keymap.set("n", "x", '"_x', { desc = "Delete char (no yank)" })
vim.keymap.set("n", "X", '"_X', { desc = "Delete char (no yank)" })
vim.keymap.set("n", "dd", '"_dd', { desc = "Delete line (no yank)" })
vim.keymap.set("n", "D", '"_D', { desc = "Delete to EOL (no yank)" })
vim.keymap.set("n", "d", '"_d', { desc = "Delete motion (no yank)", noremap = true, expr = false })

vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Prev buffer" })

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover doc" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })

-- nvim-cmp
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	}),
})

require("tokyonight").setup({
	style = "night",
	transparent = true,
})
vim.cmd.colorscheme("tokyonight")

require("lualine").setup({
	options = {
		theme = "tokyonight",
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})

--vim.api.nvim_create_autocmd("User", {
--	pattern = "LazyDone",
--	callback = function()
--		vim.cmd([[
--      let g:airline_theme = 'superman'
--      let g:airline_powerline_fonts = 1
--
--      " Enable smart tabline (buffer tabs at top)
--      let g:airline#extensions#tabline#enabled = 1
--      let g:airline#extensions#tabline#formatter = 'default'
--
--      " Use angled powerline separators
--      let g:airline#extensions#tabline#left_sep = ''
--      let g:airline#extensions#tabline#left_alt_sep = ''
--    ]])
--	end,
--})

-- Remove background colors
vim.cmd([[
  hi Normal guibg=NONE ctermbg=NONE
  hi NormalNC guibg=NONE ctermbg=NONE
  hi NormalFloat guibg=NONE ctermbg=NONE
  hi EndOfBuffer guibg=NONE ctermbg=NONE
]])
