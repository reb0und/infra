{ config, pkgs, ... }:

{
	environment.systemPackages = [ pkgs.cgit ];

	services.cgit.main = {
		enable = true;

		nginx.virtualHost = "cgit.localhost";
		nginx.location = "/";

		repos = {
			# @TODO: Link remote source here
			infra = {
				desc = "nixos cfg";
				path = "/srv/cgit/infra";
			};
		};

		settings = {
			root-title = "git";
			root-desc = "";
			header = "";
			footer = "";
			logo-link = "https://rebound.sh";
		};
	};
}
