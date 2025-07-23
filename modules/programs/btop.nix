{ pkgs, config, home, ... }:

{
	programs.btop.enable = true;

	home.file.".config/btop" = config.lib.mkOutOfStoreSymLink "/home/dominic/dotfiles/btop"
}
