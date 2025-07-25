{ pkgs, config, home, inputs, ... }:

{
	imports = [ inputs.spicetify-nix.homeManagerModules.default ];

	programs.spicetify.enable = true;
}
