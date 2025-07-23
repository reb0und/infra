{ pkgs, config, home, ... }:

{
	programs.tmux.enable = true;

	home.file.".tmux.conf".source = ../../dotfiles/tmux/.tmux.conf;
	home.file.".tmux/plugins/tpm" = ../../dotfiles/tmux/plugins/tpm;
}
