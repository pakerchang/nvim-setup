-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

local keymap = vim.keymap

-- enable keybinds only when lsp server available
local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
  keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
  keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
  keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
  keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
  keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
  keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
  keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
  keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
  keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)

  -- typescript via ts_ls 內建 code actions
  if client.name == "ts_ls" then
    keymap.set("n", "<leader>oi", function()
      vim.lsp.buf.code_action({
        apply = true,
        context = { only = { "source.organizeImports.ts" }, diagnostics = {} },
      })
    end, opts)
    keymap.set("n", "<leader>ru", function()
      vim.lsp.buf.code_action({
        apply = true,
        context = { only = { "source.removeUnused.ts" }, diagnostics = {} },
      })
    end, opts)
  end
end

-- Diagnostic icons (Neovim 0.10+ API)
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN]  = " ",
      [vim.diagnostic.severity.HINT]  = " ",
      [vim.diagnostic.severity.INFO]  = " ",
    },
  },
})

-- 全 server 共用預設（Neovim 0.11+ API）
vim.lsp.config("*", {
  capabilities = cmp_nvim_lsp.default_capabilities(),
  on_attach = on_attach,
})

-- per-server overrides（合併在預設之上）
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})

-- enable servers（base config 由 nvim-lspconfig 的 lsp/<name>.lua 提供）
local servers = {
  "ts_ls",
  "html",
  "cssls",
  "tailwindcss",
  "emmet_ls",
  "volar",
  "marksman",
  "yamlls",
  "dockerls",
  "docker_compose_language_service",
  "lua_ls",
  "jsonls",
}

for _, server in ipairs(servers) do
  vim.lsp.enable(server)
end
