local lsp = require('lsp-zero').preset({})

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


lsp.set_preferences({
    suggest_lsp_servers = true,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})


lsp.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp.default_keymaps({ buffer = bufnr })
end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})


lsp.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = ''
})

vim.diagnostic.config({
    virtual_text = false,
    severity_sort = true,
    float = {
        style = 'minimal',
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})
