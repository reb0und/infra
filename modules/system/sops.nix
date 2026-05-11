{ config, pkgs, ... }:
{
	sops.defaultSopsFile = ../../secrets/secret.enc.yaml;
	sops.age.sshKeyPaths = [ "/home/dominic/.ssh/id_ed25519" ];
}
