{ pkgs, config, home, ... }:

{
	programs.btop.enable = true;

	home.file.".config/btop".source = config.lib.mkOutOfStoreSymLink "/home/dominic/dotfiles/btop";
}
