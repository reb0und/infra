{ pkgs, config, home, ... }:

{
	programs.neovim = {
		enable = true;
		defaultEditor = true;
	};

	home.file.".config/nvim".source =  config.lib.file.mkOutOfStoreSymlink "/home/dominic/dotfiles/nvim";
}
