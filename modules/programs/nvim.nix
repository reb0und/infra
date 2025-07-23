{ pkgs, config, home, dotfiles, ... }:

{
	programs.neovim = {
		enable = true;
		defaultEditor = true;
	};

	home.file.".config/nvim/init.lua".source = ../../dotfiles/nvim/init.lua;
}
