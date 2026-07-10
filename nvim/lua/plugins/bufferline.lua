return {
  "akinsho/bufferline.nvim",

  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  opts = {
    options = {
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "center",
          separator = true,
        },
      },
    },
  },

  config = function(_, opts)
    require("bufferline").setup(opts)

    vim.keymap.set("n", "<leader>tx", "<cmd>BufferLinePickClose<CR>", {
      desc = "Close buffer",
    })

    vim.keymap.set("n", "<leader>tn", "<cmd>BufferLineCycleNext<CR>", {
      desc = "Next buffer",
    })

    vim.keymap.set("n", "<leader>tb", "<cmd>BufferLineCyclePrev<CR>", {
      desc = "Previous buffer",
    })
  end,
}
