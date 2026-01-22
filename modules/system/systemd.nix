 config, pkgs, ... }:

{
	systemd.user.services.hajin-vm = {
		description = "Hajin VM"; enable = true;
		after = [ "network.target" ];
		path = [ pkgs.qemu ];
		serviceConfig = {
			ExecStart = ''
				qemu-system-x86_64 \
				-nographic \
				-hda /home/dominic/images/hajin/hajin.qcow2 \
				-m 4096 \
				-smp 4 \
				-enable-kvm
			'';
			Restart = "always";
			KillMode = "process";
			TimeoutStopSec = 30;
			StandardInput = "null";
		};
		wantedBy = [ "default.target" ];
	};
}
