require("prometheus.set")
require("prometheus.lazy")
require("prometheus.neovide")

local utils = require("prometheus.utils")
local mappings = require("prometheus.remap")

local augroup = vim.api.nvim_create_augroup
local prometheus_group = augroup('prometheus', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})
local theme_group = augroup('ThemeChange', {})

function R(name)
   require("plenary.reload").reload_module(name)
end

utils.load_mappings(mappings)

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

autocmd({ "ColorScheme" }, {
   group = theme_group,
   pattern = "*",
   callback = function()
      require("prometheus.config.tabline")
   end,
})
