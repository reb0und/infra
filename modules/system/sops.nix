{ config, pkgs, sops-nix, ... }:

let 
	sops = sops-nix.nixosModules.sops; 
in 
{
	sops.defaultSopsFile = "../../secrets/secret.enc.yaml";
	sops.age.sshKeyPaths = [ "~/.ssh/id_ed25519.pub" ];
}
