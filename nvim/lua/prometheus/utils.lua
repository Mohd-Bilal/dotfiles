local M = {}

M.termcodes = function(str)
   return vim.api.nvim_replace_termcodes(str, true, true, true)
end

M.merge_tb = vim.tbl_deep_extend

M.load_mappings = function(mappings)
   vim.schedule(function()
      local function set_section_map(section_values)
         section_values.plugin = nil

         for mode, mode_values in pairs(section_values) do
            local default_opts = M.merge_tb("force", { mode = mode }, {})
            for keybind, mapping_info in pairs(mode_values) do
               -- merge default + user opts
               local opts = M.merge_tb("force", default_opts, mapping_info.opts or {})

               mapping_info.opts, opts.mode = nil, nil
               opts.desc = mapping_info[2]

               vim.keymap.set(mode, keybind, mapping_info[1], opts)
            end
         end
      end

      for _, sect in pairs(mappings) do
         set_section_map(sect)
      end
   end)
end

return M
