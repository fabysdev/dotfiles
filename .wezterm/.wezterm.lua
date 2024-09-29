local wezterm = require("wezterm")

local config = {
	default_prog = { "zsh", "bash" },
	color_scheme = "Campbell (Gogh)",
	disable_default_key_bindings = false,
	hide_tab_bar_if_only_one_tab = true,
	font_size = 12,
	line_height = 1.2,
	window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
	window_background_opacity = 1,
	audible_bell = "Disabled",
	window_close_confirmation = "NeverPrompt",
	default_cursor_style = "BlinkingBar",
	initial_cols = 120,
	initial_rows = 25,
}

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{
		key = "v",
		mods = "CTRL",
		action = wezterm.action({ PasteFrom = "Clipboard" }),
	},
	{
		key = "c",
		mods = "CTRL",
		action = wezterm.action_callback(function(window, pane)
			local selection_text = window:get_selection_text_for_pane(pane)
			local is_selection_active = string.len(selection_text) ~= 0
			if is_selection_active then
				window:perform_action(wezterm.action.CopyTo("ClipboardAndPrimarySelection"), pane)
			else
				window:perform_action(wezterm.action.SendKey({ key = "c", mods = "CTRL" }), pane)
			end
		end),
	},
}

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.wsl_domains = {
		{
			name = "WSL:Default",
			distribution = "Ubuntu-22.04",
			default_cwd = "~",
		},
	}

	config.default_domain = "WSL:Default"
end

config.colors = { foreground = "#CCCCCC", selection_bg = "rgba(255 255 255 50%)" }
config.font = wezterm.font("FiraCode Nerd Font", { weight = "Regular", italic = false })

return config
