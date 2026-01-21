{ config, pkgs, ... }:

{
	boot.loader = {
		grub.enable = true;
		grub.version = 2;
		grub.device = "/dev/vda";
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
