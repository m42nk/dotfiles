local ruled = require("ruled")
local awful = require("awful")

local append = ruled.client.append_rule

ruled.client.connect_signal("request::rules", function()
	-- All clients will match this rule.
	append({
		id = "global",
		rule = {},
		properties = {
			focus = awful.client.focus.filter,
			-- floating = true,
			raise = true,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap + awful.placement.no_offscreen,
			callback = awful.client.setslave,
		},
	})

	-- Tiled clients.
	-- append({
	-- 	id = "tiling",
	-- 	properties = {
	-- 		floating = false,
	-- 	},
	-- 	rule_any = {
	-- 		class = {
	-- 			"Firefox",
	-- 			"kitty",
	-- 			"alacritty",
	-- 			"thunar",
	-- 			"chrome",
	-- 		},
	-- 	},
	-- })

	-- append({
	-- 	rule = { class = "firefox" },
	-- 	properties = {
	-- 		screen = 1,
	-- 		tag = MySharedTags[2],
	-- 		properties = {
	-- 			floating = false,
	-- 		},
	-- 	},
	-- })

	append({
		rule_any = {
			class = {
				"discord",
			},
			instance = {
				"ophjlpahpchlmihnnnihgmmeilfjmjjc__index.html",
			},
		},
		properties = {
			screen = 1,
			tag = MySharedTags[5],
			properties = {
				floating = false,
			},
		},
	})

	append({
		rule_any = {
			instance = {
				"postman",
				"jetbrains-datagrip",
				"jetbrains-studio",
				"vscodium",
				"gitkraken",
			},
		},
		properties = {
			floating = false,
			screen = 1,
			tag = MySharedTags[3],
		},
	})

	append({
		rule_any = {
			instance = {
				"lofi",
			},
		},

		properties = {
			floating = false,
			tag = MySharedTags[4],
		},
	})

	append({
		id = "titlebars",
		rule_any = { type = { "normal", "dialog" } },
		properties = { titlebars_enabled = true },
	})

	append({
		id = "floating",
		rule_any = {
			instance = { "copyq", "pinentry", "simplescreenrecorder" },
			class = {
				"Arandr",
				"Blueman-manager",
				"Gpick",
				"Kruler",
				"Sxiv",
				"Tor Browser",
				"Wpa_gui",
				"veromix",
				"xtightvncviewer",
				"jetbrains-studio",
				"simplescreenrecorder",
				-- "zoom",
			},
			name = {
				"simplescreenrecorder",
				"Event Tester",
				-- "zoom",
			},
			role = {
				"AlarmWindow",
				"ConfigManager",
				"pop-up",
				-- "zoom",
			},
		},
		properties = {
			placement = awful.placement.centered,
			floating = true,
		},
	})

	append({
		rule_any = {
			class = {
				"Pavucontrol",
				"Iwgtk",
			},
		},
		properties = {
			floating = true,
			placement = awful.placement.bottom_right,
		},
	})
end)
