{ pkgs, config, home, ... }:

{
	 home.packages = with pkgs; [
		go
		gofumpt
		gopls
	];
}
