{ pkgs, config, home, ... }:

{
	home.packages = [ pkgs.neovim ];

	programs.neovim = {
		defaultEditor = true;
	};

	home.file.".config/nvim".source =  config.lib.file.mkOutOfStoreSymlink "/home/dominic/dotfiles/nvim";
}
