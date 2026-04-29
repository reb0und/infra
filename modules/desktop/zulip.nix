# @TODO: Add sops input for ZUlip secrets
{ pkgs, pkgs-unstable, home, inputs, config, ... }: 
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

	# @TODO: Change this to secret contents
	home.file.".config/zulip-term/.zuliprc".source = config.lib.file.mkOutOfStoreSymlink "/home/dominic/dotfiles/zulip-term/.zuliprc";
}
