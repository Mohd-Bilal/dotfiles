local merge_tb = vim.tbl_deep_extend
local default = require("plugins.configs.telescope")
local custom = {
  defaults = {
    cache_picker = {
      num_pickers = 40,
    },
  },
}
return merge_tb("force", default,custom)

