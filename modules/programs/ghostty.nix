{ pkgs, config, home, ... }:

{
	programs.ghostty.enable = true;

	home.file.".config/ghostty".source = config.lib.file.mkOutOfStoreSymlink "/home/dominic/dotfiles/ghostty";
}
