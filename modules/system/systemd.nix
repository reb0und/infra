{ config, pkgs, ... }:

{
	systemd.user.services.test = {
		description = "Test VM"; enable = true;
		after = [ "network.target" ];
		path = [ pkgs.qemu ];
		serviceConfig = {
			ExecStart = ''
				${pkgs.qemu}/bin/qemu-system-x86_64 \
				-nographic \
				-hda /home/dominic/images/test/test.qcow2 \
				-m 512 \
				-smp 1 \
				-netdev user,id=net0,hostfwd=tcp::11222-:22 \
				-device virtio-net-pci,netdev=net0 \
				-enable-kvm
			'';
			Restart = "always";
			KillMode = "process";
			TimeoutStopSec = 30;
			StandardInput = "null";
		};
		wantedBy = [ "default.target" ];
	};

	systemd.user.services.hajin-vm = {
		description = "Hajin VM"; enable = true;
		after = [ "network.target" ];
		path = [ pkgs.qemu ];
		serviceConfig = {
			ExecStart = ''
				${pkgs.qemu}/bin/qemu-system-x86_64 \
				-nographic \
				-hda /home/dominic/images/hajin/hajin.qcow2 \
				-m 512 \
				-smp 1 \
				-netdev user,id=net0,hostfwd=tcp::11223-:22 \
				-device virtio-net-pci,netdev=net0 \
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
