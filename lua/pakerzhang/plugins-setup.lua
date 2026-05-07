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

  -- treesitter-aware commentstring（Nvim 0.10+ 內建 gc 在 Vue/JSX 嵌入語言會用錯註解，這個 plugin 補回 context_commentstring 行為）
  -- folke/ts-comments.nvim 是 nvim-ts-context-commentstring 作者推薦的 0.10+ 繼任者
  -- vue 預設只給 <!-- -->，要靠下面 spec 指明：在 <script> 用 //、在 <style> 用 /* */
  -- jsx/tsx 已在 ts-comments 內建支援
  {
    "folke/ts-comments.nvim",
    event = "VeryLazy",
    opts = {
      lang = {
        vue = {
          "<!-- %s -->",
          script_element = "// %s",
          style_element = "/* %s */",
        },
      },
    },
  },

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

  -- minimap (vscode-style; built-in git diff / diagnostic / treesitter highlight)
  -- layout=split：獨立側邊 split，不會像 float 蓋住 main buffer
  -- auto_enable=false：啟動時不自動開，由 <leader>mt toggle
  {
    "Isrothy/neominimap.nvim",
    version = "v3.*.*",
    lazy = false,
    init = function()
      vim.g.neominimap = {
        auto_enable = false,
        layout = "split",
        split = {
          minimap_width = 16,
          direction = "right",
          fix_width = true,
        },
      }
    end,
  },
}, {
  ui = { border = "rounded" },
  install = { missing = true },
  checker = { enabled = false },          -- 不自動檢查更新
  change_detection = { enabled = false }, -- 不自動 reload on save
})
