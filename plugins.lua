local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
      {
        'jose-elias-alvarez/typescript.nvim'
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- TODO: fixup alpha again
  -- Dashboard (start screen)
  -- {
  --   'goolord/alpha-nvim',
  --   dependencies = { 'kyazdani42/nvim-web-devicons' },
  -- },

  -- TODO: fixup symbols outline
  -- {
  --   'simrat39/symbols-outline.nvim',
  --   config = function()
  --     require('symbols-outline').setup {}
  --   end,
  -- },

  -- TODO: fixup illumination
  -- Highlight duplicates of active fragment
  -- { 'RRethy/vim-illuminate' },

  -- TODO: fixup copilot
  -- {
  --   'zbirenbaum/copilot.lua',
  --   cmd = 'Copilot',
  --   event = 'InsertEnter',
  --   config = function()
  --     require('copilot').setup {
  --       suggestion = { enabled = false },
  --       panel = { enabled = false },
  --     }
  --   end,
  -- },
  -- {
  --   -- 'github/copilot.vim'
  --   'zbirenbaum/copilot-cmp',
  --   dependencies = {
  --     'zbirenbaum/copilot.lua'
  --   },
  --   config = function()
  --     require("copilot_cmp").setup {}
  --   end,
  -- },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },
}

return plugins
