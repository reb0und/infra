{ pkgs, config, home, ... }:

{
	home.packages = with pkgs; [
		rustc
		rustup
		rust-analyzer
		clippy
	];
}
