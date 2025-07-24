{ pkgs, config, home, ... }:

{
	programs.hypridle.enable = true;

	home.file.".config/hypridle.conf".source = config.lib.file.mkOutOfStoreSymlink "/home/dominic/dotfiles/hypridle.conf";
}
