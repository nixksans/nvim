return {
  "folke/which-key.nvim",
  lazy = false,
  config = function()
    local wk = require("which-key")
    wk.setup({
      triggers = { "<leader>" },
      triggers_nowait = { "<leader>" },
    })
  end,
}
