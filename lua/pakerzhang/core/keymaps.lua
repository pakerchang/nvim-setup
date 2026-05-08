--vset leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- Editor shortcuts
keymap.set("n", "<leader>qq", ":qa<CR>")
keymap.set("n", "<leader>wq", ":wq<CR>")

-- Leave terminal mode
keymap.set("t", "<C-i>", "<C-\\><C-n>")

-- Clear search highlights
keymap.set("n", "<leader>cl", ":nohl<CR>")

-- Delete single character without copying into register
keymap.set("n", "x", '"_x')

-- Increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sc", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>sr", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>se", ":close<CR>") -- close current split window

-- resize
keymap.set("n", "<C-t><C-l>", ":vertical resize -30<CR>")
keymap.set("n", "<C-t><C-r>", ":vertical resize +30<CR>")

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tT", ":tabnew | terminal<CR>") -- open new tab with terminal (claude code cli)
keymap.set("n", "<leader>te", ":tabclose<CR>") -- close current tab
keymap.set("n", "<Tab>", ":tabn<CR>") --  go to next tab
keymap.set("n", "<S-Tab>", ":tabp<CR>") --  go to previous tab

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- fzf-lua (file / grep / buffer pickers)
keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>")        -- find files (respects .gitignore)
keymap.set("n", "<leader>fg", "<cmd>FzfLua live_grep<cr>")    -- live grep
keymap.set("n", "<leader>fw", "<cmd>FzfLua grep_cword<cr>")   -- grep word under cursor
keymap.set("n", "<leader>fb", "<cmd>FzfLua buffers<cr>")      -- open buffers
keymap.set("n", "<leader>fh", "<cmd>FzfLua helptags<cr>")     -- help tags

-- fzf-lua git pickers
keymap.set("n", "<leader>gc", "<cmd>FzfLua git_commits<cr>")  -- repo commits (<cr> to checkout)
keymap.set("n", "<leader>gfc", "<cmd>FzfLua git_bcommits<cr>") -- buffer commits
keymap.set("n", "<leader>gb", "<cmd>FzfLua git_branches<cr>") -- branches (<cr> to checkout)
keymap.set("n", "<leader>gs", "<cmd>FzfLua git_status<cr>")   -- changed files w/ diff preview

-- Restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- Markdown in-buffer rendering toggle
keymap.set("n", "<leader>mp", ":RenderMarkdown toggle<CR>")

-- Minimap (neominimap) toggle
keymap.set("n", "<leader>mt", ":Neominimap Toggle<CR>") -- toggle global minimap
keymap.set("n", "<leader>mb", ":Neominimap BufToggle<CR>") -- toggle for current buffer
keymap.set("n", "<leader>mw", ":Neominimap WinToggle<CR>") -- toggle for current window

-- Open current file in macOS default app (SVG / PNG → Preview, PDF → Preview, html → browser)
keymap.set("n", "<leader>P", function()
  vim.fn.system({ "open", vim.fn.expand("%:p") })
end, { desc = "Preview file in macOS default app" })

-- nvim-jqx (JSON / YAML structural browse — sprite atlas, manifests)
keymap.set("n", "<leader>jl", ":JqxList<CR>")  -- list top-level keys in quickfix (X to peek, <CR> to jump)
keymap.set("n", "<leader>jq", ":JqxQuery<CR>") -- run jq expression interactively

-- Reload personal Lua modules + re-source init.lua
-- 跳過 plugins-setup 以避免重跑 lazy.setup() 造成 plugin 狀態錯亂
-- 適合：改 keymap / option / plugin config 後快速試用
-- 不適合：plugins-setup.lua 變動（請改用 :Lazy sync 後重啟）
keymap.set("n", "<leader>R", function()
  for name, _ in pairs(package.loaded) do
    if name:match("^pakerzhang") and not name:match("plugins%-setup$") then
      package.loaded[name] = nil
    end
  end
  vim.cmd("source " .. vim.env.MYVIMRC)
  vim.notify("Config reloaded", vim.log.levels.INFO)
end, { desc = "Reload nvim config" })
