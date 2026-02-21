{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wireguard-tools
  ];

  networking.firewall = {
    allowedUDPPorts = [ 51820 ];
  };

  networking.wireguard.interfaces = {
    wg0 = {
      ips = [ "10.100.0.2/24" ];
      listenPort = 51820;

      # @TODO: Encrypt using SOPS
      privateKeyFile = "/home/dominic/keys/wireguard/private"; 

      peers = [
        {
          publicKey = "z7tCgSZWI0a5LkkLQrqo5YAV/q2chYOz16uwGxQk0WA=";
          allowedIPs = [ "10.100.0.2/24" ];
          endpoint = "54.163.192.2:8172";
          persistentKeepAlive = 25;
        }
      ];
    };
  };
}
