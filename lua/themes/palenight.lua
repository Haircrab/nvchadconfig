-- Credits to original theme for existing https://github.com/whizkydee/vscode-palenight-theme
-- this is a modified version of it

local M = {}

M.base_30 = {
  white = "#D9E0EE", -- custom
  darker_black = "#232738",
  black = "#292D3E", --  nvim bg
  black2 = "#2f3344",
  one_bg = "#333748",
  one_bg2 = "#3c4051",
  one_bg3 = "#444859",
  grey = "#515566",
  grey_fg = "#5b5f70",
  grey_fg2 = "#65697a",
  light_grey = "#6d7182",
  red = "#f07178",
  baby_pink = "#606475",
  pink = "#ff5370", -- base16
  line = "#3f4354", -- for lines like vertsplit
  green = "#c3e88d", --base16
  vibrant_green = "#96e88d", -- custom
  nord_blue = "#8fb7ff",
  blue = "#82aaff", -- base16
  yellow = "#ffcb6b", -- base16
  sun = "#ffd373",
  purple = "#c792ea", -- base16
  dark_purple = "#b383d2", --custom
  teal = "#89ffe6", -- custom
  orange = "#ffa282", -- base16
  cyan = "#89ddff", -- base16
  statusline_bg = "#2d3142",
  lightbg = "#3c4051",
  pmenu_bg = "#82aaff", -- custom
  folder_bg = "#82aaff",
  lavender = "#c7d1ff",
}

M.base_16 = {
  base00 = "#292d3e",
  base01 = "#444267",
  base02 = "#32374d", -- select line color
  base03 = "#676e95",
  base04 = "#8796b0",
  base05 = "#d3d3d3", -- Variable, Operator
  base06 = "#efefef",
  base07 = "#ffffff",
  base08 = "#d3d3d3", -- Character, Constant, Identifier, Statement + main color
  base09 = "#ffa282", -- Boolean, Float, Number
  base0A = "#f07178", -- Type, TypeDef, Tag, Label, PreProc, Repeat, StorageClass + html tag
  base0B = "#c3e88d", -- String
  base0C = "#ffcb6b", --  Special + jsx component
  base0D = "#82aaff", -- Function, Include
  base0E = "#c792ea", -- Structure, Conditional, Define, Keyword
  base0F = "#CBA6F7", --  Brackets, Delimiter, SpecialChar
}

M.polish_hl = {
  ["@variable"] = { fg = M.base_30.lavender },

  ["@keyword"] = { fg = M.base_30.cyan },
  Repeat = { fg = M.base_30.cyan },
  Operator = { fg = M.base_30.cyan },
  ["@operator"] = { fg = M.base_30.cyan },

  ["@property"] = { fg = M.base_16.base04 },
  ["@type.builtin"] = { fg = M.base_30.purple },
  Typedef = { fg = M.base_30.yellow },
  Type = { fg = M.base_30.yellow },
  Structure = { fg = M.base_30.yellow },

  ["@punctuation.bracket"] = { fg = M.base_30.cyan },
  -- ["@parenthesis"] = { fg = M.base_30.dark_purple },

  Comment = {
    italic = true,
  },
}

M.type = "dark"

-- M = require("base46").override_theme(M, "palenight")

return M
