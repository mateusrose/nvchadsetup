-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "nightfox",
  changed_themes = {
    nightfox = {
      base_30 = {
        red = "#c94f6d",
        baby_pink = "#e26886",
        pink = "#d85e7c",
        line = "#2a3441",
        green = "#8ebaa4",
        vibrant_green = "#6ad4d6",
        blue = "#fe9373",
        nord_blue = "#fe9373",
        yellow = "#dbc074",
        sun = "#e0c989",
        purple = "#baa1e2",
        dark_purple = "#9d79d6",
        teal = "#5cc6c8",
        orange = "#fe9373",
        cyan = "#8be5e7",
        statusline_bg = "#202a37",
        lightbg = "#313b48",
        pmenu_bg = "#719cd6",
        folder_bg = "#fe9373",
      },
      base_16 = {
        base05 = "#d3c6aa",
        base06 = "#ddd0b4",
        base07 = "#e7dabe",
        base08 = "#7fbbb3",
        base09 = "#e69875",
        base0A = "#d3c6aa",
        base0B = "#a7c080",
        base0C = "#e67e80",
        base0D = "#e67e80",
        base0E = "#e69875",
        base0F = "#d699b6",
      },
    }
  },
}

return M
