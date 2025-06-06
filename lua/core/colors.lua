local function safe_require(m)
	local ok, pkg = pcall(require, m)
	return ok and pkg or nil
end

-- commentstring (for tsx / jsx)
local tscc = safe_require("ts_context_commentstring")
if tscc then
	tscc.setup({ enable_autocmd = false })
end

-- preferred greyscale — VSCode Dark as u screenshot
local theme_set = pcall(function()
	local vscode = require("vscode")
	vscode.setup({
		style = "dark",
		transparent = false,
		group_overrides = {
			Normal = { bg = "#1a1a1a" },
			NormalNC = { bg = "#1a1a1a" },
			NormalFloat = { bg = "#1a1a1a" },
			EndOfBuffer = { bg = "#1a1a1a" },
			NvimTreeNormal = { bg = "#1a1a1a" },
			NvimTreeNormalNC = { bg = "#1a1a1a" },
		},
	})
	vim.cmd.colorscheme("vscode")
end)

-- fallback
if not theme_set then
	require("nightfox") -- ensures installed
	vim.cmd.colorscheme("carbonfox")
end
