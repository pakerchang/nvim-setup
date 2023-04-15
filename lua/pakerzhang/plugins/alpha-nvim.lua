-----------------------------------------------------------
-- Dashboard configuration file
-----------------------------------------------------------

-- Plugin: alpha-nvim
-- url: https://github.com/goolord/alpha-nvim

-- For configuration examples see: https://github.com/goolord/alpha-nvim/discussions/16

local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require("alpha.themes.dashboard")

-- align
local function align(str)
  local width = vim.api.nvim_win_get_width(0)
  local shift = math.floor(width / 2) - math.floor(string.len(str) / 2)
  return string.rep(" ", shift) .. str
end

-- Footer
local function footer()
  local version = vim.version()
  local print_version = "v" .. version.major .. "." .. version.minor .. "." .. version.patch
  local datetime = os.date("%Y/%m/%d %H:%M:%S")

  return print_version .. " " .. datetime
end

-- Banner
local banner = {
  "                                                    ",
  "                                                    ",
  "                                                    ",
  "                                                    ",
  "                                                    ",
  "                                                    ",
  "                                                    ",
  "                                                    ",
  "                                                    ",
  "                                                    ",

  " ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",

  " ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",

  " ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",

  " ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",

  " ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",

  " ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
  "                                                    ",
  "                                                    ",
  "                                                    ",
  "                                                    ",
}

dashboard.section.header.val = banner

-- Menu
dashboard.section.buttons.val = {
  dashboard.button("e", "  Open Explorer", ":NvimTreeToggle<CR>"),
  dashboard.button("f", "  Find file", "<cmd>Telescope find_files<cr>"),
  dashboard.button("s", "  Settings", ":e $MYVIMRC<CR>"),
  dashboard.button("u", "  Update plugins", ":PackerUpdate<CR>"),
  dashboard.button("q", "  Quit", ":qa<CR>"),
}

dashboard.section.footer.val = footer()

alpha.setup(dashboard.config)
