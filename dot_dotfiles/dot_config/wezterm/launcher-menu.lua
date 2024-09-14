local wezterm = require("wezterm")

local module = {}
function module.apply_to_config(config)
	config.keys = {
		{ key = "l", mods = "ALT", action = wezterm.action.ShowLauncher },
	}
	config.launch_menu = {
		{
			label = "Bash",
			args = { "bash", "-l" },
			-- cwd = "/some/path"
			-- set_environment_variables = { FOO = "bar" },
		},
		{
			label = "ZSH",
			args = { "zsh", "-l" },
			-- cwd = "/some/path"
			-- set_environment_variables = { FOO = "bar" },
		},
		{
			label = "Fish",
			args = { "fish", "-l" },
			-- cwd = "/some/path"
			-- set_environment_variables = { FOO = "bar" },
		},
	}
end

-- return our module table
return module
