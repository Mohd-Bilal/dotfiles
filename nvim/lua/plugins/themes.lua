return {
	{ 
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		init = function()
			vim.cmd.colorscheme "catppuccin"
		end

	}
}
