{ pkgs, config, home, ... }:

{
	home.packages = [ pkgs.hyprsunset ];
	
	home.file.".config/hypr/hyprsunset.conf".source = config.lib.file.mkOutOfStoreSymlink "/home/dominic/dotfiles/hypr/hyprsunset.conf";
}
