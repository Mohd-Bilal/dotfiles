return {
  "saghen/blink.cmp",
  version = "2.*",

  dependencies = {
    "saghen/blink.lib",
    "rafamadriz/friendly-snippets",
  },

  build = function()
    require("blink.cmp").build():pwait()
  end,

  opts = {
    keymap = {
      preset = "none",

      ["<C-Space>"] = {
        "show",
        "show_documentation",
      },

      ["<CR>"] = {
        "accept",
        "fallback",
      },

      ["<Tab>"] = {
        "select_next",
        "snippet_forward",
        "fallback",
      },

      ["<S-Tab>"] = {
        "select_prev",
        "snippet_backward",
        "fallback",
      },
    },
    sources = {
      default = {
        "lsp",
        "path",
        "snippets",
        "buffer",
      },
    },

    completion = {
      documentation = {
        auto_show = true,
      },

      menu = {
        border = "rounded",
      },
    },

    signature = {
      enabled = true,
    },
  },
}
