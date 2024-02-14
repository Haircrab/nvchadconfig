local M = {}

M.base_30 = {
  white = "#D9E0EE",
  darker_black = "#191828",
  black = "#1E1D2D", --  nvim bg
  black2 = "#252434",
  one_bg = "#2d2c3c", -- real bg of onedark
  -- context color
  one_bg2 = "#6c706d",
  one_bg3 = "#3e3d4d",
  grey = "#474656",
  grey_fg = "#4e4d5d",
  grey_fg2 = "#555464",
  light_grey = "#605f6f",
  red = "#F38BA8",
  -- red = "#a8326d",
  baby_pink = "#ffa5c3",
  pink = "#F5C2E7",
  -- backet matching line color
  line = "#383747", -- for lines like vertsplit
  green = "#ABE9B3",
  vibrant_green = "#b6f4be",
  nord_blue = "#8bc2f0",
  blue = "#89B4FA",
  yellow = "#FAE3B0",
  sun = "#ffe9b6",
  purple = "#d0a9e5",
  dark_purple = "#c7a0dc",
  teal = "#B5E8E0",
  orange = "#F8BD96",
  cyan = "#89DCEB",
  statusline_bg = "#232232",
  lightbg = "#2f2e3e",
  pmenu_bg = "#ABE9B3",
  folder_bg = "#89B4FA",
  lavender = "#c7d1ff",
}

M.base_16 = {
  base00 = "#1E1D2D",
  base01 = "#282737",
  -- select line color
  base02 = "#505866",
  base03 = "#383747",
  base04 = "#414050",
  base05 = "#bfc6d4",
  base06 = "#ccd3e1",
  base07 = "#D9E0EE",

  -- main color
  base08 = M.base_30.white,
  -- base08 = "#9cd1ff",
  -- this color
  base09 = "#F8BD96",
  -- keyword
  base0A = "#FAE3B0",
  -- base0A = "#F38BA8",
  -- string
  base0B = "#ABE9B3",
  -- class name color
  base0C = "#F38BA8",
  -- base0C = "#FAE3B0",
  -- function method color
  base0D = "#89B4FA",
  -- unknown
  base0E = "#89DDFF",
  -- base0E = "#CBA6F7",
  -- token color, e.g. brackets
  base0F = "#CBA6F7",
  -- base0F = "#F38BA8",
  -- base0F = "#9cd1ff",
}

M.polish_hl = {
  ["@constant"] = { fg = M.base_30.white },
  ["@variable"] = { fg = M.base_30.white },
  ["@variable.builtin"] = { fg = M.base_30.white },

  ["@operator"] = { fg = M.base_30.purple },
  ["@keyword"] = { fg = M.base_16.base0E },
  ["@keyword.operator"] = { fg = M.base_16.base0E },
  ["@keyword.forloop"] = { fg = M.base_16.base0E },
  Boolean = { fg = M.base_16.base0E },
  Number = { fg = "#F38BA8" },

  ["@field"] = { fg = M.base_30.teal },
  ["@field.key"] = { fg = M.base_30.teal },
  ["@property"] = { fg = M.base_30.teal },
  -- this color
  ["@type.builtin"] = { fg = "#CBA6F7" },
  ["@punctuation.bracket"] = { fg = M.base_30.orange },
  ["@parenthesis"] = { fg = "#7e57c2" },

  -- ["@error"] = { fg = "#F38BA8" },

  Comment = {
    -- bg = M.base_30.grey, -- or M.base_30.cyan
    italic = true,
  },
}

M.type = "dark"

return M
