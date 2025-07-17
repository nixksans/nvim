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

-- Cursor Style
-- Use a thin vertical bar to mimic VS Code's cursor
vim.opt.guicursor = "a:ver25"

-- Leader Key
vim.g.mapleader = " "

-- Make space do nothing in normal and visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Exit Commands
vim.keymap.set('n', '<leader>q', ':qa<CR>', { desc = 'Quit all' })

-- Save Command
vim.keymap.set('n', '<leader>s', '<cmd>w<CR>', { desc = 'Save file' })

-- Go back to previous file
vim.keymap.set("n", "<leader>b", "<C-^>", { desc = "Go back to previous file" })

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
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = actions.close,
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      })
      vim.keymap.set(
        "n",
        "<leader>f",
        "<cmd>Telescope live_grep<CR>",
        { silent = true, desc = "Grep in project" }
      )
      vim.keymap.set(
        "n",
        "<leader>p",
        "<cmd>Telescope find_files<CR>",
        { silent = true, desc = "Fuzzy find files" }
      )
    end,
  },
  {
    "Mofiqul/vscode.nvim",
    config = function()
      require("vscode").setup({
        disable_nvimtree_bg = false,
      })
      require("vscode").load()
    end,
  },
{
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup({
        current_line_blame = true,
        current_line_blame_opts = {
            delay = 300,
            virt_text_pos = "eol",
        },
        })
    end
}
})
