{ config, pkgs, ... }:

{
	imports = [
		./nix-ld.nix
		./sops.nix
	];
}
