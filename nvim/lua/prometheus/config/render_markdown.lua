local render_markdown = require('render-markdown')

render_markdown.setup({
    enabled = true,
    heading = {
        position = 'inline',
        width = 'block',
        min_width = 30,
    },
    debounce = 100
})
