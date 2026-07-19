return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,

  config = function()
    local function get_lualine_theme()
      local colorscheme = vim.g.colors_name or ""

      local aliases = {
        ["catppuccin-mocha"] = "catppuccin",
        ["catppuccin-latte"] = "catppuccin",
        ["catppuccin-frappe"] = "catppuccin",
        ["catppuccin-macchiato"] = "catppuccin",
        ["rose-pine-moon"] = "rose-pine",
        ["rose-pine-dawn"] = "rose-pine",
      }

      local theme_name = aliases[colorscheme] or colorscheme

      if theme_name ~= "" then
        local ok, theme = pcall(require, "lualine.themes." .. theme_name)

        if ok then
          return theme
        end
      end

      if vim.o.background == "dark" then
        return {
          normal = {
            a = { bg = "#89b4fa", fg = "#1e1e2e", gui = "bold" },
            b = { bg = "#313244", fg = "#cdd6f4" },
            c = { bg = "#181825", fg = "#cdd6f4" },
          },
        }
      else
        return {
          normal = {
            a = { bg = "#1e66f5", fg = "#eff1f5", gui = "bold" },
            b = { bg = "#ccd0da", fg = "#4c4f69" },
            c = { bg = "#eff1f5", fg = "#4c4f69" },
          },
        }
      end
    end

    local theme = get_lualine_theme()

    theme = vim.tbl_deep_extend("force", theme, {
      normal = {
        a = {
          bg = "#c4a7e7",
          fg = "#191724",
          gui = "bold",
        },
      },

      insert = {
        a = {
          bg = "#9ccfd8",
          fg = "#191724",
          gui = "bold",
        },
      },

      visual = {
        a = {
          bg = "#ebbcba",
          fg = "#191724",
          gui = "bold",
        },
      },

      replace = {
        a = {
          bg = "#eb6f92",
          fg = "#191724",
          gui = "bold",
        },
      },
    })

    require("lualine").setup({
      options = {
        theme = theme,
        globalstatus = true,

        component_separators = {
          left = "│",
          right = "│",
        },

        section_separators = {
          left = "",
          right = "",
        },
      },

      sections = {
        lualine_a = {
          {
            "mode",
            separator = { right = "" },
          },
        },

        lualine_b = {
          "branch",
          {
            "diagnostics",
            symbols = {
              error = " ",
              warn = " ",
              info = " ",
              hint = "󰌶 ",
            },
          },
        },

        lualine_c = {
          {
            "filename",
            path = 1,
            cond = function()
              return vim.fn.expand("%:t") ~= ""
            end,
          },
        },

        lualine_x = {
          "filetype",
        },

        lualine_y = {
          "progress",
        },

        lualine_z = {
          "location",
        },
      },
    })

    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        local new_theme = get_lualine_theme()

        new_theme = vim.tbl_deep_extend("force", new_theme, {
          normal = {
            a = {
              bg = "#c4a7e7",
              fg = "#191724",
              gui = "bold",
            },
          },
        })

        require("lualine").setup({
          options = {
            theme = new_theme,
          },
        })
      end,
    })
  end,
}
