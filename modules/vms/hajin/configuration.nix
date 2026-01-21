{ config, pkgs, ... }:

{
	boot.loader = {
		systemd.enable = true;
		efi.canTouchEfiVariables = true;
	};

	users.users.hajin = {
		isNormalUser = true;
		extraGroups = [ "wheel" ];
		initialPassword = "hi";
	};

	environment.systemPackages = with pkgs; [
		fish
		git
		vim
	];

	system.stateVersion = "25.11";
}
