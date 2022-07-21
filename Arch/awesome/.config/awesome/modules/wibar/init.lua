local awful = require("awful")
local wibox = require("wibox")
local cfg = require("configuration")
local lain = require("lain")

local modkey = "Mod4"

local capi = {
	awesome = awesome,
	tag = tag,
	screen = screen,
}

-- Create a textclock widget
local mytextclock = wibox.widget.textclock()

capi.screen.connect_signal("request::desktop_decoration", function(s)
	-- Each screen has its own tag table.
	-- awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

	s.mytaglist = awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = {
			awful.button({}, 1, function(t)
				t:view_only()
			end),
			awful.button({}, 3, awful.tag.viewtoggle),
			awful.button({}, 4, function(t)
				awful.tag.viewnext(t.screen)
			end),
			awful.button({}, 5, function(t)
				awful.tag.viewprev(t.screen)
			end),
		},
	})

	s.mylayoutbox = awful.widget.layoutbox({
		screen = s,
		buttons = {
			awful.button({}, 1, function()
				awful.layout.inc(1)
			end),
			awful.button({}, 3, function()
				awful.layout.inc(-1)
			end),
			awful.button({}, 4, function()
				awful.layout.inc(-1)
			end),
			awful.button({}, 5, function()
				awful.layout.inc(1)
			end),
		},
	})

	-- Create a tasklist widget
	s.mytasklist = awful.widget.tasklist({
		screen = s,
		filter = awful.widget.tasklist.filter.currenttags,
		buttons = {
			awful.button({}, 1, function(c)
				c:activate({ context = "tasklist", action = "toggle_minimization" })
			end),
			awful.button({}, 3, function()
				awful.menu.client_list({ theme = { width = 250 } })
			end),
			awful.button({}, 4, function()
				awful.client.focus.byidx(-1)
			end),
			awful.button({}, 5, function()
				awful.client.focus.byidx(1)
			end),
		},
		widget_template = {
			{
				{
					{
						{
							id = "icon_role",
							widget = wibox.widget.imagebox,
						},
						margins = 2,
						widget = wibox.container.margin,
					},
					{
						id = "text_role",
						widget = wibox.widget.textbox,
					},
					layout = wibox.layout.fixed.horizontal,
				},
				left = 10,
				right = 10,
				forced_width = 150,
				widget = wibox.container.margin,
			},
			id = "background_role",
			widget = wibox.container.background,
		},
	})

	-- [[
	-- Create the wibar
	-- ]]
	s.mywibox = awful.wibar({
		position = "bottom",
		screen = s,
		widget = {
			layout = wibox.layout.align.horizontal,
			{
				s.mytaglist,
				layout = wibox.layout.fixed.horizontal,
			},
			{
				s.mytasklist,
				layout = wibox.layout.fixed.horizontal,
			},
			{
				mytextclock,
				wibox.widget.systray(),
				s.mylayoutbox,
				layout = wibox.layout.fixed.horizontal,
			},
		},
	})
end)

-- awful.button({ modkey }, 1, function(t)
-- 	if client.focus then
-- 		client.focus:move_to_tag(t)
-- 	end
-- end),
-- awful.button({ modkey }, 3, function(t)
-- 	if client.focus then
-- 		client.focus:toggle_tag(t)
-- 	end
-- end),
