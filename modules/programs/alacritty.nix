
{ pkgs, config, home, ... }:

{
	programs.alacritty.enable = true;

	# home.file.".config/btop".source = config.lib.file.mkOutOfStoreSymlink "/home/dominic/dotfiles/btop";
}
