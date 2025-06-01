vim.g.skip_ts_context_commentstring_module = true

require("ts_context_commentstring").setup({
	enable_autocmd = false,
})

-- require("tokyonight").setup({
-- 	style = "night",
-- 	transparent = true,
-- })
--
-- vim.cmd.colorscheme("tokyonight")
-- require("rose-pine").setup({
--     style="dark"
--     transparent = false
--   })
--
-- vim.o.background = "dark"
-- vim.cmd.colorscheme("rose-pine")

vim.cmd([[
  hi Normal guibg=NONE ctermbg=NONE
  hi NormalNC guibg=NONE ctermbg=NONE
  hi NormalFloat guibg=NONE ctermbg=NONE
  hi EndOfBuffer guibg=NONE ctermbg=NONE
]])
