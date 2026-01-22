{ config, pkgs, ... }:

{
	boot.loader = {
		grub.enable = true;
		grub.device = "/dev/vda";
	};

	users.users.hajin = {
		isNormalUser = true;
		extraGroups = [ "wheel" "docker" ];
		initialPassword = "hi";
		openssh.authorizedKeys.keys = [
			"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID0fQldW2bHZphOxdLX+qQgLmvGHX3yTx/JbpiW7RUc0 zero734kr@gmail.com"
		];
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
