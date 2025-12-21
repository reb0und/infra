{ pkgs, config,  ... }:

{
	programs.git = {
		enable = true;
		settings = {
			user = {
				name = "reb0und";
				email = "me@rebound.sh";
			};
			core.editor = "nvim";
			init.defaultBranch = "main";
		};
	};
}
