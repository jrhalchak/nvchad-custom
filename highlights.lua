-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = { italic = true },
  Conditional = { italic = true },
  Include = { italic = true },
  Keyword = { italic = true },
  Label = { italic = true },
  StorageClass = { italic = true },
  Statement = { italic = true },
  CursorLine = { bg="black2" },

  -- JS Specific
  jsFuncArgs = { bold=true },
  jsOperatorKeyword = { bold=true },
  -- Treesitter language specific vim regex
  javascriptIdentifier = { italic=true },
  -- HTML Specific
  htmlArg = { italic=true },
  htmlH1 = { bold=true },
  htmlH2 = { bold=true },
  htmlH3 = { bold=true },
  htmlH4 = { bold=true },
  htmlH5 = { bold=true },
  htmlH6 = { bold=true },

  htmlItalic = { italic=true },
  htmlBold = { bold=true },
  htmlBoldItalic = { bold=true , italic=true },

  DashboardFooter = { bold=true, italic=false },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
}

return M
