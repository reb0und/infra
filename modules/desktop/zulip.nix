{ pkgs, home, ... }: {
	home.packages = [
		pkgs.zulip
	];
}
