local autocmdGroup = vim.api.nvim_create_augroup("autocmdGroup", {
  clear = true,
})

local autocmd = vim.api.nvim_create_autocmd

local in_tmux = os.getenv("TMUX")

local check_wrap = function()
  if not vim.opt.wrap:get() then
    vim.opt.wrap = true
  end
end

local activeTmux = function()
  if not in_tmux then
    vim.loop.spawn("tmux", {
      args = { "new-session", "nvim" },
      detached = true,
    })
  else
    vim.loop.spawn("tmux", {
      args = { "split-window", "-h", "nvim" },
      detached = true,
    })
  end
end

-- 透過 o 切入時不會因為切入位置是註解而自動增加 comment sign
autocmd("BufEnter", {
  group = autocmdGroup,
  pattern = "*",
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - "o" + "r"
    check_wrap()
    -- activeTmux()
  end,
})
