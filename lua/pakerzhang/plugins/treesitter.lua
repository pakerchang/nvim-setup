-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

-- configure treesitter
treesitter.setup({
  -- enable syntax highlighting
  highlight = { enable = true },
  -- rainbow = {
  --   enable = true,
  --   extended_mode = true,
  --   max_file_lines = 1000,
  -- },
  -- enable indentation
  indent = { enable = true },
  -- enable autotagging (w/ nvim-ts-autotag plugin)
  autotag = { enable = true },
  -- ensure these language parsers are installed
  ensure_installed = {
    "json",
    "javascript",
    "typescript",
    "tsx",
    "vue",
    "yaml",
    "html",
    "css",
    "markdown",
    "graphql",
    "bash",
    "lua",
    "vim",
    "Dockerfile",
    "gitignore",
    "jsdoc",
  },
  -- auto install above language parsers
  auto_install = true,
})
