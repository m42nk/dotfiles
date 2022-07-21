local _M = {}

_M.apps = {
	terminal = os.getenv("TERMINAL") or "kitty",
	editor = os.getenv("EDITOR") or "vim",
}

_M.apps.editor_cmd = _M.apps.terminal .. " -e " .. _M.apps.editor

return _M
