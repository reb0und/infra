{
	description = "";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
		nixos-generators = {
			url = "github:nix-community/nixos-generators";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, nixos-generators, }:
		let
			system = "x86_64-linux";
		in {
			image = nixos-generators.nixosGenerate {
				system = system;
				modules = [ ./configuration.nix ];
				format = "qcow2";
				qemuOptions = {
					diskSize = 30 * 1024;
					memorySize = 4096;
					cores = 4;
				};
			};
		};
}
