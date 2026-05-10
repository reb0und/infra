{ config, pkgs, ... }:

{
	environment.systemPackages = [ pkgs.cgit ];

	services.cgit.main = {
		enable = true;

		nginx.virtualHost = "cgit.localhost";
		nginx.location = "/cgit";

		scanPath = "/cgit";
	};

	# create cfg symlink

	# systemd.user.services.cgit = {
	# 	description = "cgit"; enable = true;
	# 	# after = [ "network.target" ];
	# 	path = [ pkgs.cgit ];
	# 	serviceConfig = {
	# 		ExecStart = ''
	# 			${pkgs.qemu}
	# 		'';
	# 		Restart = "always";
	# 		KillMode = "process";
	# 		TimeoutStopSec = 30;
	# 		StandardInput = "null";
	# 	};
	# 	wantedBy = [ "default.target" ];
	# };
}
