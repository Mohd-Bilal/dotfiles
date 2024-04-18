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

local plugins = {
  {
    'nvim-telescope/telescope.nvim',
    lazy = false,
    dependencies = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      require("prometheus.config.telescope")
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    config = function()
      require("prometheus.config.treesitter")
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
    config = function()
      require("prometheus.config.treesitter-context")
    end
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "j-hui/fidget.nvim",
    },
    event = "InsertEnter",
    config = function()
      require("prometheus.config.lsp")
    end
  },
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("prometheus.config.snippet")
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("prometheus.config.nvim-tree")
    end
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  {
    "themercorp/themer.lua",
    lazy = false,
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
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("prometheus.config.statusline")
    end
  },
  {
    'APZelos/blamer.nvim',
    config = function()
      require("prometheus.config.blamer")
    end
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    event = "BufEnter",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    config = function()
      require("prometheus.config.barbecue")
    end
  },
  {
    "folke/todo-comments.nvim",
    event = "BufEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  },
  {
    'nvim-java/nvim-java',
    module = false,
    dependencies = {
      'nvim-java/lua-async-await',
      'nvim-java/nvim-java-core',
      'nvim-java/nvim-java-test',
      'nvim-java/nvim-java-dap',
      'MunifTanjim/nui.nvim',
      'mfussenegger/nvim-dap',
      {
        'williamboman/mason.nvim',
        opts = {
          registries = {
            'github:nvim-java/mason-registry',
            'github:mason-org/mason-registry',
          },
        },
      }
    },
    event = "BufEnter *.java",
    config = function()
      require("prometheus.config.lsp-java")
    end
  },
  {
    "folke/trouble.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config       = function()
      require("prometheus.config.trouble")
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufEnter",
    config = function()
      require("prometheus.config.gitsigns")
    end
  }

}

local opts = {
  defaults = {
    lazy = true,                           -- should plugins be lazy-loaded?
  }
}

require("lazy").setup(plugins, opts)
