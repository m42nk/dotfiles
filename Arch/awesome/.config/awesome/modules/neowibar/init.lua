local awful = require("awful")
local wibox = require("wibox")
local cfg = require("configuration")
local lain = require("lain")
local beautiful = require("beautiful")
local gears = require("gears")
local dpi = require("beautiful.xresources").apply_dpi
local sharedtags = require("modules.sharedtags")
local markup = lain.util.markup

local modkey = "Mod4"

local capi = {
	awesome = awesome,
	tag = tag,
	screen = screen,
}

os.setlocale(os.getenv("LANG")) -- to localize the clock
local clockicon = wibox.widget.imagebox(beautiful.widget_clock)
local mytextclock = wibox.widget.textclock(
	markup("#7788af", "%A %d %B ") .. markup("#ab7367", ">") .. markup("#de5e1e", " %H:%M ")
)
mytextclock.font = beautiful.font

-- CPU
local cpuicon = wibox.widget.imagebox(beautiful.widget_cpu)
local cpu = lain.widget.cpu({
	settings = function()
		widget:set_markup(markup.fontfg(beautiful.font, "#e33a6e", cpu_now.usage .. "% "))
	end,
})

-- Coretemp
local tempicon = wibox.widget.imagebox(beautiful.widget_temp)
local temp = lain.widget.temp({
	settings = function()
		widget:set_markup(markup.fontfg(beautiful.font, "#f1af5f", coretemp_now .. "°C "))
	end,
})

-- Battery
local baticon = wibox.widget.imagebox(beautiful.widget_batt)
local bat = lain.widget.bat({
	settings = function()
		local perc = bat_now.perc ~= "N/A" and bat_now.perc .. "%" or bat_now.perc

		if bat_now.ac_status == 1 then
			perc = perc .. " plug"
		end

		widget:set_markup(markup.fontfg(beautiful.font, beautiful.fg_normal, perc .. " "))
	end,
})

-- ALSA volume
local volicon = wibox.widget.imagebox(beautiful.widget_vol)
local volume = lain.widget.alsa({
	timeout = 1,
	settings = function()
		if volume_now.status == "off" then
			volume_now.level = volume_now.level .. "M"
		end

		widget:set_markup(markup.fontfg(beautiful.font, "#7493d2", volume_now.level .. "% "))
	end,
})

-- Net
local netdownicon = wibox.widget.imagebox(beautiful.widget_netdown)
local netdowninfo = wibox.widget.textbox()
local netupicon = wibox.widget.imagebox(beautiful.widget_netup)
local netupinfo = lain.widget.net({
	settings = function()
		widget:set_markup(markup.fontfg(beautiful.font, "#e54c62", net_now.sent .. " "))
		netdowninfo:set_markup(markup.fontfg(beautiful.font, "#87af5f", net_now.received .. " "))
	end,
})

-- MEM
local memicon = wibox.widget.imagebox(beautiful.widget_mem)
local memory = lain.widget.mem({
	settings = function()
		widget:set_markup(markup.fontfg(beautiful.font, "#e0da37", mem_now.used .. "M "))
	end,
})

local fsicon = wibox.widget.imagebox(beautiful.widget_fs)
local fs = lain.widget.fs({
	notification_preset = { font = "Terminus 10", fg = beautiful.fg_normal },
	settings = function()
		widget:set_markup(markup.fontfg(beautiful.font, "#80d9d8", string.format("%.1f", fs_now["/"].used) .. "% "))
	end,
})

-- Create a textclock widget
local mytextclock = wibox.widget.textclock()
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

capi.screen.connect_signal("request::desktop_decoration", function(s)
	-- Quake application
	s.quake = lain.util.quake({ app = "kitty" })

	-- If wallpaper is a function, call it with the screen
	local wallpaper = beautiful.wallpaper
	if type(wallpaper) == "function" then
		wallpaper = wallpaper(s)
	end
	gears.wallpaper.maximized(wallpaper, s, true)

	-- Tags
	-- awful.tag(awful.util.tagnames, s, awful.layout.layouts)

	-- Create a promptbox for each screen
	s.mypromptbox = awful.widget.prompt()
	-- Create an imagebox widget which will contains an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(my_table.join(
		awful.button({}, 1, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 2, function()
			awful.layout.set(awful.layout.layouts[1])
		end),
		awful.button({}, 3, function()
			awful.layout.inc(-1)
		end),
		awful.button({}, 4, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 5, function()
			awful.layout.inc(-1)
		end)
	))
	-- Create a taglist widget
	-- s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)
	local taglist_buttons = {
		awful.button({}, 1, function(t)
			local s = awful.screen.focused()
			sharedtags.viewonly(t, s)
		end),

		awful.button({ modkey }, 1, function(t)
			if client.focus then
				client.focus:move_to_tag(t)
			end
		end),

		awful.button({}, 3, awful.tag.viewtoggle),

		awful.button({}, 4, function(t)
			awful.tag.viewprev(t.screen)
		end),

		awful.button({}, 5, function(t)
			awful.tag.viewnext(t.screen)
		end),
	}

	s.mytaglist = awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = taglist_buttons,
	})

	-- Create a tasklist widget
	-- s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)
	s.mytasklist = {
		nil,
		nil,
		{
			widget = awful.widget.tasklist({
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
						awful.widget.clienticon,
						widget = wibox.container.place,
					},
					id = "background_role",
					forced_width = 30,
					widget = wibox.container.background,
				},
			}),
		},
		layout = wibox.layout.align.horizontal,
	}

	-- Create the wibox
	s.mywibox = awful.wibar({
		position = "bottom",
		screen = s,
		height = dpi(19),
		bg = beautiful.bg_normal,
		fg = beautiful.fg_normal,
	})

	-- Add widgets to the wibox
	s.mywibox:setup({
		layout = wibox.layout.align.horizontal,
		{ -- Left widgets
			layout = wibox.layout.fixed.horizontal,
			s.mytaglist,
			s.mypromptbox,
		},
		{
			{
				s.mytasklist,
				margins = { left = dpi(10) },
				widget = wibox.container.margin,
			},
			layout = wibox.layout.fixed.horizontal,
		},
		-- nil,
		{ -- Right widgets
			layout = wibox.layout.fixed.horizontal,
			wibox.widget.systray(),
			--mailicon,
			--beautiful.mail.widget,
			netdownicon,
			netdowninfo,
			netupicon,
			netupinfo.widget,
			volicon,
			volume.widget,
			memicon,
			memory.widget,
			cpuicon,
			cpu.widget,
			fsicon,
			fs.widget,
			tempicon,
			temp.widget,
			baticon,
			bat.widget,
			clockicon,
			mytextclock,
			s.mylayoutbox,
		},
	})
end)
