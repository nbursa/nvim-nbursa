-- Select a grayscale colorscheme
vim.cmd.colorscheme("monochrome")

-- Set a gray background similar to the Codex UI
vim.cmd([[highlight Normal guifg=#d0d0d0 guibg=#1e1e1e]])
vim.cmd([[highlight NormalNC guifg=#d0d0d0 guibg=#1e1e1e]])
vim.cmd([[highlight NormalFloat guifg=#d0d0d0 guibg=#1e1e1e]])
-- Match nvim-tree background with the editor
vim.cmd([[highlight NvimTreeNormal guifg=#d0d0d0 guibg=#1e1e1e]])
vim.cmd([[highlight NvimTreeNormalNC guifg=#d0d0d0 guibg=#1e1e1e]])
vim.cmd([[highlight NvimTreeNormalFloat guifg=#d0d0d0 guibg=#1e1e1e]])

-- Make common syntax groups gray as well
local gray_groups = {
    "Comment",
    "Constant",
    "Identifier",
    "Statement",
    "PreProc",
    "Type",
    "Special",
    "Directory",
}

for _, group in ipairs(gray_groups) do
    vim.cmd(string.format("highlight %s guifg=#d0d0d0", group))
end
