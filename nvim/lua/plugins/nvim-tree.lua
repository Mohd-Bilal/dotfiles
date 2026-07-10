return {
  "nvim-tree/nvim-tree.lua",
  opts = {
    renderer = {
      root_folder_label = false,
    },
  },
  config = function(_, opts)
    require("nvim-tree").setup(opts)
  end,
  keys = {
    {
      "<leader>ef",
      function()
        require("nvim-tree.api").tree.open()
      end,
      desc = "Focus file tree"
    },
    {
      "<leader>et",
      function()
        require("nvim-tree.api").tree.toggle({
          path = "<args>",
          find_file = false,
          update_root = false,
          focus = true,
        })
      end,
      desc = "Toggle file tree"
    }
  },
  lazy = false
}
