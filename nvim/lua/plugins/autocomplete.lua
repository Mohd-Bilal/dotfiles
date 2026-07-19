return {
  "saghen/blink.cmp",

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
      ghost_text = {
        enabled = true,
      },

      documentation = {
        auto_show = true,
        auto_show_delay_ms = 150,

        window = {
          border = "rounded",
          max_width = 80,
          max_height = 20,
        },
      },

      menu = {
        border = "rounded",
        scrollbar = true,

        min_width = 20,
        max_height = 10,

        draw = {
          padding = 1,

          columns = {
            { "kind_icon" },
            { "label", "label_description", gap = 1 },
            { "kind" },
            { "source_name" },
          },

          components = {
            label = {
              width = {
                fill = true,
                max = 60,
              },
            },

            label_description = {
              width = {
                max = 30,
              },
            },

            kind_icon = {
              text = function(ctx)
                local icons = {
                  Text = "󰉿",
                  Method = "󰆧",
                  Function = "󰊕",
                  Constructor = "",
                  Field = "󰜢",
                  Variable = "󰀫",
                  Class = "󰠱",
                  Interface = "",
                  Module = "󰏗",
                  Property = "󰜢",
                  Unit = "󰑭",
                  Value = "󰎠",
                  Enum = "",
                  Keyword = "󰌋",
                  Snippet = "",
                  Color = "󰏘",
                  File = "󰈙",
                  Reference = "󰈇",
                  Folder = "󰉋",
                  EnumMember = "",
                  Constant = "󰏿",
                  Struct = "󰙅",
                  Event = "",
                  Operator = "󰆕",
                  TypeParameter = "󰊄",
                }

                return icons[ctx.kind] or ""
              end,
            },
          },
        },
      },
    },

    signature = {
      enabled = true,

      window = {
        border = "rounded",
      },
    },
  },
}
