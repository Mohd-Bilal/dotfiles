local cmp = require('cmp')
local cmp_action = require('lsp-zero.cmp').action()

require('luasnip.loaders.from_vscode').lazy_load()

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

local cmp_autopairs = require('nvim-autopairs.completion.cmp')


cmp.setup({
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    window = {
        completion = {
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
            col_offset = -3,
            side_padding = 0,
        },
    },

    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            vim_item.menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                luasnip = "[LuaSnip]",
                nvim_lua = "[Lua]",
                latex_symbols = "[LaTeX]",
            })[entry.source.name]
            local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 100 })(entry, vim_item)
            local strings = vim.split(kind.kind, "%s", { trimempty = true })
            kind.kind = " " .. (strings[1] or "") .. " "
            kind.menu = "    (" .. (strings[2] or "") .. ")"

            return kind
        end,
    },
    mapping = {
        -- confirm completion item
        ['<CR>'] = cmp.mapping.confirm({ select = false }),

        -- toggle completion menu
        ['<C-e>'] = cmp_action.toggle_completion(),

        -- tab complete
        ['<Tab>'] = cmp_action.tab_complete(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),

        -- navigate between snippet placeholder
        ['<C-d>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),

        -- scroll documention window
        ['<C-f>'] = cmp.mapping.scroll_docs(5),
        ['<C-u>'] = cmp.mapping.scroll_docs(-5),
    },
})

cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)
