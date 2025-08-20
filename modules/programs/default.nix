{ pkgs, config, ... }:

{
	imports = [
		./git.nix
		./nvim.nix
		./tmux.nix
		./starship.nix
		./btop.nix
		./fish.nix
		./yazi.nix
		./ghostty.nix
		./tiny.nix
		./wgnord.nix
	];
}
