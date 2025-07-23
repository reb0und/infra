{ pkgs, config, home, ... }:

{
	home.packages = with pkgs; [
		wget
		unzip
		tree-sitter
		ripgrep
	];
}
