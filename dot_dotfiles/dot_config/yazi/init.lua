require("eza-preview"):setup()

require("starship"):setup()

require("keyjump"):setup {
	icon_fg = "#fda1a1",
}

require("relative-motions"):setup({ show_numbers="relative", show_motion = true })

require("archivemount"):setup()

require("full-border"):setup()

require("githead"):setup()

require("git"):setup()

if os.getenv("NVIM") then
	require("hide-preview"):entry()
end
