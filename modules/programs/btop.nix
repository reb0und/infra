{ pkgs, config, home, ... }:

{
	programs.btop.enable = true;

	home.file.".config/btop".source = config.lib.mkOutOfStoreSymlink "/home/dominic/dotfiles/btop";
}
