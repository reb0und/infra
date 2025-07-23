{ pkgs, config, ... }:

{
	imports = [
		./c.nix
		./lua.nix
		./go.nix
		./rust.nix
	];
}
