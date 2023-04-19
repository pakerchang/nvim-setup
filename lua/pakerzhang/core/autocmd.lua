local autocmdGroup = vim.api.nvim_create_augroup("autocmdGroup", {
  clear = true,
})

local autocmd = vim.api.nvim_create_autocmd

local check_wrap = function()
  if not vim.opt.wrap:get() then
    vim.opt.wrap = true
  end
end

-- 透過 o 切入時不會因為切入位置是註解而自動增加 comment sign
autocmd("BufEnter", {
  group = autocmdGroup,
  pattern = "*",
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - "o" + "r"
    check_wrap()
  end,
})
