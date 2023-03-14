local status, bufferline = pcall(require, "buffline")
if not status then
  return
end

buffline.setup({})
