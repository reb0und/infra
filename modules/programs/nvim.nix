{ pkgs, config, home, ... }:

{
	programs.neovim = {
		enable = true;
		defaultEditor = true;
	};

	home.file.".config/nvim/init.lua".source =  config.lib.file.mkOutOfStoreSymlink "/home/dominic/dotfiles/nvim/init.lua";
}
