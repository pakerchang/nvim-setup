-- in-buffer markdown rendering
local ok, rm = pcall(require, "render-markdown")
if not ok then
  return
end

rm.setup({})
