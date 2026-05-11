local setup, toggleterm = pcall(require, "toggleterm")
if not setup then
  return
end

toggleterm.setup({
  size = 20,
  open_mapping = [[<C-t><C-i>]],
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
  -- buffer-local <C-hjkl> for window navigation; scoped to toggleterm only
  -- so fzf-lua / other terminal buffers keep their own ctrl-hjkl bindings
  on_open = function(term)
    local opts = { buffer = term.bufnr, silent = true }
    vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], opts)
    vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], opts)
    vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)
    vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], opts)
  end,
})
