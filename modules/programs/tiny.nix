{ pkgs, config, home, ... }:

{
	programs.tiny.enable = true;

	home.file.".config/tiny/config.yml".source = config.lib.file.mkOutOfStoreSymlink "/home/dominic/dotfiles/tiny/config.yml";
}
