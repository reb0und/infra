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

	virtualisation.qemu = {
		diskSize = 30 * 1024;
		memorySize = 4096;
		cores = 4;
	};

	system.stateVersion = "25.11";
}
