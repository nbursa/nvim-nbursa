# nvim-nbursa

My personal Neovim IDE setup — focused, minimal, and production-ready.

## 🔧 Features

- `lazy.nvim` plugin manager
- Full LSP + Autocomplete (`nvim-lspconfig`, `nvim-cmp`, `LuaSnip`)
- Formatter on save via `conform.nvim`
- File tree (`nvim-tree`)
- Fuzzy finder (`telescope`)
- Preconfigured for:
  - Go
  - JavaScript / TypeScript
  - Python
  - HTML / CSS / Tailwind

## ⌨️ Keybinds

| Action            | Shortcut       |
|-------------------|----------------|
| File tree toggle  | `<leader>e`    |
| Find files        | `<leader>f`    |
| Live grep         | `<leader>g`    |
| Yank to clipboard | `<leader>y`    |
| Paste from clip   | `<leader>p`    |
| Autocomplete      | `<C-Space>`    |

## 📁 Structure

This is my `~/.config/nvim/` folder.  
It includes everything required to run a full Neovim IDE setup.

## 🚀 Install

```bash
git clone git@github.com:nbursa/nvim-nbursa.git ~/.config/nvim
```

## 📦 Requires

Neovim ≥ 0.9, plus:

- `go`, `prettier`, `black`, `stylua` installed
- `node`, `npm`, `pip`, etc. depending on language

