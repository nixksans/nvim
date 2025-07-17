return {
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
}
