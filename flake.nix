{
  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/hyprland";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.skeleton = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/skeleton/configuration.nix
        inputs.home-manager.nixosModules.default
      ];

    };
  };
}
