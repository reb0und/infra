{ pkgs, config, home, ... }:

{
	home.packages = [
		rose-pine-hyprcursor.packages.${pkgs.system}.default;
	];
}
