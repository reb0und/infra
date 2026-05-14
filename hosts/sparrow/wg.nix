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
      ips = [ "10.100.0.2/32" ];
      listenPort = 51820;

      # @TODO: Encrypt using SOPS
      privateKeyFile = "/home/dominic/keys/wg/private"; 

      postSetup = "ip route add default dev wg0 table 200; ip rule add from 10.100.0.2/32 table 200";

      postShutdown = "ip rule del from 10.100.0.2/32 table 200; ip route del default dev wg0 table 200";

      peers = [
        {
          publicKey = "z7tCgSZWI0a5LkkLQrqo5YAV/q2chYOz16uwGxQk0WA=";
          allowedIPs = [ "10.100.0.1/32" ];
          endpoint = "54.163.192.2:8172";
          persistentKeepalive = 25;
        }
      ];
    };
  };
}
