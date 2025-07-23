{ pkgs, config, home, ... }:

{
	services.mako.enable = true;

	home.packages = [ pkgs.libnotify ];

	home.file.".config/mako".source = config.lib.file.mkOutOfStoreSymlink "/home/dominic/dotfiles/mako";
}
