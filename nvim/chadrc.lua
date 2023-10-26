-- First read our docs (completely) then check the example_config repo

local M = {}

M.ui = {
	theme = "rosepine",
	statusline = {
		theme = "default", -- default/vscode/vscode_colored/minimal
		-- default/round/block/arrow separators work only for default statusline theme
		-- round and block will work for minimal theme only
		separator_style = "arrow",
		overriden_modules = function()
			return {
				LSP_Diagnostics = function()
					if not rawget(vim, "lsp") then
						return ""
					end

					local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
					local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
					local hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
					local info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })

					errors = (errors and errors > 0) and ("%#St_lspError#󰅚 " .. errors .. " ")
						or "%#St_lspError#󰅚 0 "
					warnings = (warnings and warnings > 0) and ("%#St_lspWarning# " .. warnings .. " ")
						or "%#St_lspWarning# 0 "
					hints = (hints and hints > 0) and ("%#St_lspHints#󰛩 " .. hints .. " ") or ""
					info = (info and info > 0) and ("%#St_lspInfo# " .. info .. " ") or ""

					return vim.o.columns > 140 and errors .. warnings .. hints .. info or ""
				end,
			}
		end,
	},
	telescope = {
		style = "bordered", -- borderless / bordered
	},
}

-- custom plugins
M.plugins = "custom.plugins"

-- custom key bindings
M.mappings = require("custom.mappings")

require("custom.configs.neovide")
require("custom.configs.options")
require("custom.configs.fold")

return M
