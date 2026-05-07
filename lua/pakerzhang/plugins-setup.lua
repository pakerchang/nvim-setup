-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- colors theme
  { "ellisonleao/gruvbox.nvim" },
  { "rebelot/kanagawa.nvim" },
  { "joshdick/onedark.vim" },

  { "nvim-lua/plenary.nvim" },

  { "christoomey/vim-tmux-navigator" },
  { "szw/vim-maximizer" },

  -- essential
  { "tpope/vim-surround" },
  { "inkarkat/vim-ReplaceWithRegister" },

  -- file explorer
  { "nvim-tree/nvim-tree.lua" },

  -- icons
  { "nvim-tree/nvim-web-devicons" },

  -- statusline
  { "nvim-lualine/lualine.nvim" },

  -- fuzzy finding (fzf-lua: fzf binary backed, faster than telescope)
  { "ibhagwan/fzf-lua",                         dependencies = { "nvim-tree/nvim-web-devicons" } },

  -- autocompletion
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },

  -- copilot (lua port) + cmp source
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = { "zbirenbaum/copilot.lua" },
  },

  -- snippets
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
  { "rafamadriz/friendly-snippets" },

  -- mason: lsp / linter / formatter installer
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },

  -- lsp
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "nvimdev/lspsaga.nvim" },
  { "onsails/lspkind.nvim" },

  -- formatting & linting (none-ls = community fork of null-ls)
  { "nvimtools/none-ls.nvim" },
  { "nvimtools/none-ls-extras.nvim" }, -- eslint_d 等被拆出的 builtins
  { "jay-babu/mason-null-ls.nvim" },
  { "MunifTanjim/prettier.nvim" },

  -- treesitter (main branch — master archived)
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
  },
  { "HiPhish/rainbow-delimiters.nvim" },

  -- auto pairs / tags
  { "windwp/nvim-autopairs" },
  { "windwp/nvim-ts-autotag" },

  -- git
  { "lewis6991/gitsigns.nvim" },

  -- terminal
  { "akinsho/toggleterm.nvim" },

  -- bufferline
  { "akinsho/bufferline.nvim", version = "*", dependencies = { "nvim-tree/nvim-web-devicons" } },

  -- color highlight (catgoose fork, norcalli original is unmaintained)
  { "catgoose/nvim-colorizer.lua" },

  -- dashboard
  { "goolord/alpha-nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },

  -- markdown in-buffer rendering (replaces archived iamcco/markdown-preview.nvim)
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ft = { "markdown" },
  },
}, {
  ui = { border = "rounded" },
  install = { missing = true },
  checker = { enabled = false },          -- 不自動檢查更新
  change_detection = { enabled = false }, -- 不自動 reload on save
})
