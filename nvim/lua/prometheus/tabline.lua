local is_picking_focus = require('cokeline.mappings').is_picking_focus
local is_picking_close = require('cokeline.mappings').is_picking_close

local get_hex = require('cokeline.hlgroups').get_hl_attr

local bg = get_hex('Normal', 'bg')
local fg = get_hex('Normal', 'fg')

require('cokeline').setup({
  default_hl = {
    fg = fg,
    bg = bg
  },
  sidebar = {
    filetype = { 'NvimTree' },
    components = {
      {
        text = function(_)
          return ""
        end,
        fg = fg,
        bg = bg,
        bold = true,
      },
    }
  },

  components = {
    {
      text = function(buffer) return (buffer.index ~= 1) and '▏' or '' end,
    },
    {
      text = '  ',
    },
    {
      text = function(buffer)
        return
            (is_picking_focus() or is_picking_close())
            and buffer.pick_letter .. ' '
            or buffer.devicon.icon
      end,
      fg = function(buffer)
        return
            (is_picking_focus() and fg)
            or (is_picking_close() and bg)
            or buffer.devicon.color
      end,
      italic = function()
        return
            (is_picking_focus() or is_picking_close())
      end,
      bold = function()
        return
            (is_picking_focus() or is_picking_close())
      end
    },
    {
      text = ' ',
    },
    {
      text = function(buffer) return buffer.filename .. '  ' end,
      bold = function(buffer)
        return buffer.is_focused
      end,
    },
    {
      text = '',
      on_click = function(_, _, _, _, buffer)
        buffer:delete()
      end,
    },
    {
      text = '  ',
    },
  },
})
