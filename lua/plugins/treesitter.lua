return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "ruby",
        "go",
        "python",
        "dart",
        "javascript",
        "typescript",
        "json",
        "html",
        "css",
        "bash",
        "lua",
        "markdown",
        "markdown_inline",
        "yaml",
        "vim",
        "gitcommit",
        "git_rebase",
        "diff",
        "sql",
        "dockerfile",
        "tsx",
      },
      auto_install = true,
      highlight = { enable = true, additional_vim_regex_highlighting = false },
      indent = { enable = true },
    })
  end,
}
