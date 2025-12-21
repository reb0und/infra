{ pkgs, config,  ... }:

{
	programs.git = {
		enable = true;
		settings = {
			userName = "reb0und";
			userEmail = "me@rebound.sh";
			core.editor = "nvim";
			init.defaultBranch = "main";
		};
	};
}
