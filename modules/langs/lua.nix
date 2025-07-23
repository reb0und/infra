{ pkgs, config, home, ... }:

{
	home.packages = with pkgs; [
		lua51Packages.lua
		lua54Packages.luarocks
		stylua
	];
}
