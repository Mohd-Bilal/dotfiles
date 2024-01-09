-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",   -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      require("prometheus.config.telescope")
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require("prometheus.config.treesitter")
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
      { 'hrsh7th/cmp-nvim-lsp-signature-help' },

      -- Snippets
      {
        'L3MON4D3/LuaSnip',
        build = "make install_jsregexp"
      },
      { 'rafamadriz/friendly-snippets' },
    },
    config = function()
      require("prometheus.config.lsp")
      require("prometheus.config.cmp")
    end
  },
  {
    "laytan/cloak.nvim",
    config = function()
      require("prometheus.config.cloak")
    end
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("prometheus.config.nvim-tree")
    end
  },
  {
    "willothy/nvim-cokeline",
    dependencies = {
      "nvim-lua/plenary.nvim",           -- Required for v0.4.0+
      "kyazdani42/nvim-web-devicons",    -- If you want devicons
      "stevearc/resession.nvim"          -- Optional, for persistent history
    },
    config = function()
      require("prometheus.config.tabline")
    end
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}   -- this is equalent to setup({}) function
  },
  {
    "onsails/lspkind.nvim"
  },
  {
    "themercorp/themer.lua",
    config = function()
      require("prometheus.config.themer")
    end
  },
  {
    'numToStr/Comment.nvim',
    event = "BufEnter",
    config = function()
      require('Comment').setup()
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("prometheus.config.statusline")
    end
  },
  {
    'davidgranstrom/nvim-markdown-preview',
    config = function()
      require("prometheus.config.markdown-previewer")
    end
  },
  {
    'APZelos/blamer.nvim',
    config = function()
      require("prometheus.config.blamer")
    end
  }

})
