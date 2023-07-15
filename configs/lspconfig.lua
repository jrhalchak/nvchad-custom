local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local ts_status_ok, typescript = pcall(require, 'typescript')
if not ts_status_ok then
  return
end

-- local path = lspconfig.util.path
-- local function get_python_path(workspace)
--   -- Use activated virtualenv.
--   if vim.env.VIRTUAL_ENV then
--     return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
--   end
--
--   -- Find and use virtualenv in workspace directory.
--   for _, pattern in ipairs({'*', '.*'}) do
--     local match = vim.fn.glob(path.join(workspace, pattern, 'pyvenv.cfg'))
--     if match ~= '' then
--       return path.join(path.dirname(match), 'bin', 'python')
--     end
--   end
--
--   -- Fallback to system Python.
--   return exepath('python3') or exepath('python') or 'python'
-- end

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "lua_ls", "clangd", "pyright", "typescript" --[[ custom ]] }

-- Define `root_dir` when needed
-- See: https://github.com/neovim/nvim-lspconfig/issues/320
-- This is a workaround, maybe not work with some servers.
-- local root_dir = function()
--   return vim.fn.getcwd()
-- end

local config_base = {
  on_attach = on_attach,
  capabilities = capabilities,
}

local extend_config = function(config)
  local merged_config = {}
  for k,v in pairs(config_base) do merged_config[k] = v end
  for k,v in pairs(config) do merged_config[k] = v end
  return merged_config
end

for _, lsp in ipairs(servers) do
  if lsp == 'lua_ls' then
    lspconfig[lsp].setup(
      extend_config({
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT',
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = {'vim'},
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Don't send telemetry data containing a randomized but unique id
            telemetry = {
              enable = false,
            },
          }
        }
      })
    )
  elseif lsp == 'pyright' then
    lspconfig[lsp].setup {
      -- before_init = function(_, config)
      --   config.settings.python.pythonPath = get_python_path(config.root_dir)
      -- end,
      on_attach = on_attach,
      capabilities = capabilities,
    }
  elseif lsp == 'typescript' then
    typescript.setup(extend_config({
      disable_commands = false, -- prevent the plugin from creating Vim commands
      debug = true, -- enable debug logging for commands
      go_to_source_definition = {
        fallback = false, -- fall back to standard LSP definition on failure
      },
      server = extend_config({ -- pass options to lspconfig's setup method
        init_options = {
          plugins = {
            {
              name = 'ts-lit-plugin',
              location = '/Users/jonathan.halchack/.nvm/versions/node/v18.14.2/lib/node_modules/ts-lit-plugin/'
            },
            {
              name = 'typescript-lit-html-plugin',
              location = '/Users/jonathan.halchack/.nvm/versions/node/v18.14.2/lib/node_modules/typescript-lit-html-plugin/'
            },
          },
        },
      }),
    }))
  else
    lspconfig[lsp].setup(config_base)
  end
end




--
-- lspconfig.pyright.setup { blabla}
