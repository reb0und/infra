{ config, pkgs, ... }:

{
	systemd.user.services.hajin-vm = {
		description = "Hajin VM"; enable = true;
		after = [ "network.target" ];
		servicesConfig = {
			ExecStart = ''
				qemu-x86_64 \
				-nographic \
				-kda /home/dominic/images/hajin/hajin.qcow2 \
				-m 4096 \
				-ssmp 4 \
				-enable-kvm
			'';
			Restart = "always";
			KillMode = "process";
			TimeoutStopSec = 30;
			StandardInput = null;
		};
		wantedBy = [ "default.target" ];
	};
}
