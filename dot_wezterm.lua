-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Colour Scheme
-- config.font = wezterm.font("FiraCode")
config.font = wezterm.font("JetBrains Mono")
config.color_scheme = "Catppuccin Mocha"

-- WSL Domains
local wsl_domains = wezterm.default_wsl_domains()

-- SSH Domains
config.ssh_domains = {
	{
		-- This name identifies the domain
		name = "rackzar",
		-- The hostname or address to coonect to. Will be used to match settings
		-- from your ssh config file
		remote_address = "rackzar.snth.co.za",
		-- The username to use on the remote host
		username = "snth",
	},
}

-- Default Domain
config.default_domain = "WSL:Ubuntu-20.04"
-- config.default_domain = "rackzar"

--Default Program
--config.default_prog = { "wslhost.exe" }

-- and finally, return the configuration to wezterm
return config
