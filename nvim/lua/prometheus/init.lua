require("prometheus.set")
require("prometheus.lazy")
require("prometheus.neovide")
require("prometheus.autocmds")

local utils = require("prometheus.utils")
local mappings = require("prometheus.remap")
utils.load_mappings(mappings)
