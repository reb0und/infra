{ pkgs, config, ... }:

{
	imports = [
		./git.nix
		./nvim.nix
	];
}
