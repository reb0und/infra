{ config, pkgs, ... }:

{
	virtualisation.qemu.vms.hajin = {
		description = "Hajin's development machine";
		memorySize = 4096;
		cores = 4;
		diskSize = 30 * 1024;
		diskFormat = "qcow2";
		configuration = ./configuation.nix;
		network.user = true;
		autoStart = true;
	};
}
