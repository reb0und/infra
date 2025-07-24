{ pkgs, config, home, ... }:

{
	home.packages = [ pkgs.hypridle ];

	home.file.".config/hypr/hypridle.conf".source = config.lib.file.mkOutOfStoreSymlink "/home/dominic/dotfiles/hypr/hypridle.conf";
}
