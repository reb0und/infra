{ config, pkgs, ... }:

{
	boot.loader = {
		systemd-boot.enable = true;
		efi.canTouchEfiVariables = true;
	};

	users.users.hajin = {
		isNormalUser = true;
		extraGroups = [ "wheel" "docker" ];
		initialPassword = "hi";
	};

	environment.systemPackages = with pkgs; [
		fish
		git
		vim
		qemu_kvm
	];

	virtualisation = {
		diskSize = 30 * 1024;
		docker.enable = true;
	};

	services = {
		openssh.enable = true;
		tailscale.enable = true;
	};

	system.stateVersion = "25.11";
}
