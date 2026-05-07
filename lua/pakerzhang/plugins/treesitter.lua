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
vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
    if lang and pcall(vim.treesitter.language.add, lang) then
      vim.treesitter.start(args.buf, lang)
    end
  end,
})
