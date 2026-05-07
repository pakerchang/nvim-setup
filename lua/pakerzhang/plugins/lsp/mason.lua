-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
  return
end

-- enable mason
mason.setup()

mason_lspconfig.setup({
  -- list of servers for mason to install
  ensure_installed = {
    "ts_ls",
    "html",
    "cssls",
    "tailwindcss",
    "lua_ls",
    "emmet_ls",
    "vue_ls",
    "yamlls",
    "marksman",
    "jsonls",
    "dockerls",
    "docker_compose_language_service",
  },
  -- auto-install configured servers (with lspconfig)
  automatic_installation = true, -- not the same as ensure_installed
  -- 由 lspconfig.lua 用 vim.lsp.enable 統一啟動，避免把 stylua 等非 LSP 也誤啟
  automatic_enable = false,
})

mason_null_ls.setup({
  -- list of formatters & linters for mason to install
  ensure_installed = {
    "prettier", -- ts/js formatter
    "stylua", -- lua formatter
    "eslint_d", -- ts/js linter
    "codespell",
    "cpell",
  },
  -- auto-install configured formatters & linters (with null-ls)
  automatic_installation = true,
})
