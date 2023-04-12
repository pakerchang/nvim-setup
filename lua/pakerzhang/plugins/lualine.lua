-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
  return
end

-- get lualine nightfly theme
-- local lualine_theme = require("lualine.themes.nightfly")
local lualine_theme = require("lualine.themes.onedark")

-- new colors for theme
local new_colors = {
  blue = "#61AFEF",
  green = "#98C379",
  violet = "#C678DD",
  yellow = "#E5C07B",
  black = "#282C34",
  red = "#E06C75",
}

-- change nightlfy theme colors
lualine_theme.normal.a.bg = new_colors.blue
lualine_theme.insert.a.bg = new_colors.green
lualine_theme.visual.a.bg = new_colors.violet
lualine_theme.replace.a.bg = new_colors.red
lualine_theme.command = {
  a = {
    gui = "bold",
    bg = new_colors.yellow,
    fg = new_colors.black,
  },
}

-- configure lualine with modified theme
lualine.setup({
  options = {
    icons_enabled = true,
    theme = lualine_theme,
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
    disabled_filetypes = {},
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = {
      {
        "filename",
        file_status = true, -- displays file status (readonly status, modified status)
        path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
      },
    },
    lualine_x = {
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = { error = " ", warn = " ", info = " ", hint = " " },
      },
      "encoding",
      "filetype",
    },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      {
        "filename",
        file_status = true, -- displays file status (readonly status, modified status)
        path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
      },
    },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = { "fugitive" },
})
