{ pkgs, config, home, ... }:

{
	programs.waybar.enable = true;

	home.file.".config/waybar".source = config.lib.file.mkOutOfStoreSymlink "/home/dominic/dotfiles/waybar";
}
