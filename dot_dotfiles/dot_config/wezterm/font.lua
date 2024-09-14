local wezterm = require("wezterm")

local module = {}
function module.apply_to_config(config)
	config.font_size = 14.0
	config.cell_width = 1.0
	config.line_height = 1.0

	config.font = wezterm.font("LigaInputMono Nerd Font", { weight = "Light" })
	config.font_rules = {
		{
			intensity = "Bold",
			italic = true,
			font = wezterm.font("LigaCartographCF Nerd Font", {
				weight = "Light",
				style = "Italic",
			}),
		},
		{
			italic = false,
			intensity = "Bold",
			font = wezterm.font("LigaOperatorMono Nerd Font", {
				weight = "Light",
				style = "Italic",
			}),
		},
		{
			italic = true,
			intensity = "Normal",
			font = wezterm.font("LigaOperatorMono Nerd Font", {
				style = "Italic",
				weight = "Light",
			}),
		},
	}
end

-- return our module table
return module
