{ pkgs, config, home, ... }:

{
	programs.tmux.enable = true;

	home.file.".tmux.conf" = ../../dotfiles/tmux/.tmux.conf;
}
