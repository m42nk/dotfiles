local _M = {}

local awful = require("awful")
local sharedtags = require("modules.sharedtags")

local capi = {
	tag = tag,
	screen = screen,
	mouse = mouse,
	client = client,
}

local layout = awful.layout.suit
local tags = {
	{
		category = "main",
		layout = layout.tile,
		screen = 1,
	},
	{
		category = "browser",
		layout = layout.tile,
		screen = 1,
	},
	{
		category = "database",
		layout = layout.max,
		screen = 1,
	},
	{
		category = "sandbox",
		layout = layout.tile,
		screen = 1,
	},
	{
		category = "messaging",
		layout = layout.floating,
		screen = 2,
	},
	{
		layout = layout.tile,
		screen = 2,
	},
	{
		layout = layout.tile,
		screen = 2,
	},
	{
		layout = layout.tile,
		screen = 2,
	},
}

_M.setup = function()
	MySharedTags = sharedtags(tags)
end

capi.tag.connect_signal("request::default_layouts", function()
	awful.layout.append_default_layouts({
		layout.floating,
		layout.spiral.dwindle,
		layout.max,
	})
end)

return _M
