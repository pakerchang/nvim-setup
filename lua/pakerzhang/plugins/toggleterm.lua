local setup, toggleterm = pcall(require, "toggleterm")
if not setup then
  return
end

toggleterm.setup({
  size = 20,
  open_mapping = [[<leader>ti]],
  hide_numbers = true,
  direction = "float", -- "horizontal" | "tab" | "float"
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

function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.buf_set_keymap(0, "t", "<ESC>", [[<C-\><C-n><C-\>]], opts)
  vim.api.buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
  vim.api.buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
  vim.api.buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
  vim.api.buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
  vim.api.buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end
