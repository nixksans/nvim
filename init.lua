-- ~/.config/nvim/init.lua

-- Basic Editor Settings
vim.opt.number = true
-- vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"

-- Leader Key
vim.g.mapleader = " "

-- Plugin Manager Bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

-- Plugin Setup
require("lazy").setup({
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup()
      vim.keymap.set(
        "n",
        "<leader>e",
        "<cmd>NvimTreeToggle<CR>",
        { silent = true, desc = "Toggle file explorer" }
      )
    end,
  },
})
