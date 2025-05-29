local function open_nvim_tree()
	local api = require("nvim-tree.api")
	local bufname = vim.api.nvim_buf_get_name(0)
	if vim.fn.isdirectory(bufname) == 1 then
		api.tree.open()
	end
end

vim.api.nvim_create_autocmd("VimEnter", {
	callback = open_nvim_tree,
})
