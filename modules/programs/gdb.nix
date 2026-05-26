
{ pkgs, config, home, ... }:

{
	programs.gdb.enable = true;

	home.file.".config/gdb".source = config.lib.file.mkOutOfStoreSymlink "/home/dominic/dotfiles/gdb";
}
