{ pkgs, config, home, inputs, ... }:

{
	home.file.".config/hypr/hyprland.lua".source = config.lib.file.mkOutOfStoreSymlink "/home/dominic/dotfiles/hypr/hyprland.lua";
}
