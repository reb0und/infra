{ pkgs, config, home, ... }:

{
	home.packages = with pkgs; [
		lua
		lua54Packages.luarocks
		stylua
	];
}
