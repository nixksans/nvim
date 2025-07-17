return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    picker = {
      enabled = true,
      win = {
        input = {
          keys = {
            ["<Esc>"] = { "close", mode = { "i", "n" } },
          },
        },
      },
      formatters = {
        file = {
          truncate = false,
        },
      },
    },
    explorer = {
      enabled = true,
    },
    dashboard = {
      enabled = true,
      sections = {
        { section = "header" },
        { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { section = "startup" },
      },
    },
  },   
  config = function(_, opts)
    local snacks = require("snacks")
    snacks.setup(opts)
    
    -- File finder (replacing Telescope find_files)
    vim.keymap.set("n", "<leader>p", function()
      snacks.picker.files()
    end, { desc = "Find Files" })
    
    -- Live grep (replacing Telescope live_grep)
    vim.keymap.set("n", "<leader>f", function()
      snacks.picker.grep()
    end, { desc = "Grep" })
    
    -- Additional useful pickers
    vim.keymap.set("n", "<leader>b", function()
      snacks.picker.buffers()
    end, { desc = "Buffers" })
    
    vim.keymap.set("n", "<leader>h", function()
      snacks.picker.help()
    end, { desc = "Help" })
    
    vim.keymap.set("n", "<leader>r", function()
      snacks.picker.recent()
    end, { desc = "Recent Files" })
    
    -- Explorer (replacing nvim-tree)
    vim.keymap.set("n", "<leader>e", function()
      snacks.explorer.open()
    end, { desc = "Open Explorer" })
  end,
}