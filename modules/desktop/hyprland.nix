{ pkgs, config, home, ... }:

{
	home.file.".config/hypr/hyprland.conf".source = config.lib.file.mkOutOfStoreSymlink "/home/dominic/dotfiles/hypr/hyprland.conf";
}
