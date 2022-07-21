pcall(require, "luarocks.loader")

local capi = {
	awesome = awesome,
	tag = tag,
	screen = screen,
	client = client,
	mouse = mouse,
}

-- require("awful").spawn("switchdisplay-quiet")
-- require("awful").spawn("autorandr -c")

require("awful.autofocus")

require("awful.hotkeys_popup.keys")
require("utils.error_handling")

require("utils.themes")
require("utils.wallpaper")
require("utils.bindings")

require("modules.tags").setup()

require("modules.rules") -- change this location
-- -- require("modules.wibar")
require("modules.neowibar")
require("modules.neotopbar")
require("modules.titlebars")
require("modules.notifications")

-- Enable sloppy focus, so that focus follows mouse.
-- capi.client.connect_signal("mouse::enter", function(c)
-- 	c:activate({ context = "mouse_enter", raise = false })
-- end)

-- io.open("/home/m42nk/debug.txt", "w"):write(require("gears").debug.dump_return(MySharedTags, 'a', 10)):close()
-- io.open("/home/m42nk/debug.txt", "w"):write(require("gears").debug.dump_return(capi.tag, "a", 10)):close()

local naughty = require("naughty")
local jumpto_button = naughty.action({
	name = "jump to",
})

jumpto_button:connect_signal("invoked", function()
	require("awful").client.urgent.jumpto()
end)

client.connect_signal("property::urgent", function(c)
	if c.urgent then
		naughty.notify({
			title = "Urgent client",
			message = c.name,
			actions = {
				jumpto_button,
			},
		})
	end
end)
-- vim:foldmethod=marker
-- io.open("/home/m42nk/debug.txt", "w"):write(gears.debug.dump_return(t)):close()
