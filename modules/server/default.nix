{ config, pkgs, ... }:

{
	imports = [
		./cgit.nix
		./k3s.nix
	];
}
