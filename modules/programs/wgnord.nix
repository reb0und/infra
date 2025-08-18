{ pkgs, config, home, ... }:

{
	home.packages = with pkgs; [ 
		wgnord
		openresolv
		wireguard-tools
	];
}
