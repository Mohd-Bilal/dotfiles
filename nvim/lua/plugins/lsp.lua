return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "saghen/blink.cmp",
  },
  lazy = false,

  config = function()
    local capabilities = require("blink.cmp").get_lsp_capabilities()

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

      ocamllsp = {
        cmd = { "ocamllsp" },
        filetypes = {
          "ocaml",
          "ocaml.interface",
          "ocaml.menhir",
          "ocaml.ocamllex",
          "dune",
          "reason",
        },
        root_markers = {
          "dune-project",
          "dune-workspace",
          "*.opam",
          ".git",
        },
      },
    }

    for name, config in pairs(servers) do
      config.capabilities = capabilities

      vim.lsp.config(name, config)
      vim.lsp.enable(name)
    end

    -- Format
    vim.keymap.set("n", "<leader>fm", function()
      vim.lsp.buf.format()
    end, {
      desc = "Format buffer",
    })

    -- Diagnostics
    vim.keymap.set("n", "<leader>q", function()
      vim.diagnostic.setqflist()
      vim.cmd("copen")
    end, {
      desc = "Open diagnostics quickfix list",
    })
      -- LSP navigation
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
      desc = "Go to definition",
    })

    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {
      desc = "Go to declaration",
    })

    vim.keymap.set("n", "gr", vim.lsp.buf.references, {
      desc = "Find references",
    })

    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {
      desc = "Go to implementation",
    })

    vim.keymap.set("n", "K", vim.lsp.buf.hover, {
      desc = "Hover documentation",
    })

    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {
      desc = "Rename symbol",
    })
  end,
}
