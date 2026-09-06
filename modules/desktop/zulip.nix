{ pkgs, pkgs-unstable, home, inputs, config, ... }: 
let
	pkgs-unstable = import inputs.nixpkgs-unstable {
		system = pkgs.stdenv.hostPlatform.system;
	};
in
{
	home.packages = [
		pkgs.zulip
		# pkgs-unstable.zulip-term
	];

	sops.secrets.zuliprc = {
		path = "/home/dominic/.config/zulip-term/.zuliprc";
	};
}
