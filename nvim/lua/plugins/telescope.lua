return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    keys = {
	{
		"<leader>ff", require('telescope.builtin').find_files
	},
	{
		"<leader>fw", require('telescope.builtin').live_grep
	},
	{
		"<leader>fb", require('telescope.builtin').buffers
	}
    }
}

