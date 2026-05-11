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
  -- list nav 走 fzf default (ctrl-j/k); 額外保留 alt-j/k 做備援
  -- 不綁 ctrl-h/l：ctrl-h 在 macOS terminal 等同 backspace、ctrl-l 是 fzf 清 query 的預設，避免衝突
  keymap = {
    fzf = {
      ["alt-k"] = "up",                 -- 上一筆 (list, 備援；主要用 ctrl-k)
      ["alt-j"] = "down",               -- 下一筆 (list, 備援；主要用 ctrl-j)
      ["ctrl-q"] = "select-all+accept", -- 全選送 quickfix
    },
    builtin = {
      ["<M-k>"] = "preview-page-up",   -- preview page (builtin previewer)
      ["<M-j>"] = "preview-page-down",
    },
  },
})
