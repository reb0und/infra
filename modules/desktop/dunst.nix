{ pkgs, config, home, ... }:

{
	services.dunst.enable = true;

	home.packages = [ pkgs.libnotify ];

	home.file.".config/dunst".source = config.lib.file.mkOutOfStoreSymlink "/home/dominic/dotfiles/dunst";
}
