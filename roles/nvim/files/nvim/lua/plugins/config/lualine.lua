local ok, lualine = pcall(require, "lualine")
if not ok then
  return
end

local theme = require("lualine.themes.nightfly")
local colors = {
  blue = "#65D1FF",
  green = "#3EFFDC",
  violet = "#FF61EF",
  yellow = "#FFDA7B",
  black = "#000000",
}

theme.normal.a.bg = colors.blue
theme.insert.a.bg = colors.green
theme.visual.a.bg = colors.violet
theme.command = {
  a = {
    gui = "bold",
    bg = colors.yellow,
    fg = colors.black,
  }
}

lualine.setup({
  options = {
    icons_enabled = true,
    theme = theme,
    component_separators = "|",
    section_separators = "",
  }
})
