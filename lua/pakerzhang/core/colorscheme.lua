local theme_gruvbox = "colorscheme gruvbox"
local theme_onedark = "colorscheme onedark"
local theme_onedark_vivid = "colorscheme onedark_vivid"

local status, _ = pcall(vim.cmd, theme_onedark_vivid)
if not status then
  print("Colorscheme not found!") -- print error if colorscheme not installed
  return
end
