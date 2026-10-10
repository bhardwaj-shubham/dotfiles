local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder()

-- ============================================================
-- Appearance
-- ============================================================

config.color_scheme = "kanagawabones"

config.window_background_opacity = 0.90

config.window_padding = {
	left = 8,
	right = 8,
	top = 6,
	bottom = 6,
}

config.enable_tab_bar = false

config.selection_word_boundary = " \t\n{}[]()\"'`,;:!"

config.hide_mouse_cursor_when_typing = true

-- ============================================================
-- Fonts
-- ============================================================

config.font = wezterm.font_with_fallback({
	"Maple Mono NF",
	"JetBrainsMono NFM",
	-- "Rec Mono Casual",
	-- "Iosevka NF Medium",
	-- "Lilex Nerd Font Mono Medium",
	"CaskaydiaCove NF",
})

config.font_size = 14
config.line_height = 1.25

-- ============================================================
-- Shell
-- ============================================================

config.default_prog = {
	"C:/Program Files/Git/bin/bash.exe",
	"-l",
}

-- Performance
config.front_end = "WebGpu"

-- Scrollback
config.scrollback_lines = 20000

-- ============================================================
-- Keybindings
-- ============================================================

config.leader = {
	key = "Space",
	mods = "CTRL",
	timeout_milliseconds = 1000,
}

config.keys = {
	-- Splits
	{
		key = "v",
		mods = "LEADER",
		action = act.SplitVertical({
			domain = "CurrentPaneDomain",
		}),
	},
	{
		key = "s",
		mods = "LEADER",
		action = act.SplitHorizontal({
			domain = "CurrentPaneDomain",
		}),
	},

	-- Pane control
	{
		key = "z",
		mods = "LEADER",
		action = act.TogglePaneZoomState,
	},

	-- Pane navigation
	{
		key = "h",
		mods = "CTRL|SHIFT",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "j",
		mods = "CTRL|SHIFT",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "CTRL|SHIFT",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "l",
		mods = "CTRL|SHIFT",
		action = act.ActivatePaneDirection("Right"),
	},

	-- Pane resizing
	{
		key = "H",
		mods = "LEADER|SHIFT",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "J",
		mods = "LEADER|SHIFT",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{
		key = "K",
		mods = "LEADER|SHIFT",
		action = act.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "L",
		mods = "LEADER|SHIFT",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},

	-- Tabs
	{
		key = "t",
		mods = "LEADER",
		action = act.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "x",
		mods = "LEADER",
		action = act.CloseCurrentTab({ confirm = true }),
	},
	{
		key = "n",
		mods = "LEADER",
		action = act.ActivateTabRelative(1),
	},
	{
		key = "p",
		mods = "LEADER",
		action = act.ActivateTabRelative(-1),
	},

	-- Clipboard
	{
		key = "c",
		mods = "CTRL|SHIFT",
		action = act.CopyTo("Clipboard"),
	},
	{
		key = "v",
		mods = "CTRL|SHIFT",
		action = act.PasteFrom("Clipboard"),
	},

	-- Shell integration
	{
		key = "t",
		mods = "CTRL",
		action = act.SendString("\x14"),
	},
	{
		key = "c",
		mods = "ALT",
		action = act.SendString("\x1bc"),
	},
}

return config
