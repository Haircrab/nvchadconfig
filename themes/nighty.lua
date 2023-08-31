local M = {}

M.base_30 = {
  white = "#D9E0EE",
  darker_black = "#191828",
  black = "#1E1D2D", --  nvim bg
  black2 = "#252434",
  one_bg = "#2d2c3c", -- real bg of onedark
  -- context color

  one_bg2 = "#6c706d",
  -- one_bg2 = "#363545",
  one_bg3 = "#3e3d4d",
  grey = "#474656",
  grey_fg = "#4e4d5d",
  grey_fg2 = "#555464",
  light_grey = "#605f6f",
  red = "#F38BA8",
  baby_pink = "#ffa5c3",
  pink = "#F5C2E7",
  -- backet matching line color
  -- line = "#6c706d",
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
  -- base02 = "#2f2e3e",
  base03 = "#383747",
  base04 = "#414050",
  base05 = "#bfc6d4",
  base06 = "#ccd3e1",
  base07 = "#D9E0EE",

  -- main color
  base08 = "#70A5EB",
  -- base08 = "#F38BA8",

  -- this color
  -- base09 = "#f3ac8c",
  base09 = "#F8BD96",

  base0A = "#FAE3B0",
  base0B = "#ABE9B3",

  -- class name color
  base0C = "#F38BA8",
  -- base0C = "#89DCEB",

  -- function method color
  base0D = "#F38BA8",
  -- base0D = "#89B4FA",
  --
  base0E = "#CBA6F7",
  -- token color
  base0F = "#9cd1ff",
  -- base0F = "#F38BA8",
}

M.polish_hl = {
  ["@constant"] = {
    fg = "#ecd3a0",
  },
  -- ["@kariable"] = { fg = "#c7d1ff" },
  -- ["@property"] = { fg = "#B5E8E0" },
  -- this color
  ["@variable.builtin"] = { fg = "#f3ac8c" },
}

M.type = "dark"

return M
