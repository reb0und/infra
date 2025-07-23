{ pkgs, config, home, ... }:

{
	services.mako.enable = true;

	home.file".config/mako".source = config.lib.file.mkOutOfStoreSymlink "/home/dominic/config/mako";
}
