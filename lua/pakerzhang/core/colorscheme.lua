local theme_gruvbox = "colorscheme gruvbox"
local theme_kanagawa = "colorscheme kanagawa-wave"
local theme_kanagawa_d = "colorscheme kanagawa-dragon"
local theme_onedark = "colorscheme onedark"

local status, _ = pcall(vim.cmd, theme_kanagawa)
if not status then
  print("Colorscheme not found!") -- print error if colorscheme not installed
  return
end
