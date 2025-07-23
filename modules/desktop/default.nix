{ pkgs, config, ... }:

{
	imports = [
		./hyprland.nix
		./waybar.nix
		./dunst.nix
	];
}
