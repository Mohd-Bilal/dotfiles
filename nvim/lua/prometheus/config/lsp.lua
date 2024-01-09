local lsp = require('lsp-zero').preset({})

lsp.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = ''
})


lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({ buffer = bufnr })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    -- lua stuff
    "tsserver",
    "gopls",
    "bashls",
    "pylsp",
    "rust_analyzer",
    "vimls",
    "yamlls",
    "lua_ls"
  },
  handlers = {
    lsp.default_setup,
  },
})
