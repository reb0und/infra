{ pkgs, config, home, ... }:

{
	programs.wlogout.enable = true;

	home.file.".config/wlogout".source = config.lib.file.mkOutOfStoreSymlink "/home/dominic/dotfiles/wlogout";
}
