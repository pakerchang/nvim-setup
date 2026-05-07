-- copilot.lua: 由 cmp 接管 suggestion / panel，讓建議走 nvim-cmp 補全選單
local copilot_status, copilot = pcall(require, "copilot")
if not copilot_status then
  return
end

copilot.setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
  filetypes = {
    ["*"] = true,
  },
})

local copilot_cmp_status, copilot_cmp = pcall(require, "copilot_cmp")
if not copilot_cmp_status then
  return
end

copilot_cmp.setup()
