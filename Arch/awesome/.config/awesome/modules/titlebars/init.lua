local awful = require("awful")
local wibox = require("wibox")

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
	local tb = awful.titlebar(c, { size = 20 })
	tb.widget = {
		{ layout = wibox.widget.base.empty_widget },
		{
			{ widget = awful.titlebar.widget.titlewidget(c) },
			buttons = require("modules.bind").get("client_titlebar", "button", c),
			layout = wibox.layout.flex.horizontal,
		},
		{
			awful.titlebar.widget.floatingbutton(c),
			awful.titlebar.widget.maximizedbutton(c),
			awful.titlebar.widget.stickybutton(c),
			awful.titlebar.widget.ontopbutton(c),
			awful.titlebar.widget.closebutton(c),
			layout = wibox.layout.fixed.horizontal,
		},
		layout = wibox.layout.align.horizontal,
	}
	-- tb:connect_signal("mouse::enter", function()
	-- 	awful.titlebar(c, { size = 20 })
	-- tb.widget = tbw
	-- end)

	-- tb:connect_signal("mouse::leave", function()
	-- 	awful.titlebar(c, { size = 3 })
	-- 	tb.widget = {}
	-- end)

	awful.titlebar.hide(c)
end)
