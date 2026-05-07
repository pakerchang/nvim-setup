-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

-- configure treesitter
treesitter.setup({
  -- enable syntax highlighting
  highlight = {
    enable = true,
  },
  -- enable indentation
  indent = {
    enable = false,
  },
  -- 常用語言：啟動時就確保已裝
  ensure_installed = {
    "lua", "vim", "vimdoc", "query",
    "javascript", "typescript", "tsx",
    "html", "css", "json", "yaml", "toml",
    "vue", "markdown", "markdown_inline",
    "bash", "dockerfile",
    "gitignore", "gitcommit",
  },
  -- 偶爾編輯的語言：開檔時自動補裝該 parser
  auto_install = true,
})
