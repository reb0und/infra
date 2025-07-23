{ pkgs, config, home, ... }:

{
	home.packages = with pkgs; [
		clang
		clang-tools
	];
}
