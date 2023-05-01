-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

-- configure treesitter
treesitter.setup({
  -- ensure these language parsers are installed
  ensure_installed = "all",
  -- enable syntax highlighting
  highlight = {
    enable = true,
    disable = { "vue" },
  },
  -- enable indentation
  indent = {
    enable = false,
  },
  context_commentstring = {
    enable = true,
  },
  -- enable autotagging (w/ nvim-ts-autotag plugin)
  autotag = {
    enable = true,
  },
  -- auto ihstall above language parsers
  sync_install = false,
  auto_install = true,
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "javascript.jsx", "typescript.tsx" }
