local ok, leap = pcall(require, "leap")

if not ok then
  return
end

leap.setup {}

leap.set_default_keymaps()
leap.init_highlight(true)
