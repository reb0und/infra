{ config, pkgs, ... }:

{
	imports = [
		./configuration.nix
		./vm.nix
	];
}
