return {
  "folke/which-key.nvim",
  lazy = false,
  config = function()
    vim.o.timeout = false
    local wk = require("which-key")
    wk.setup({
      triggers = { "<leader>" },
      triggers_nowait = { "<leader>" },
    })
  end,
}
