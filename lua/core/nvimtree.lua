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
	local api = require("nvim-tree.api")
	local view = require("nvim-tree.view")

	if view.is_visible() then
		if vim.bo.filetype == "NvimTree" then
			vim.cmd("wincmd l")
		else
			api.tree.focus()
		end
	else
		api.tree.toggle()
	end
end, { desc = "Toggle NvimTree and focus" })
