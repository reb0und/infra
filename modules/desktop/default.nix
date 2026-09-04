{ pkgs, config, ... }:

{
	imports = [
		./hyprland.nix
		./waybar.nix
		./mako.nix
		./awww.nix
		./rofi.nix
		./nmapplet.nix
		./hyprlock.nix
		./hypridle.nix
		./hyprsunset.nix
		./hyprcursor.nix
		./wlogout.nix
		./zen.nix
		./spicetify.nix
		./vesktop.nix
		./zulip.nix
	];
}
