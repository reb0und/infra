{ pkgs, config, home, inputs, ... }:

{
	home.packages = [
		inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
	];
}
