{ config, config, ... }:

{
	imports = [
		./qemu.nix
		./hajin
	];

	virtualisation = {
		libvirtd = {
			enable = true;
		};
	};
}
