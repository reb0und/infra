{ pkgs, config, home, ... }:

{
	home.packages = with pkgs; [
		rustup
	];
}
