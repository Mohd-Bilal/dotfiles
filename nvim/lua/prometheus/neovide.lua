if vim.g.neovide == true then
   vim.o.guifont = "FiraCode Nerd Font:h14,SauceCodePro Nerd Font:h14" -- text below applies for VimScript
   vim.api.nvim_set_keymap(
      "n",
      "<C-a>",
      ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>",
      { silent = true }
   )
   vim.api.nvim_set_keymap(
      "n",
      "<C-->",
      ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>",
      { silent = true }
   )
   vim.api.nvim_set_keymap("n", "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", { silent = true })
   vim.g.neovide_refresh_rate = 60
   vim.g.neovide_cursor_antialiasing = true
   vim.g.neovide_cursor_animate_in_insert_mode = true
   vim.g.neovide_cursor_animate_command_line = true
   vim.g.neovide_scale_factor = 0.9

   -- Helper function for transparency formatting
   -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
   -- vim.g.neovide_transparency = 0
 --  vim.g.transparency = 0.75
   -- vim.g.neovide_background_color = "#0f1117" .. alpha()
end
