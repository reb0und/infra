{ pkgs, config, home, ... }:

{
	 home.packages = with pkgs; [
		pyright-langserver
	];
}
