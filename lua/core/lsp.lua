local lspconfig = require("lspconfig")

lspconfig.gopls.setup({
	cmd = { "gopls" },
})
lspconfig.ts_ls.setup({})
lspconfig.pyright.setup({})
lspconfig.html.setup({})
lspconfig.cssls.setup({})
lspconfig.tailwindcss.setup({})
lspconfig.volar.setup({
	filetypes = {
		"typescript",
		"javascript",
		"javascriptreact",
		"typescriptreact",
		"vue",
	},
})
lspconfig.rust_analyzer.setup({
	cmd = { "rust-analyzer" },
	settings = {
		["rust-analyzer"] = {
			cargo = { allFeatures = true },
			checkOnSave = { command = "clippy" },
		},
	},
})
