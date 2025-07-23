{ pkgs, config, home, ... }:

{
	home.file.".config/hypr".source = config.lib.file.mkOutOfStoreSymlink "/home/dominic/dotfiles";
}
