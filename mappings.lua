-- TODO: Figure out the following
-- <leader>th would be cool for terminal horizontal, but it's currently used for switching splits to horizontal, but the DEFAULT is to open the theme manager
-- -- This would need a change to <leader>tk which swaps splits to a vertical orientation
-- I'm used to pressing <leader>h for hide, but that creates a NEW horizontal terminal
-- I'm used to pressing <leader>h for hide, but that creates a NEW horizontal terminal

---@type MappingsTable
local M = {}

-- TODO: add symbols outline keymaps when plugin is added
-- TODO: add copilot keymaps when plugin is added

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>q"] = { ":q<CR>", "close window", opts = { nowait = true } },

    -- Swap split locations
    ["<leader>tk"] = { "<C-w>t<C-w>K", "swap split layout (stack)", opts = { nowait = true } },
    ["<leader>th"] = { "<C-w>t<C-w>H", "swap split layout (vertical)", opts = { nowait = true } },

    -- Line movements
    ['∆'] = { ':m .+1<CR>==', 'move line up', opts = { nowait = true }},
    ['˚'] = { ':m .-2<CR>==', 'move line down', opts = { nowait = true }},

    -- Signature help
    ["<leader>lt"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "lsp type_definition",
    },

    -- Resize windows/splits
    ['<leader>Up'] = {
      ':resize -2<CR>',
      'resize vertical (+)',
      opts = { nowait = true },
    },
    ['<leader>Down'] = {
      ':resize +2<CR>',
      'resize vertical (-)',
      opts = { nowait = true },
    },
    ['<leader>Left'] = {
      ':vertical resize -2<CR>',
      'resize horizontal (+)',
      opts = { nowait = true },
    },
    ['<leader>Right'] = {
      ':vertical resize +2<CR>',
      'resize horizontal (-)',
      opts = { nowait = true },
    },

    -- Tab switching
    ["Ó"] = {
      ':tabn<CR>',
      "goto next tab",
      opts = { nowait = true },
    },
    ["Ò"] = {
      ':tabp<CR>',
      "goto prev tab",
      opts = { nowait = true },
    },

    -- Diffing / syncing
    ['<leader>wv'] = {
      ':set scb<CR>',
      'mark current buffer for syncing view',
      opts = { nowait = true },
    },
    ['<leader>wd'] = {
      ':diffthis<CR>',
      'mark current buffer for diffing',
      opts = { nowait = true },
    },
  },

  v = {
    -- Yanks & Pastes
    ['Y'] = {
      'y$',
      'yank from the cursor to the end of the line',
      opts = { nowait = true },
    },
    ['p'] = {
      '"_dP',
      'better paste',
      opts = { nowait = true },
    },

    -- Line movements
    ['∆'] = { ":m '>+1<CR>gv=gv", 'move line up', opts = { nowait = true }},
    ['˚'] = { ":m '<-2<CR>gv=gv", 'move line down', opts = { nowait = true }},

    -- Indents
    ['<'] = {
      '<gv',
      'keep selection to allow multiple de-indents',
      opts = { nowait = true },
    },
    ['>'] = {
      '>gv',
      'keep selection to allow multiple indents',
      opts = { nowait = true },
    },
  },

  i = {
    -- Line movements
    ['∆'] = { '<Esc>:m .+1<CR>==gi', 'move line up', opts = { nowait = true }},
    ['˚'] = { '<Esc>:m .-2<CR>==gi', 'move line down', opts = { nowait = true }},
  },
}

M.lspconfig = {
  n = {
    ["<leader>dl"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "diagnostic setloclist",
    },
  }
}

M.tabufline = {
  plugin = true,

  n = {
    -- Switch buffers
    ["<S-l>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "goto next buffer",
    },
    ["<S-h>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
      end,
      "goto prev buffer",
    },
  }
}

M.telescope = {
  plugin = true,

  -- Remap grep for familiarity convenience
  n = {
    ["<leader>fg"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
  },

  -- History
  -- i = {
  --   ["<Down>"] =  {
  --     "<cmd> Telescope cycle_history_next <CR>",
  --     "cycle to next history",
  --   },
  --   ["<Up>"] = {
  --     "<cmd> Telescope cycle_history_prev <CR>",
  --     "cycle to previous history",
  --   },
  --   ["<C-j>"] = {
  --     "<cmd> Telescope move_selection_next <CR>",
  --     "move to next selection",
  --   },
  --   ["<C-k>"] = {
  --     "<cmd> Telescope move_selection_previous <CR>",
  --     "move to previous selection",
  --   },
  -- },
}

M.nvterm = {
  plugin = true,

  t = {
    -- toggle in terminal mode
    ["ƒ"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },

    ["˙"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "toggle horizontal term",
    },

    ["√"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "toggle vertical term",
    },
  },

  n = {
    -- toggle in normal mode
    ["ƒ"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },

    ["˙"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "toggle horizontal term",
    },

    ["√"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "toggle vertical term",
    },
  },
}

-- more keybinds!
return M
