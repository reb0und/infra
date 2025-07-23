{ pkgs, config, ... }:

{
	imports = [
		./c.nix
		./lua.nix
	];
}
