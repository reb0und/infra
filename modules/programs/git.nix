{ pkgs, config,  ... }:

{
	programs.git = {
		enable = true;
		userName = "reb0und";
		userEmail = "me@rebound.sh";
		extraConfig = {
			init.defaultBranch = "main";
		};
	};
}
