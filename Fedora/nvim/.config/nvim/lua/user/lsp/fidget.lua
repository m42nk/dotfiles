local ok, fidget = pcall(require, "fidget")
if not ok then
  return
end

fidget.setup {
  text = {
    spinner = "moon",
  },
  align = {
    bottom = true,
  },
  window = {
    relative = "editor",
    blend = 100,
  },
}
