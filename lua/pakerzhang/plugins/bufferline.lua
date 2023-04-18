local status, bufferline = pcall(require, "bufferline")
if not status then
  return
end

vim.opt.termguicolors = true

bufferline.setup({
  options = {
    diagnostics = "nvim_lsp",
    mode = "tabs",
    separator_style = "slant",
    -- always_show_bufferline = true,
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    color_icons = true,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left",
      },
    },
  },
  highlights = {
    buffer_selected = {
      fg = "#fdf6e3",
      bold = true,
    },
  },
  -- highlights = {
  --   separator = {
  --     fg = "#073642",
  --     bg = "#002b36",
  --   },
  --   separator_selected = {
  --     fg = "#073642",
  --   },
  --   background = {
  --     fg = "#657b83",
  --     bg = "#002b36",
  --   },
  --   buffer_selected = {
  --     fg = "#fdf6e3",
  --     bold = true,
  --   },
  --   fill = {
  --     bg = "#073642",
  --   },
  -- },
})
