return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local function on_attach(bufnr)
      local api = require("nvim-tree.api")
      api.config.mappings.default_on_attach(bufnr)
      vim.keymap.set(
        "n",
        "<LeftRelease>",
        api.node.open.edit,
        { buffer = bufnr, desc = "Open file or folder" }
      )
    end

    require("nvim-tree").setup({
      on_attach = on_attach,
    })

    vim.keymap.set(
      "n",
      "<leader>e",
      "<cmd>NvimTreeToggle<CR>",
      { silent = true, desc = "Toggle file explorer" }
    )
  end,
}
