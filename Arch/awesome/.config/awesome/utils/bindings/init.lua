local awful = require("awful")
local gears = require("gears")
local naughty = require("naughty")
local wibox = require("wibox")
local hotkeys_popup = require("awful.hotkeys_popup").widget

local capi = {
	screen = screen,
	mouse = mouse,
}

local bind = require("modules.bind")

-- local clients = require("bindings.utils.clients")
-- local screens = require("bindings.utils.screens")
-- local layouts = require("bindings.utils.layouts")

local screens = {}
screens.focus_next_screen = function()
	awful.screen.focus_relative(1)
end

screens.focus_prev_screen = function()
	awful.screen.focus_relative(-1)
end

screens.swap_next_screen = function()
	-- TODO: WIP
	-- shuold iterate over tags and change their screen
	local screen = awful.screen.focused() or capi.mouse.screen
	local next_index = screen.index + 1

	if next_index > capi.screen.count() then
		next_index = 1
	end

	local next_screen = capi.screen[next_index]

	screen:swap(next_screen) -- doesn't work
end

local layouts = {}
layouts.inc_master_width = function()
	awful.tag.incmwfact(0.05)
end
layouts.dec_master_width = function()
	awful.tag.incmwfact(-0.05)
end
layouts.inc_master_count = function()
	awful.tag.incnmaster(1, nil, true)
end
layouts.dec_master_count = function()
	awful.tag.incnmaster(-1, nil, true)
end
layouts.inc_columns = function()
	awful.tag.incncol(1, nil, true)
end
layouts.dec_columns = function()
	awful.tag.incncol(-1, nil, true)
end
layouts.next_layout = function()
	awful.layout.inc(1)
end
layouts.prev_layout = function()
	awful.layout.inc(-1)
end

local clients = {}
clients.close = function()
	local c = client.focus
	if c then
		c:kill()
	end
end

clients.focus_last_client = function()
	awful.client.focus.history.previous()
end

clients.focus_next_client = function()
	awful.client.focus.byidx(1)
end

clients.focus_prev_client = function()
	awful.client.focus.byidx(-1)
end

clients.focus_left = function()
	awful.client.focus.global_bydirection("left")
end

clients.focus_right = function()
	awful.client.focus.global_bydirection("right")
end

clients.focus_up = function()
	awful.client.focus.global_bydirection("up")
end

clients.focus_down = function()
	awful.client.focus.global_bydirection("down")
end

clients.swap_next_client = function()
	awful.client.swap.byidx(1)
end

clients.swap_prev_client = function()
	awful.client.swap.byidx(-1)
end

clients.swap_left = function()
	awful.client.swap.global_bydirection("left")
end

clients.swap_right = function()
	awful.client.swap.global_bydirection("right")
end

clients.swap_up = function()
	awful.client.swap.global_bydirection("up")
end

clients.swap_down = function()
	awful.client.swap.global_bydirection("down")
end

clients.restore_minimized = function()
	awful.client.restore()
end
clients.move_to_master = function(c)
	c:swap(awful.client.getmaster())
end
clients.toggle_maximized = function(c)
	c.maximized = not c.maximized
	c:raise()
end

clients.move_to_screen = function(c)
	c:move_to_screen()
end
clients.toggle_ontop = function(c)
	c.ontop = not c.ontop
end
clients.toggle_minimized = function(c)
	c.minimized = true
end
clients.toggle_maximize_vertical = function(c)
	c.maximized_vertical = not c.maximized_vertical
end
clients.toggle_maximize_horizontal = function(c)
	c.maximized_horizontal = not c.maximized_horizontal
end

clients.raise_through = function(c)
	c:activate({ context = "mouse_click" })
end

clients.mouse_move_client = function(c)
	c:activate({ context = "mouse_click", action = "mouse_move" })
end

clients.mouse_resize_client = function(c)
	c:activate({ context = "mouse_click", action = "mouse_resize" })
end

clients.aero_snap_left = function(c)
	-- naughty.notify({
	-- 	text = gears.debug.dump_return({ c:geometry(), c.screen.geometry }),
	-- })

	local axis = "vertically"
	local f = awful.placement.scale + awful.placement.left + (axis and awful.placement["maximize_" .. axis] or nil)
	local geo = f(c, { honor_workarea = true, to_percent = 0.5 })
	c.maximized_vertical = true
end

clients.aero_snap_right = function(c)
	-- naughty.notify({
	-- 	text = gears.debug.dump_return({ c:geometry(), c.screen.geometry }),
	-- })

	-- c.maximized_vertical = not c.maximized_vertical

	local axis = "vertically"
	local f = awful.placement.scale
		+ awful.placement.left
		+ awful.placement.right
		+ (axis and awful.placement["maximize_" .. axis] or nil)
	local geo = f(c, { honor_workarea = true, to_percent = 0.5 })
	c.maximized_vertical = true
end

clients.aero_snap_up = function(c)
	local cg = c:geometry()
	local sg = c.screen.workarea

	-- maximized
	if (cg.height == sg.height / 2) and (cg.width == sg.width / 2) then
		c.maximized = true
		c:geometry({
			x = sg.x,
			y = sg.y,
			width = sg.width,
			height = sg.height,
		})
		return
	end

	c:geometry({
		x = cg.x,
		y = cg.y,
		width = sg.width / 2,
		height = sg.height / 2,
	})
end

clients.aero_snap_down = function(c)
	local cg = c:geometry()
	local sg = c.screen.workarea

	-- maximized
	if (cg.height == sg.height / 2) and (cg.width == sg.width / 2) then
		c.maximized = true
		c:geometry({
			x = sg.x,
			y = sg.y,
			width = sg.width,
			height = sg.height,
		})
		return
	end

	c:geometry({
		x = cg.x,
		y = sg.height / 2 + sg.y,
		width = sg.width / 2,
		height = sg.height / 2,
	})
end

bind.set("client", "Super+Control+h", clients.aero_snap_left, "Clients: aero snap left")
bind.set("client", "Super+Control+l", clients.aero_snap_right, "Clients: aero snap right")
bind.set("client", "Super+Control+k", clients.aero_snap_up, "Clients: aero snap up")
bind.set("client", "Super+Control+j", clients.aero_snap_down, "Clients: aero snap up")

-- Main

-- local quakecontainer = {}
-- local quake = lain.util.
-- quakecontainer.toggle =
-- bind.set("root", "Super+Control+q", quakecontainer.toggle, "Root: quake")

bind.set("root", "Super+Control+r", awesome.restart, "Awesome: reload awesome")
-- bind.set("root", "Super+Control+q", awesome.quit, "Awesome: quit awesome")
bind.set("root", "Super+s", hotkeys_popup.show_help, "Awesome: show help")

-- Screens
-- bind.set("root", "Super+Control+j", screens.focus_next_screen, "Screen: focus the next screen")
-- bind.set("root", "Super+Control+k", screens.focus_prev_screen, "Screen: focus the previous screen")

-- Layout
bind.set("root", "Super+Shift+.", layouts.inc_master_width, "Layout: increase master width factor")
bind.set("root", "Super+Shift+,", layouts.dec_master_width, "Layout: decrease master width factor")

bind.set("root", "Super+Shift+=", layouts.inc_master_amount, "Layout: increase the number of master clients")
bind.set("root", "Super+Shift+-", layouts.dec_master_amount, "Layout: decrease the number of master clients")

-- bind.set("root", "Super+Control+h", layouts.inc_columns, "Layout: increase the number of columns")
-- bind.set("root", "Super+Control+l", layouts.dec_columns, "Layout: decrease the number of columns")

bind.set("root", "Super+space", layouts.next_layout, "Layout: select next")
bind.set("root", "Super+Shift+space", layouts.prev_layout, "Layout: select previous")

-- Client
-- bind.set("root", "Super+Tab", clients.focus_last_client, "Client: go back")

bind.set("root", "Super+a", clients.focus_next_client, "Client: focus next/prev client")
bind.set("root", "Super+d", clients.focus_prev_client, "Client: focus next/prev client")

bind.set("root", "Super+h", clients.focus_left, "Client: focus by direction")
bind.set("root", "Super+j", clients.focus_down, "Client: focus by direction")
bind.set("root", "Super+k", clients.focus_up, "Client: focus by direction")
bind.set("root", "Super+l", clients.focus_right, "Client: focus by direction")

-- bind.set("root", "Super+h", clients.focus_left, "Client: focus left")
-- bind.set("root", "Super+j", clients.focus_down, "Client: focus down")
-- bind.set("root", "Super+k", clients.focus_up, "Client: focus up")
-- bind.set("root", "Super+l", clients.focus_right, "Client: focus right")

bind.set("root", "Super+Shift+a", clients.swap_prev_client, "Client: swap with next/previous client by index")
bind.set("root", "Super+Shift+d", clients.swap_next_client, "Client: swap with next/previous client by index")

bind.set("root", "Super+Shift+h", clients.swap_left, "Client: swap with client")
bind.set("root", "Super+Shift+j", clients.swap_down, "Client: swap with client")
bind.set("root", "Super+Shift+k", clients.swap_up, "Client: swap with client")
bind.set("root", "Super+Shift+l", clients.swap_right, "Client: swap with client")

bind.set("root", "Super+u", awful.client.urgent.jumpto, "Client: jump to urgent client")
bind.set("root", "Super+Control+n", clients.urgent_jumpto, "Client: restore minimized")

bind.set("client", "Super+Shift+q", clients.close, "Client: close")
bind.set("client", "Super+f", clients.toggle_maximized, "Client: toggle fullscreen")
bind.set("client", "Super+Control+space", awful.client.floating.toggle, "Client: toggle floating")
bind.set("client", "Super+Control+Return", clients.move_to_master, "Client: move to master")
bind.set("client", "Super+t", clients.toggle_ontop, "Client: toggle keep on top")

bind.set("client", "Super+Control+c", awful.placement.centered, "Client: move to center of screen")

bind.set("client", "Super+n", clients.toggle_minimized, "Client: minimize")
bind.set("client", "Super+Control+m", clients.toggle_maximize_vertical, "Client: (un)maximize vertically")
bind.set("client", "Super+Shift+m", clients.toggle_maximize_horizontal, "Client: (un)maximize horizontally")

bind.set("client", "LMB", clients.raise_through, "Client: raise client")
bind.set("client", "Super+LMB", clients.mouse_move_client, "Client: move client")
bind.set("client", "Super+RMB", clients.mouse_resize_client, "Client: resize client")

bind.set("client_titlebar", "LMB", clients.mouse_move_client, "Client: (on titlebar) move client")
bind.set("client_titlebar", "RMB", clients.mouse_resize_client, "Client: (on titlebar) resize client")

-- Machi
-- local machi = require("modules.layout-machi")
-- bind.set("root", "Super+;", machi.default_editor.start_interactive, "Layout: machi interactive configuration")
-- bind.set("root", "Super+:", function() machi.switcher.start(client.focus) end, "Layout: machi interactive clients management")

-- Tags
bind.set("root", "Super+Tab", awful.tag.history.restore, "Tag: view previous")
bind.set("root", "MWU", awful.tag.viewnext, "Tag: next tag")
bind.set("root", "MWD", awful.tag.viewprev, "Tag: previous tag ")
bind.set("root", "Super+Left", awful.tag.viewprev, "Tag: view previous")
bind.set("root", "Super+Right", awful.tag.viewnext, "Tag: view next")
bind.set("root", "Super+Escape", awful.tag.history.restore, "Tag: go back")

local sharedtags = require("modules.sharedtags")
local tags = {}

-- io.open("/home/m42nk/debug.txt", "w"):write(gears.debug.dump_return(shrtag)):close()

tags.swap_next_screen = function()
	local screen = awful.screen.focused() or capi.mouse.screen
	local tag = screen.selected_tag

	local next_index = screen.index + 1
	if next_index > capi.screen.count() then
		next_index = 1
	end

	local next_screen = capi.screen[next_index]
	local next_tag = next_screen.selected_tag

	sharedtags.movetag(tag, next_screen)
	sharedtags.viewonly(next_tag, screen)
end

tags.move_to_next_screen = function()
	local screen = awful.screen.focused() or capi.mouse.screen
	local tag = screen.selected_tag

	local next_index = screen.index + 1
	if next_index > capi.screen.count() then
		next_index = 1
	end

	local next_screen = capi.screen[next_index]

	if tag then
		awful.screen.focus(next_screen)
		sharedtags.viewonly(tag, next_screen)
	end
end

tags.view_tag = function(i)
	local tag = MySharedTags[i]
	if tag then
		local screen = tag.screen or awful.screen.focused()
		awful.screen.focus(screen)
		sharedtags.viewonly(tag, screen)
	end
end

tags.toggle_tag = function(i)
	local screen = awful.screen.focused()
	local tag = MySharedTags[i]
	if tag then
		sharedtags.viewtoggle(tag, screen)
	end
end

tags.move_focused_client_to = function(i)
	local tag = MySharedTags[i]
	if client.focus and tag then
		client.focus:move_to_tag(tag)
	end
end

tags.toggle_focused_client_on = function(i)
	local tag = MySharedTags[i]
	if client.focus and tag then
		client.focus:toggle_tag(tag)
	end
end

bind.set("root", "Super+o", screens.focus_next_screen, "Screen: focus next")
bind.set("client", "Super+Shift+o", clients.move_to_screen, "Client: move to next screen")
bind.set("root", "Super+Control+o", tags.move_to_next_screen, "Tag: move to next screen")
bind.set("root", "Super+Control+Shift+o", tags.swap_next_screen, "Tag: swap next screen")
-- bind.set("root", "Super+`", tags.swap_next_screen, ": swap next screen")

for i = 1, 9 do
	bind.set("root", "Super+#" .. i + 9, bind.bind(tags.view_tag, i), "Tag: view tag #")
	bind.set("root", "Super+Control+#" .. i + 9, bind.bind(tags.toggle_tag, i), "Tag: toggle tag #")
	bind.set(
		"root",
		"Super+Shift+#" .. i + 9,
		bind.bind(tags.move_focused_client_to, i),
		"Tag: move focused client to tag #"
	)
	bind.set(
		"root",
		"Super+Control+Shift+#" .. i + 9,
		bind.bind(tags.toggle_focused_client_on, i),
		"Tag: toggle focused client on tag #"
	)
end

bind.set("root", "Super+`", bind.bind(tags.view_tag, 5), "")

-- Bind to root
root.keys(bind.get("root", "key"))
root.buttons(bind.get("root", "button"))

-- Bind to client
client.connect_signal("request::default_keybindings", function()
	awful.keyboard.append_client_keybindings(bind.get("client", "key"))
end)

-- Bind to client (mouse)
client.connect_signal("request::default_mousebindings", function()
	awful.mouse.append_client_mousebindings(bind.get("client", "button"))
end)
