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
    always_show_bufferline = true,
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
      -- fg = "#fdf6e3",
      bold = true,
      italic = true,
    },
  },
})

vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", {})
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {})
