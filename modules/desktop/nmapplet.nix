{ pkgs, config, home, ... }:

{
	home.packages = [
		pkgs.networkmanagerapplet
	];
}
