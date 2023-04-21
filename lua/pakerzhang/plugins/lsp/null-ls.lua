-- import null-ls plugin safely
local setup, null_ls = pcall(require, "null-ls")
if not setup then
  return
end

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- local lsp_formatting = function(bufnr)
--   vim.lsp.buf.format({
--     filter = function(client)
--       return client.name == "null-ls"
--     end,
--     bufnr = bufnr,
--   })
-- end
--
-- null_ls.setup({
--   sources = {
--     null_ls.builtins.formatting.prettierd,
--     null_ls.builtins.diagnostics.eslint_d.with({
--       diagnostics_format = "[eslint] #{m}\n(#{c})",
--     }),
--     null_ls.builtins.diagnostics.fish,
--   },
--   on_attach = function(client, bufnr)
--     if client.supports_method("textDocument/formatting") then
--       vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
--       vim.api.nvim_create_autocmd("BufWritePre", {
--         group = augroup,
--         buffer = bufnr,
--         callback = function()
--           lsp_formatting(bufnr)
--         end,
--       })
--     end
--   end,
-- })
--
-- vim.api.nvim_create_user_command("DisableLspFormatting", function()
--   vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
-- end, { nargs = 0 })

-- for conciseness
local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end
-- configure null_ls
null_ls.setup({
  -- setup formatters & linters
  sources = {
    --  to disable file types use
    formatting.prettier,
    formatting.stylua, -- lua formatter
    diagnostics.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ ".eslintrc.js", ".eslintrc", ".eslintrc.json", ".eslintrc.cjs" })
      end,
      diagnostics_format = "eslint: #{m}\n(#{c})",
    }),
  },
  -- configure format on save
  on_attach = function(current_client, bufnr)
    if current_client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            filter = function(client)
              --  only use null-ls for formatting instead of lsp server
              return client.name == "null-ls"
            end,
            bufnr = bufnr,
          })
        end,
      })
    end
  end,
})
