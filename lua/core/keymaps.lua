-- NvimTree
vim.keymap.set("n", "<leader>e", function()
	require("nvim-tree.api").tree.toggle()
end, { desc = "Toggle file tree" })

vim.keymap.set("n", "<leader>t", function()
	local view = require("nvim-tree.view")
	if view.is_visible() then
		if vim.bo.filetype == "NvimTree" then
			vim.cmd("wincmd l")
		else
			vim.cmd("NvimTreeFocus")
		end
	else
		vim.cmd("NvimTreeToggle")
	end
end, { desc = "Toggle NvimTree and focus" })

-- Telescope
vim.keymap.set("n", "<leader>f", function()
	require("telescope.builtin").find_files()
end, { desc = "Find files" })

vim.keymap.set("n", "<leader>g", function()
	require("telescope.builtin").live_grep()
end, { desc = "Grep text" })

-- LSP
vim.keymap.set("n", "<leader>x", function()
	require("trouble").toggle()
end, { desc = "Toggle Trouble (diagnostics)" })

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover doc" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })

-- Format
vim.keymap.set("n", "<leader>F", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format buffer" })

-- Clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from clipboard" })

-- Delete without yank
vim.keymap.set("n", "x", '"_x', { desc = "Delete char (no yank)" })
vim.keymap.set("n", "X", '"_X', { desc = "Delete char (no yank)" })
vim.keymap.set("n", "dd", '"_dd', { desc = "Delete line (no yank)" })
vim.keymap.set("n", "D", '"_D', { desc = "Delete to EOL (no yank)" })
vim.keymap.set("n", "d", '"_d', { desc = "Delete motion (no yank)", noremap = true })

-- Buffer nav
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Prev buffer" })

-- Escape clears highlights
vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>", { silent = true, desc = "Clear highlights" })
