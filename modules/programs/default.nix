{ pkgs, config, ... }:

{
	imports = [
		./git.nix
		./nvim.nix
		./tmux.nix
		./languages.nix
	];
}
