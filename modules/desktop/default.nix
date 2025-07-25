{ pkgs, config, ... }:

{
	imports = [
		./hyprland.nix
		./waybar.nix
		./mako.nix
		./swww.nix
		./rofi.nix
		./nmapplet.nix
		./hyprlock.nix
		./hypridle.nix
		./hyprsunset.nix
		./hyprcursor.nix
	];
}
