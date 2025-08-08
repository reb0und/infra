
{ pkgs, config, home, ... }:

{
	programs.alacritty.enable = true;

	home.file.".config/alacritty".source = config.lib.file.mkOutOfStoreSymlink "/home/dominic/dotfiles/alacritty";
}
