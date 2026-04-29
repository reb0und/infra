{ pkgs, pkgs-unstable, home, inputs, ... }: 
let
	pkgs-unstable = import inputs.nixpkgs-unstable {
		system = pkgs.stdenv.hostPlatform.system;
	};
in
{
	home.packages = [
		pkgs.zulip
		pkgs-unstable.zulip-term
	];
}
