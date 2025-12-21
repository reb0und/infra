{ pkgs, config, home, ... }:

{
	home.packages = [ pkgs.rofi ];

	home.file.".config/rofi".source = config.lib.file.mkOutOfStoreSymlink "/home/dominic/dotfiles/rofi";
}
