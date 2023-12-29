-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { { 'nvim-lua/plenary.nvim' } }
  },
  {
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      vim.cmd('colorscheme rose-pine')
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end
  },
  { "nvim-treesitter/nvim-treesitter-context" },
  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  },
  { "laytan/cloak.nvim" },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup()
    end
  },
  {
    "willothy/nvim-cokeline",
    dependencies = {
      "nvim-lua/plenary.nvim",        -- Required for v0.4.0+
      "kyazdani42/nvim-web-devicons", -- If you want devicons
      "stevearc/resession.nvim"       -- Optional, for persistent history
    },
    config = function()
      require("prometheus.tabline")
    end
  },
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp"
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  {
    "onsails/lspkind.nvim"
  },
  {
    "themercorp/themer.lua",
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    event = "BufEnter",
    config = function()
      require('ts_context_commentstring').setup {
        enable_autocmd = false,
      }
    end
  },
  {
    'numToStr/Comment.nvim',
    event = "BufEnter",
    config = function()
      require('Comment').setup(
        {
          pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
        }
      )
    end,
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    }
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("prometheus.statusline")
    end
  }

})
