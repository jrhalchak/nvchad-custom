local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  -- b.formatting.deno_fmt, -- chose deno for ts/js files cuz its very fast!
  -- b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes
  b.formatting.prettier,

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- python formatting
  null_ls.builtins.formatting.ruff,
  null_ls.builtins.formatting.black,

  -- python diagnostics
  null_ls.builtins.diagnostics.ruff,

}

null_ls.setup {
  debug = true,
  sources = sources,
}
