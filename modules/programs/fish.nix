{ pkgs, config, home, ... }:

{
	home.packages = [ pkgs.fish ];
	
	home.file.".config/fish/config.fish".source = config.lib.file.mkOutOfStoreSymlink "/home/dominic/dotfiles/fish/config.fish";
	home.file.".config/fish/functions".source = config.lib.file.mkOutOfStoreSymlink "/home/dominic/dotfiles/fish/functions";
}
