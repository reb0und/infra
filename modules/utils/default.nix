{ pkgs, config, home, ... }:

{
	home.packages = [
		wget
		unzip
		treesitter
		ripgrep
	];
}
