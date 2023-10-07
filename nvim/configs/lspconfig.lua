-- custom.plugins.lspconfig
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local servers = { "gopls", "tsserver", "lua_ls", "rust_analyzer", "pyright", "html", "java_language_server" }
for _, lsp in ipairs(servers) do
	if lsp == "java_language_server" then
		lspconfig[lsp].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			cmd = { "zsh", "-c", "~/.local/share/nvim/mason/bin/java-language-server" },
		})
	else
		lspconfig[lsp].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end
end
