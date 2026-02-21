{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wireguard-tools;
  ];

  networking.firewall = {
    allowedUDPPorts = [ 51820 ];
  };

  networking.wireguard.interfaces = {
    wg0 = {
      ips = [ "10.100.0.2/24" ];
      listenPort = 51820;
    };

    # @TODO: Encrypt using SOPS
    privateKeyFile = "/home/dominic/keys/wireguard/private"; 

    peers = [
      {
        publicKey = "";
        allowedIPs = [ "0.0.0.0/0" ];
        endpoint = "ip:51820";
        persistentKeepAlive = 25;
      }
    ];
  };
}
