vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- optionally enable 24-bit colour
vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true


-- keybindings
vim.keymap.set("n", "<leader>cf", "<cmd>qa!<CR>", { desc = "Force quit all" })
vim.keymap.set("n", "<C-h>", "<C-w>h", {
  desc = "Move to left window",
})

vim.keymap.set("n", "<C-l>", "<C-w>l", {
  desc = "Move to right window",
})

vim.keymap.set("n", "<C-j>", "<C-w>j", {
  desc = "Move to lower window",
})

vim.keymap.set("n", "<C-k>", "<C-w>k", {
  desc = "Move to upper window",
})

vim.keymap.set("n", "<leader>Q", function()
  vim.cmd("cclose")
end)

vim.keymap.set("n", "<leader>t", function()
  vim.cmd("botright split | terminal")
end, { desc = "Open terminal" })
