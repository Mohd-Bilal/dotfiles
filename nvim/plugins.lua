-- We are just modifying lspconfig's packer definition table
-- Put this in your custom plugins section i.e M.plugins field
return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
    lazy = false,
  },
  {
    "williamboman/mason.nvim",
    opts = function()
      return require "custom.configs.mason"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require "custom.configs.null-ls"
    end,
    lazy = false,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      local override = require "custom.configs.telescope"
      return override
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      local override = require "custom.configs.treesitter"
      return override
    end,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require "custom.configs.comment"
    end,
    ft = { "tsx", "jsx" },
  },
  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewFileHistory",
      "DiffviewFocusFiles",
      "DiffviewLog",
      "DiffviewRefresh",
      "DiffviewToggleFiles",
    },
    config = function()
      require "custom.configs.diffview"
    end,
  },
  { "akinsho/toggleterm.nvim", version = "*", config = true, lazy = false },
  {
    "Pocco81/true-zen.nvim",
    config = function()
      require "custom.configs.truezen"
    end,
    cmd = { "TZNarrow", "TZFocus", "TZMinimalist", "TZAtaraxis" },
  },
  {
    "VonHeikemen/fine-cmdline.nvim",
    dependencies = { { "MunifTanjim/nui.nvim" } },
    lazy = false,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "custom.configs.dap"
    end,
    keys = { "<leader>db", "<leader>dc", "<leader>ds", "<leader>di", "<leader>da" },
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { { "mfussenegger/nvim-dap" } },
    config = function()
      require "custom.configs.dap-ui"
    end,
    keys = { "<leader>db", "<leader>dc", "<leader>ds", "<leader>di", "<leader>da" },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = function()
      local override = require "custom.configs.gitsigns"
      return override
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function()
      local override = require "custom.configs.todo-comments"
      return override
    end,
    event = { "BufEnter" },
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = function()
      local override = require "custom.configs.nvimtree"
      return override
    end,
  },
}
