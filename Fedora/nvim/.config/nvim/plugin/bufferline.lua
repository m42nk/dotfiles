local ok, bufferline = pcall(require, "bufferline")
if not ok then
  return
end

bufferline.setup {
  options = {
    diagnostics = "nvim_lsp",
    -- diagnostics_indicator = function(count, level, context)
    --   local icon = level:match "error" and " " or " "
    --   return icon
    -- end,
  },
}
