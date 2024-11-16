# 🚀 Rawdog ML Neovim

A modern, blazing-fast Neovim configuration designed for full-stack development with first-class support for Go, TypeScript/JavaScript, Python, and Swift. Built with minimal bloat and maximum productivity in mind.

## ⚡️ Features

- 🔥 Lazy-loaded plugins for <50ms startup time
- 🌳 Native LSP with zero-config setup
- 🤖 GitHub Copilot integration
- 🔍 Blazing fast fuzzy finding with Telescope + ripgrep
- 🎨 Treesitter-based syntax highlighting
- 📦 Modular configuration for easy maintenance
- ⌨️  Ergonomic keymaps for efficient coding

## 🔧 Stack

- **Plugin Management**: lazy.nvim
- **Completions**: nvim-cmp
- **Fuzzy Finding**: Telescope + ripgrep
- **Git Integration**: gitsigns.nvim
- **AI Assistance**: Copilot
- **LSP Support**: 
  - Go (gopls)
  - TypeScript/JavaScript (tsserver)
  - Python (pyright)
  - Swift (sourcekit-lsp)

## 🚦 Prerequisites

```bash
# Arch Linux
sudo pacman -S neovim ripgrep fd nodejs npm go
yay -S swift-bin
```

## ⚡️ Quick Install

```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.bak

# Clone this repo
git clone https://github.com/marcusziade/nvim.git ~/.config/nvim

# Start Neovim (plugins will auto-install)
nvim

## ⌨️ Key Bindings

Leader key: `Space`

### General
- `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `<leader>fb` - Browse buffers

### LSP
- `gd` - Go to definition
- `gr` - Find references
- `K` - Show hover documentation
- `<leader>ca` - Code actions
- `<leader>rn` - Rename symbol

### Navigation
- `<C-h/j/k/l>` - Window navigation
- `[d/]d` - Previous/next diagnostic


```

## 📦 Directory Structure

```
~/.config/nvim
├── init.lua
└── lua/
    ├── config/
    │   ├── completion.lua   # nvim-cmp setup
    │   ├── keymaps.lua     # Key bindings
    │   ├── lazy.lua        # Plugin manager config
    │   ├── lsp/           # LSP configurations
    │   └── options.lua     # Neovim options
    └── plugins/
        └── init.lua        # Plugin specifications
```

## 🎨 Customization

Each aspect of this configuration is modular and easy to customize:

1. Add plugins in `lua/plugins/init.lua`
2. Modify LSP settings in `lua/config/lsp/`
3. Adjust key bindings in `lua/config/keymaps.lua`

## 📝 License

MIT