{ pkgs, config, home, ... }:

{
	home.packages = [ pkgs.tmux ];

	home.file.".config/tmux/tmux.conf".source =  config.lib.file.mkOutOfStoreSymlink "/home/dominic/dotfiles/tmux/.tmux.conf";
}
