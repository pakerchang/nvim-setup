local setup, toggleterm = pcall(require, "toggleterm")
if not setup then
  return
end

toggleterm.setup({
  size = 20,
  open_mapping = [[<C-t><C-i>]],
  hide_numbers = true,
  direction = "horizontal", -- "horizontal" | "tab" | "float"
  insert_mappings = true,
  start_in_insert = true,
  close_on_exit = true,
  float_ops = {
    border = "curved",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
})
