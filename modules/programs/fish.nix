{ pkgs, config, home, ... }:

{
	home.packages = [ pkgs.fish ];
	
	home.file.".config/fish/config.fish".source = config.lib.file.mkOutOfStoreSymlink "/home/dominc/dotfiles/fish/config.fish";
}
