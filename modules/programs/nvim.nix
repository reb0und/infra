{ pkgs, config, home, ... }:

{
	programs.neovim = {
		enable = true;
		defaultEditor = true;
	};

	home.file.".config/nvim/init.lua".source = ../../dotfiles/nvim/init.lua;
}
