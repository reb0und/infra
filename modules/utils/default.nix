{ pkgs, config, home, ... }:

{
	home.packages = with pkgs; [
		wget
		unzip
		tree-sitter
		ripgrep
		xclip
		fzf
		wl-clipboard
		hyprshot
		hyprpicker
		hyprpolkitagent
		cliphist
	];
}
