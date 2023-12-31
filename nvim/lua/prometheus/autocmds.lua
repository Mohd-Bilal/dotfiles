local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local prometheus_group = augroup('prometheus', {})
local yank_group = augroup('HighlightYank', {})
local theme_group = augroup('ThemeChange', {})

-- Yank Highlight
autocmd('TextYankPost', {
   group = yank_group,
   pattern = '*',
   callback = function()
      vim.highlight.on_yank({
         higroup = 'IncSearch',
         timeout = 40,
      })
   end,
})

autocmd({ "BufWritePre" }, {
   group = prometheus_group,
   pattern = "*",
   command = [[%s/\s\+$//e]],
})

-- Reload tabline when theme changes
autocmd({ "ColorScheme" }, {
   group = theme_group,
   pattern = "*",
   callback = function()
      require("prometheus.config.tabline")
   end,
})
