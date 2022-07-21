local awful = require("awful")
local wibox = require("wibox")
local lain = require("lain")
local beautiful = require("beautiful")
local gears = require("gears")
local dpi = require("beautiful.xresources").apply_dpi
local markup = lain.util.markup

local capi = {
	awesome = awesome,
	tag = tag,
	screen = screen,
	client = client,
}

local fenetre = require("modules.fenetre")
local titlebar = fenetre({
	separator = " ",
	order = {
		"close",
		"min",
		"max",
		"separator",
		"title",
	},
})

local client_modifier = fenetre({
	separator = " ",
	order = {
		"separator",
		"ontop",
		"sticky",
		"floating",
	},
})

capi.screen.connect_signal("request::desktop_decoration", function(s)
	s.mytopwibox = awful.wibar({
		position = "top",
		screen = s,
		height = dpi(19),
		bg = beautiful.bg_normal,
		fg = beautiful.fg_normal,
	})

	s.mytopwibox:setup({
		nil,
		titlebar,
		client_modifier,
		layout = wibox.layout.align.horizontal,
	})
end)

-- vim:foldmethod=marker
