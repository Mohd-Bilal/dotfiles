local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.prettier.with {
    filetypes = { "html", "markdown", "css", "javascript", "javascriptreact", "typescript", "typescriptreact", "json" },
  },
  -- Lua
  b.formatting.stylua,
  b.formatting.gofmt,
  -- Shell
  b.formatting.shfmt,
  -- Rust
  b.formatting.rustfmt,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
