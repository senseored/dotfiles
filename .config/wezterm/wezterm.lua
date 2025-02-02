local wezterm = require("wezterm")
local act = wezterm.action
local config = {}
-- 	color_scheme = "Gruvbox Dark (Gogh)",
-- 	window_background_opacity = 0.5,
-- 	enable_wayland = false,
-- 	enable_tab_bar = false,
-- 	font = wezterm.font("JetBrainsMonoNerdFont", { weight = "DemiBold" }),
-- 	font_size = 10,
-- 	cursor_blink_rate = 800,

-- Show which key table is active in the status area
wezterm.on("update-right-status", function(window, pane)
	local name = window:active_key_table()
	if name then
		name = "TABLE: " .. name
	end
	window:set_right_status(name or "")
end)
config = {
	max_fps = 165,
}

config.default_prog = { "/usr/bin/nu", "-l" }

-- config.leader = { key = "a", mods = "CTRL|ALT" }
config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	-- CTRL+SHIFT+Space, followed by 'r' will put us in resize-pane
	-- mode until we cancel that mode.
	-- {
	-- 	key = "r",
	-- 	mods = "LEADER",
	-- 	action = act.ActivateKeyTable({
	-- 		name = "resize_pane",
	-- 		one_shot = false,
	-- 	}),
	-- },
	--
	-- -- CTRL+SHIFT+Space, followed by 'a' will put us in activate-pane
	-- -- mode until we press some other key or until 1 second (1000ms)
	-- -- of time elapses
	-- {
	-- 	key = "a",
	-- 	mods = "LEADER",
	-- 	action = act.ActivateKeyTable({
	-- 		name = "activate_pane",
	-- 		timeout_milliseconds = 1000,
	-- 	}),
	-- },

	{ key = "b", mods = "LEADER|CTRL", action = wezterm.action({ SendString = "\x01" }) },
	{ key = "-", mods = "LEADER", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
	{
		key = "\\",
		mods = "LEADER",
		action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
	},
	{ key = "s", mods = "LEADER", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
	{ key = "v", mods = "LEADER", action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
	{ key = "n", mods = "LEADER", action = wezterm.action({ ActivateTabRelative = 1 }) },
	{ key = "p", mods = "LEADER", action = wezterm.action({ ActivateTabRelative = -1 }) },
	-- { key = "n", mods = "LEADER", action = "ActivateNextTab" },
	-- { key = "p", mods = "LEADER", action = "ActivateLastTab" },
	{ key = "o", mods = "LEADER", action = "TogglePaneZoomState" },
	{ key = "y", mods = "LEADER", action = act.ActivateCopyMode },
	{ key = "P", mods = "LEADER|SHIFT", action = act.PasteFrom("Clipboard") },
	{ key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
	{ key = "c", mods = "LEADER", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
	{
		key = "h",
		mods = "LEADER",
		action = act.Multiple({
			wezterm.action({ ActivatePaneDirection = "Left" }),
			act.ActivateKeyTable({ name = "activate_pane", one_shot = false }),
		}),
	},
	{
		key = "j",
		mods = "LEADER",
		action = act.Multiple({
			wezterm.action({ ActivatePaneDirection = "Down" }),
			act.ActivateKeyTable({ name = "activate_pane", one_shot = false }),
		}),
	},
	{
		key = "k",
		mods = "LEADER",
		action = act.Multiple({
			wezterm.action({ ActivatePaneDirection = "Up" }),
			act.ActivateKeyTable({ name = "activate_pane", one_shot = false }),
		}),
	},
	{
		key = "l",
		mods = "LEADER",
		action = act.Multiple({
			wezterm.action({ ActivatePaneDirection = "Right" }),
			act.ActivateKeyTable({ name = "activate_pane", one_shot = false }),
		}),
	},
	{
		key = "H",
		mods = "LEADER|SHIFT",
		action = act.Multiple({
			wezterm.action({ AdjustPaneSize = { "Left", 1 } }),
			act.ActivateKeyTable({ name = "resize_pane", one_shot = false }),
		}),
	},
	{
		key = "J",
		mods = "LEADER|SHIFT",
		action = act.Multiple({
			wezterm.action({ AdjustPaneSize = { "Down", 1 } }),
			act.ActivateKeyTable({ name = "resize_pane", one_shot = false }),
		}),
	},
	{
		key = "K",
		mods = "LEADER|SHIFT",
		action = act.Multiple({
			wezterm.action({ AdjustPaneSize = { "Up", 1 } }),
			act.ActivateKeyTable({ name = "resize_pane", one_shot = false }),
		}),
	},
	{
		key = "L",
		mods = "LEADER|SHIFT",
		action = act.Multiple({
			wezterm.action({ AdjustPaneSize = { "Right", 1 } }),
			act.ActivateKeyTable({ name = "resize_pane", one_shot = false }),
		}),
	},
	{ key = "1", mods = "LEADER", action = wezterm.action({ ActivateTab = 0 }) },
	{ key = "2", mods = "LEADER", action = wezterm.action({ ActivateTab = 1 }) },
	{ key = "3", mods = "LEADER", action = wezterm.action({ ActivateTab = 2 }) },
	{ key = "4", mods = "LEADER", action = wezterm.action({ ActivateTab = 3 }) },
	{ key = "5", mods = "LEADER", action = wezterm.action({ ActivateTab = 4 }) },
	{ key = "6", mods = "LEADER", action = wezterm.action({ ActivateTab = 5 }) },
	{ key = "7", mods = "LEADER", action = wezterm.action({ ActivateTab = 6 }) },
	{ key = "8", mods = "LEADER", action = wezterm.action({ ActivateTab = 7 }) },
	{ key = "9", mods = "LEADER", action = wezterm.action({ ActivateTab = 8 }) },
	{ key = "&", mods = "LEADER|SHIFT", action = wezterm.action({ CloseCurrentTab = { confirm = true } }) },
	{ key = "d", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
	{ key = "x", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
	{ key = "-", mods = "LEADER", action = wezterm.action.ShowLauncher },
	{ key = "PageUp", mods = "SHIFT", action = act.ScrollByPage(-1) },
	{ key = "PageDown", mods = "SHIFT", action = act.ScrollByPage(1) },
	{ key = "U", mods = "SHIFT|CTRL", action = act.ScrollByPage(-0.5) },
	{ key = "D", mods = "SHIFT|CTRL", action = act.ScrollByPage(0.5) },
	{ key = ";", mods = "CTRL|SHIFT", action = act.IncreaseFontSize },
	{ key = ":", mods = "CTRL|SHIFT", action = act.DecreaseFontSize },
	{
		key = "H",
		mods = "SHIFT|CTRL",
		action = act.Search("CurrentSelectionOrEmptyString"),
	},
	-- { key = "/", mods = "LEADER", action = wezterm.action.ActivateSearchMode },
	{ key = "/", mods = "LEADER|SHIFT", action = act({ Search = { CaseSensitiveString = "" } }) },
	{ key = "Enter", mods = "LEADER", action = wezterm.action.ActivateCopyMode },
}

config.mouse_bindings = {
	{
		event = { Down = { streak = 1, button = "Middle" } },
		mods = "NONE",
		action = act.PasteFrom("Clipboard"),
	},
}

config.key_tables = {
	-- Defines the keys that are active in our resize-pane mode.
	-- Since we're likely to want to make multiple adjustments,
	-- we made the activation one_shot=false. We therefore need
	-- to define a key assignment for getting out of this mode.
	-- 'resize_pane' here corresponds to the name="resize_pane" in
	-- the key assignments above.
	resize_pane = {
		{ key = "LeftArrow", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "H", action = act.AdjustPaneSize({ "Left", 1 }) },

		{ key = "RightArrow", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "L", action = act.AdjustPaneSize({ "Right", 1 }) },

		{ key = "UpArrow", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "K", action = act.AdjustPaneSize({ "Up", 1 }) },

		{ key = "DownArrow", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "J", action = act.AdjustPaneSize({ "Down", 1 }) },

		-- Cancel the mode by pressing escape
		{ key = "Escape", action = "PopKeyTable" },
	},

	-- Defines the keys that are active in our activate-pane mode.
	-- 'activate_pane' here corresponds to the name="activate_pane" in
	-- the key assignments above.
	activate_pane = {
		{ key = "LeftArrow", action = act.ActivatePaneDirection("Left") },
		{ key = "h", action = act.ActivatePaneDirection("Left") },

		{ key = "RightArrow", action = act.ActivatePaneDirection("Right") },
		{ key = "l", action = act.ActivatePaneDirection("Right") },

		{ key = "UpArrow", action = act.ActivatePaneDirection("Up") },
		{ key = "k", action = act.ActivatePaneDirection("Up") },

		{ key = "DownArrow", action = act.ActivatePaneDirection("Down") },
		{ key = "j", action = act.ActivatePaneDirection("Down") },

		{ key = "Escape", action = "PopKeyTable" },
	},

	tmux = {
		{ key = "a", mods = "LEADER|CTRL", action = wezterm.action({ SendString = "\x01" }) },
		{ key = "-", mods = "LEADER", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
		{
			key = "\\",
			mods = "LEADER",
			action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
		},
		{ key = "s", mods = "LEADER", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
		{ key = "h", mods = "LEADER", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
		{ key = "v", mods = "LEADER", action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
		{ key = "o", mods = "LEADER", action = "TogglePaneZoomState" },
		{ key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
		{ key = "c", mods = "LEADER", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
		{ key = "h", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
		{ key = "j", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
		{ key = "k", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
		{ key = "l", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
		{ key = "H", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Left", 5 } }) },
		{ key = "J", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Down", 5 } }) },
		{ key = "K", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Up", 5 } }) },
		{ key = "L", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Right", 5 } }) },
		{ key = "1", mods = "LEADER", action = wezterm.action({ ActivateTab = 0 }) },
		{ key = "2", mods = "LEADER", action = wezterm.action({ ActivateTab = 1 }) },
		{ key = "3", mods = "LEADER", action = wezterm.action({ ActivateTab = 2 }) },
		{ key = "4", mods = "LEADER", action = wezterm.action({ ActivateTab = 3 }) },
		{ key = "5", mods = "LEADER", action = wezterm.action({ ActivateTab = 4 }) },
		{ key = "6", mods = "LEADER", action = wezterm.action({ ActivateTab = 5 }) },
		{ key = "7", mods = "LEADER", action = wezterm.action({ ActivateTab = 6 }) },
		{ key = "8", mods = "LEADER", action = wezterm.action({ ActivateTab = 7 }) },
		{ key = "9", mods = "LEADER", action = wezterm.action({ ActivateTab = 8 }) },
		{ key = "&", mods = "LEADER|SHIFT", action = wezterm.action({ CloseCurrentTab = { confirm = true } }) },
		-- { key = "d", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
		{ key = "x", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
	},
	copy_mode = {
		{ key = "c", mods = "CTRL", action = act.CopyMode("Close") },
		{ key = "g", mods = "CTRL", action = act.CopyMode("Close") },
		{ key = "q", mods = "NONE", action = act.CopyMode("Close") },
		{ key = "Escape", mods = "NONE", action = act.CopyMode("Close") },

		{ key = "h", mods = "NONE", action = act.CopyMode("MoveLeft") },
		{ key = "j", mods = "NONE", action = act.CopyMode("MoveDown") },
		{ key = "k", mods = "NONE", action = act.CopyMode("MoveUp") },
		{ key = "l", mods = "NONE", action = act.CopyMode("MoveRight") },

		{ key = "LeftArrow", mods = "NONE", action = act.CopyMode("MoveLeft") },
		{ key = "DownArrow", mods = "NONE", action = act.CopyMode("MoveDown") },
		{ key = "UpArrow", mods = "NONE", action = act.CopyMode("MoveUp") },
		{ key = "RightArrow", mods = "NONE", action = act.CopyMode("MoveRight") },

		{ key = "RightArrow", mods = "ALT", action = act.CopyMode("MoveForwardWord") },
		{ key = "f", mods = "ALT", action = act.CopyMode("MoveForwardWord") },
		{ key = "Tab", mods = "NONE", action = act.CopyMode("MoveForwardWord") },
		{ key = "w", mods = "NONE", action = act.CopyMode("MoveForwardWord") },

		{ key = "LeftArrow", mods = "ALT", action = act.CopyMode("MoveBackwardWord") },
		{ key = "b", mods = "ALT", action = act.CopyMode("MoveBackwardWord") },
		{ key = "Tab", mods = "SHIFT", action = act.CopyMode("MoveBackwardWord") },
		{ key = "b", mods = "NONE", action = act.CopyMode("MoveBackwardWord") },

		{ key = "0", mods = "NONE", action = act.CopyMode("MoveToStartOfLine") },
		{ key = "Enter", mods = "NONE", action = act.CopyMode("MoveToStartOfNextLine") },

		{ key = "$", mods = "NONE", action = act.CopyMode("MoveToEndOfLineContent") },
		{ key = "$", mods = "SHIFT", action = act.CopyMode("MoveToEndOfLineContent") },
		{ key = "^", mods = "NONE", action = act.CopyMode("MoveToStartOfLineContent") },
		{ key = "^", mods = "SHIFT", action = act.CopyMode("MoveToStartOfLineContent") },
		{ key = "m", mods = "ALT", action = act.CopyMode("MoveToStartOfLineContent") },

		{ key = " ", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Cell" }) },
		{ key = "v", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Cell" }) },
		{ key = "V", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Line" }) },
		{ key = "V", mods = "SHIFT", action = act.CopyMode({ SetSelectionMode = "Line" }) },
		{ key = "v", mods = "CTRL", action = act.CopyMode({ SetSelectionMode = "Block" }) },

		{ key = "G", mods = "NONE", action = act.CopyMode("MoveToScrollbackBottom") },
		{ key = "G", mods = "SHIFT", action = act.CopyMode("MoveToScrollbackBottom") },
		{ key = "g", mods = "NONE", action = act.CopyMode("MoveToScrollbackTop") },

		{ key = "H", mods = "NONE", action = act.CopyMode("MoveToViewportTop") },
		{ key = "H", mods = "SHIFT", action = act.CopyMode("MoveToViewportTop") },
		{ key = "M", mods = "NONE", action = act.CopyMode("MoveToViewportMiddle") },
		{ key = "M", mods = "SHIFT", action = act.CopyMode("MoveToViewportMiddle") },
		{ key = "L", mods = "NONE", action = act.CopyMode("MoveToViewportBottom") },
		{ key = "L", mods = "SHIFT", action = act.CopyMode("MoveToViewportBottom") },

		{ key = "o", mods = "NONE", action = act.CopyMode("MoveToSelectionOtherEnd") },
		{ key = "O", mods = "NONE", action = act.CopyMode("MoveToSelectionOtherEndHoriz") },
		{ key = "O", mods = "SHIFT", action = act.CopyMode("MoveToSelectionOtherEndHoriz") },

		{ key = "PageUp", mods = "NONE", action = act.CopyMode("PageUp") },
		{ key = "PageDown", mods = "NONE", action = act.CopyMode("PageDown") },

		{ key = "b", mods = "CTRL", action = act.CopyMode("PageUp") },
		{ key = "f", mods = "CTRL", action = act.CopyMode("PageDown") },

		-- Enter y to copy and quit the copy mode.
		{
			key = "y",
			mods = "NONE",
			action = act.Multiple({
				act.CopyTo("ClipboardAndPrimarySelection"),
				act.CopyMode("Close"),
			}),
		},
		-- Enter search mode to edit the pattern.
		-- When the search pattern is an empty string the existing pattern is preserved
		{ key = "/", mods = "SHIFT", action = act({ Search = { CaseSensitiveString = "" } }) },
		{ key = "?", mods = "NONE", action = act({ Search = { CaseInSensitiveString = "" } }) },
		{ key = "n", mods = "CTRL", action = act({ CopyMode = "NextMatch" }) },
		{ key = "p", mods = "CTRL", action = act({ CopyMode = "PriorMatch" }) },
	},

	search_mode = {
		{ key = "Escape", mods = "NONE", action = act({ CopyMode = "Close" }) },
		-- Go back to copy mode when pressing enter, so that we can use unmodified keys like "n"
		-- to navigate search results without conflicting with typing into the search area.
		{ key = "Enter", mods = "NONE", action = "ActivateCopyMode" },
		{ key = "c", mods = "CTRL", action = "ActivateCopyMode" },
		{ key = "n", mods = "CTRL", action = act({ CopyMode = "NextMatch" }) },
		{ key = "p", mods = "CTRL", action = act({ CopyMode = "PriorMatch" }) },
		{ key = "r", mods = "CTRL", action = act.CopyMode("CycleMatchType") },
		{ key = "u", mods = "CTRL", action = act.CopyMode("ClearPattern") },
	},
}
config.disable_default_key_bindings = true

-- config.font = wezterm.font("JetBrainsMonoNerdFontMono", { weight = "DemiBold" })
config.font = wezterm.font("JetBrainsMonoNerdFont")
-- config.font = wezterm.font("JetBrainsMonoNerdFontMono")
config.font_size = 9.2
-- config.font_size = 10.2
-- config.font_size = 6.
-- config.color_scheme = "Gruvbox Material (Gogh)"
-- config.color_scheme = "GruvboxDark"
config.color_scheme = "GruvboxDarkHard"
-- config.color_scheme = "Gruvbox Material (Gogh)"
-- config.color_scheme = "Gruvbox Dark (Gogh)"
config.window_background_opacity = 0.7
-- config.enable_wayland = false
config.enable_wayland = true
config.front_end = "WebGpu"
-- config.font_antialias = "Subpixel" -- None, Greyscale, Subpixel
-- config.font_hinting = "Full" -- None, Vertical, VerticalSubpixel, Full
-- config.enable_tab_bar = false
-- config.freetype_load_flags = "NO_HINTING|MONOCHROME"
config.freetype_load_target = "Light"
config.default_cursor_style = "BlinkingBar"
config.freetype_load_target = "Light"
config.use_fancy_tab_bar = false
-- config.use_fancy_tab_bar = true
config.cursor_blink_rate = 800
config.cursor_blink_ease_in = "Linear"
config.cursor_blink_ease_out = "Linear"
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.enable_scroll_bar = true
config.window_padding = {
	left = 2,
	right = 2,
	top = 2,
	bottom = 2,
}
config.window_frame = {
	-- The font used in the tab bar.
	-- Roboto Bold is the default; this font is bundled
	-- with wezterm.
	-- Whatever font is selected here, it will have the
	-- main font setting appended to it to pick up any
	-- fallback fonts you may have used there.
	-- font = wezterm.font("JetBrainsMonoNerdFontMono", { weight = "Regular" }),
	font = wezterm.font("JetBrainsMonoNerdFont", { weight = "DemiBold" }),

	-- The size of the font in the tab bar.
	-- Default to 10.0 on Windows but 12.0 on other systems
	font_size = 10.0,

	-- The overall background color of the tab bar when
	-- the window is focused
	active_titlebar_bg = "#333333",

	-- The overall background color of the tab bar when
	-- the window is not focused
	inactive_titlebar_bg = "#333333",
}
wezterm.on("user-var-changed", function(window, pane, name, value)
	local overrides = window:get_config_overrides() or {}
	if name == "ZEN_MODE" then
		local incremental = value:find("+")
		local number_value = tonumber(value)
		if incremental ~= nil then
			while number_value > 0 do
				window:perform_action(wezterm.action.IncreaseFontSize, pane)
				number_value = number_value - 1
			end
			overrides.enable_tab_bar = false
		elseif number_value < 0 then
			window:perform_action(wezterm.action.ResetFontSize, pane)
			overrides.font_size = nil
			overrides.enable_tab_bar = true
		else
			overrides.font_size = number_value
			overrides.enable_tab_bar = false
		end
	end
	window:set_config_overrides(overrides)
end)
config.colors = {
	tab_bar = {
		-- The color of the inactive tab bar edge/divider
		inactive_tab_edge = "#575757",
		background = "#282828",
		active_tab = {
			bg_color = "#32302f",
			fg_color = "#fbf1c7",
		},
		inactive_tab = {
			bg_color = "#282828",
			fg_color = "#928374",
		},
		inactive_tab_hover = {
			bg_color = "#d65d0e",
			fg_color = "#282828",
		},
		new_tab = {
			bg_color = "#32302f",
			fg_color = "#fbf1c7",
		},
		new_tab_hover = {
			bg_color = "#fe8019",
			fg_color = "#fbf1c7",
		},
	},
}
config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.9,
}
return config
