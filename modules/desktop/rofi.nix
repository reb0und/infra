{ pkgs, config, home, ... }:

{
	home.packages = [ pkgs.rofi ];

	home.file.".config/rofi".source = config.lib.file.mkOutOfStoreSymLink "/home/dominic/dotfiles/rofi";
}
