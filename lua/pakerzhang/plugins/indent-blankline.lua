local status, blankline = pcall(require, "indent_blankline")
if not status then
  return
end

blankline.setup({
  space_char_blankline = " ",
  use_treesitter = true,
  show_current_context = true,
  show_current_context_start = true,

  filetype_exclude = {
    "terminal",
    "log",
    "markdown",
    "toggleterm",
    "dashboard",
    "lspinfo",
    "text",
    "NvimTree",
  },
  buftype_exclude = {
    "terminal",
    "nofile",
  },
})
