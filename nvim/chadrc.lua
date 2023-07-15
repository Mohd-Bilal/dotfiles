-- First read our docs (completely) then check the example_config repo

local M = {}

M.ui = {
  theme = "palenight",
  statusline = {
    theme = "vscode_colored", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "default",
    overriden_modules = nil,
  },
  telescope = {
    style = "bordered", -- borderless / bordered
  },

}

-- custom plugins
M.plugins = "custom.plugins"

-- custom key bindings
M.mappings = require "custom.mappings"

require "custom.configs.neovide"
require "custom.configs.options"

return M
