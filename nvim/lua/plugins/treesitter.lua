return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
	  require('nvim-treesitter').install { 'lua', 'go', 'typescript', 'ocaml' }
  end
}
