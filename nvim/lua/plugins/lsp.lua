return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/nvim-cmp",
  },
  lazy = false,
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local servers = {
      lua_ls = {
        settings = {
          Lua = {
            format = {
              enable = true,
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
          },
        },
      },
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
            },
            check = {
              command = "clippy",
            },
          },
        },
      },

      gopls = {
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
              shadow = true,
            },
            staticcheck = true,
          },
        },
      },

      ocamllsp = {},
    }

    for name, config in pairs(servers) do
      config.capabilities = capabilities

      vim.lsp.config(name, config)
      vim.lsp.enable(name)
    end

    vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, {
      desc = "Format buffer",
    })
  end,
}
