{ pkgs, config,  ... }:

{
	programs.git = {
		enable = true;
		userName = "reb0und";
		userEmail = "me@rebound.sh";
		extraConfig = {
			core.editor = "nvim";
			init.defaultBranch = "main";
		};
	};
}
