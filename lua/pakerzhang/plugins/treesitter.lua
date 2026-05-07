-- nvim-treesitter main branch (master archived)
-- 主要差別：不再 setup({ highlight = ... })，要在 FileType autocmd 啟用
local ok, ts = pcall(require, "nvim-treesitter")
if not ok then
  return
end

ts.setup({
  install_dir = vim.fn.stdpath("data") .. "/site",
})

-- 確保常用 parser 已安裝（async；首次啟動會在背景下載並編譯）
ts.install({
  "lua", "vim", "vimdoc", "query",
  "javascript", "typescript", "tsx",
  "html", "css", "json", "yaml", "toml",
  "vue", "markdown", "markdown_inline",
  "bash", "dockerfile",
  "gitignore", "gitcommit",
})

-- highlight：filetype 有對應 parser 才啟用，避免無 parser 時噴錯
-- group + clear=true：避免 <leader>R reload 累積舊 autocmd（舊版若沒包 pcall 會殘留）
-- pcall 包住 start：lazy_backdrop / alpha 等特殊 buffer 在 set filetype 時 parser 還拿不到 → 吞掉不影響啟動
local ts_group = vim.api.nvim_create_augroup("UserTreesitterStart", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = ts_group,
  callback = function(args)
    if not vim.api.nvim_buf_is_valid(args.buf) then
      return
    end
    local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
    if lang and pcall(vim.treesitter.language.add, lang) then
      pcall(vim.treesitter.start, args.buf, lang)
    end
  end,
})
