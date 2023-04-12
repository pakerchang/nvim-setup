-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

-- configure treesitter
treesitter.setup({
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
  },
  -- enable syntax highlighting
  highlight = { enable = true, disable = {} },
  -- rainbow = {
  --   enable = true,
  --   extended_mode = true,
  --   max_file_lines = 1000,
  -- },
  -- enable indentation
  indent = { enable = true, disable = {} },
  -- enable autotagging (w/ nvim-ts-autotag plugin)
  autotag = { enable = true },
  -- auto install above language parsers
  auto_install = true,
})
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript.jsx", "typescript.tsx" }
