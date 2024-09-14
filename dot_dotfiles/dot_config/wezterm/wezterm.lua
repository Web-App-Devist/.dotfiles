local helpers = require("helpers")
local colorscheme = require("colorscheme")
local tab_bar = require("tab-bar")
local background = require("background")
local launch = require("launch")
local font = require("font")
local launcher_menu = require("launcher-menu")
local config = {
	enable_wayland = false,
}
helpers.apply_to_config(config)
colorscheme.apply_to_config(config)
tab_bar.apply_to_config(config)
background.apply_to_config(config)
launch.apply_to_config(config)
font.apply_to_config(config)
launcher_menu.apply_to_config(config)
return config
