-- Leader Key
vim.g.mapleader = " "

-- Make space do nothing in normal and visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Exit Commands
vim.keymap.set("n", "<leader>q", ":qa<CR>", { desc = "Quit all" })

-- Save Command
vim.keymap.set("n", "<leader>s", "<cmd>w<CR>", { desc = "Save file" })

-- Go back to previous file
vim.keymap.set("n", "<leader>b", "<C-^>", { desc = "Go back to previous file" })
