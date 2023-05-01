local ok, nlspsettings = pcall(require, "nlspsettings")
if not ok then
  return
end

nlspsettings.setup {
  config_home = vim.fn.stdpath "config" .. "/nlsp-settings",
  local_settings_dir = ".nlsp-settings",
  local_settings_root_markers = { ".git", ".project-root" },
  append_default_schemas = true,
  loader = "json",
}
