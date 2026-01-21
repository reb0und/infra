{ config, pkgs, ... }:

{
	virtualisation = {
		libvirtd = {
			enable = true;
			qemu = true;
		};
		qemu = {
			defaultMemorySize = 2048;
			defaultCores = 2;
		};
	};
}
