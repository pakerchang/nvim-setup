-- import fzf-lua safely
local ok, fzf = pcall(require, "fzf-lua")
if not ok then
  return
end

fzf.setup({
  -- find_files: 顯示 hidden、跳過慣用噪音目錄
  files = {
    fd_opts = [[--color=never --type f --hidden --follow ]]
        .. [[--exclude .git --exclude node_modules ]]
        .. [[--exclude public --exclude dist]],
  },
  -- live_grep / grep_string: 同樣忽略噪音
  grep = {
    rg_opts = [[--column --line-number --no-heading --color=always ]]
        .. [[--smart-case --max-columns=4096 ]]
        .. [[--glob=!node_modules --glob=!.git --glob=!public --glob=!dist]],
  },
  -- ctrl+hjkl 一致：list 走 j/k，preview 走 h/l
  keymap = {
    fzf = {
      ["ctrl-k"] = "up",                    -- 上一筆 (list)
      ["ctrl-j"] = "down",                  -- 下一筆 (list)
      ["ctrl-h"] = "preview-page-up",       -- preview 上一頁
      ["ctrl-l"] = "preview-page-down",     -- preview 下一頁
      ["ctrl-q"] = "select-all+accept",     -- 全選送 quickfix
    },
    builtin = {
      ["<C-k>"] = "preview-page-up",
      ["<C-j>"] = "preview-page-down",
      ["<C-h>"] = "preview-page-up",
      ["<C-l>"] = "preview-page-down",
    },
  },
})
