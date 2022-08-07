local ok, leap = pcall(require, "leap")
if not ok then
  return
end

leap.setup {
  highlight_unlabeled = true,
}

leap.set_default_keymaps()
leap.init_highlight(true)
