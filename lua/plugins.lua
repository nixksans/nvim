-- Plugin Manager Bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

-- Load individual plugin specs
local plugins = {
  require("plugins.tree"),
  require("plugins.oil"),
  require("plugins.telescope"),
  require("plugins.bufferline"),
  require("plugins.vscode"),
  require("plugins.treesitter"),
  require("plugins.gitsigns"),
}

-- Plugin Setup
require("lazy").setup(plugins)
