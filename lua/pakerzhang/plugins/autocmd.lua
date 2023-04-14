local autocmdGroup = vim.api.nvim_create_augroup("autocmdGroup", {
  clear = true,
})

local autocmd = vim.api.nvim_create_autocmd

-- 透過 o 切入時不會因為切入位置是註解而自動增加 comment sign
autocmd("BufEnter", {
  group = autocmdGroup,
  pattern = "*",
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - "o" + "r"
  end,
})
