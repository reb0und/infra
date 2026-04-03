{ config, pkgs, sops-nix, ... }:

let 
	sops = sops-nix.nixosModules.sops; 
in 
{
	sops.defaultSopsFile = "../../.sops.yaml";
	sops.age.sshKeyPaths = [ "~/.ssh/id_ed25519.pub" ];
}
