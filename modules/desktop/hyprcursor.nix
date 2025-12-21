{ pkgs, config, home, inputs, ... }:

{
	home.packages = [
		inputs.rose-pine-hyprcursor.packages.${pkgs.stdenv.hostPlatform.system}.default
	];
}
