# Nicks NeoVim Setup

## Started with
```git clone https://github.com/nvim-lua/kickstart.nvim ~/.config/nvim```

## Install the Plugin Manager lazy.nvim:
```git clone https://github.com/folke/lazy.nvim.git ~/.local/share/nvim/site/pack/lazy/start/lazy.nvim```

## Copy below into terminal font settings
```Menlo, Monaco, 'Courier New', monospace```

## File Explorer
The configuration uses **nvim-tree.lua** for browsing files.
Toggle it with `<leader>e` (space + e). Files are displayed with icons thanks to **nvim-web-devicons**.
Files can be opened with a single mouse click inside the tree just like in VS Code.

## Fuzzy Finder
The setup includes **telescope.nvim** with the **telescope-fzf-native** extension
for faster fuzzy searching.
Launch grep with `<leader>f` (space + f) or fuzzy file search with `<leader>p` (space + p).

## VS Code Theme
The colorscheme uses **Mofiqul/vscode.nvim** to mimic VS Code's look.

## Git Integration
The setup includes **gitsigns.nvim** for inline git information similar to GitLens.
Signs show added, modified, and deleted lines and you can toggle blame with `:Gitsigns toggle_current_line_blame`.
