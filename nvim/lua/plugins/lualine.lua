return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    config = function()
	   auto = require("lualine.themes.auto")
	   local theme = vim.tbl_deep_extend("force", auto, {
		  normal = {
		    a = {
		      bg = "#FFFFFF",
		      fg = "#3b3c36"
		    },
		  },
	   })

	   opts = {
		  options = {
		    globalstatus = true,
		    component_separators = { left = "│", right = "│" },
		    section_separators = "",
		    theme = theme
		  },

		  sections = {
		    lualine_a = { 
			{
			   "mode",
			   separator = { right = "" }
			}
		    },
		    lualine_b = { "branch", "diagnostics" },
		    lualine_c = {
		      {
			"filename",
			path = 1,
		      },
		    },
		    lualine_x = { "filetype" },
		    lualine_y = { "progress" },
		    lualine_z = { "location" },
		  },
	   }
	   require("lualine").setup(opts)
   end
}
