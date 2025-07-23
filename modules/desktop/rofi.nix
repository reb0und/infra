{ pkgs, config, home, ... }:

{
	home.packages = [ pkgs.rofi-wayland ];

	home.file.".config/rofi".source = config.lib.file.mkOutOfStoreSymlink "/home/dominic/dotfiles/rofi";
}
