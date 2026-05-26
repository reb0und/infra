
{ pkgs, config, home, ... }:

{
	home.file.".config/gdb".source = config.lib.file.mkOutOfStoreSymlink "/home/dominic/dotfiles/gdb";
}
