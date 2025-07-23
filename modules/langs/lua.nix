{ pkgs, config, home, ... }:

{
	home.packages = with pkgs; [
		lua54Packages.luarocks
		stylua
	];
}
