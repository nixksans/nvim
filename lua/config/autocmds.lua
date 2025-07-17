-- Autocommands
-- Ensure entering any buffer starts in Normal mode
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  command = "stopinsert",
})

