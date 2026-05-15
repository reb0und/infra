{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wireguard-tools
  ];

  networking.firewall = {
    allowedUDPPorts = [ 51820 ];
  };

  systemd.services.wg0-routing = {
    wantedBy = [ "multi-user.target" ];
    after = [ "wireguard-wg0.service" "tailscaled.service" "NetworkManager.service" ];
    requires = [ "wireguard-wg0.service" ];
  
    path = [ pkgs.iproute2 ];
  
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
  
    script = ''
      set -x
  
      ip route replace default dev wg0 table 51820
  
      ip rule del priority 98 2>/dev/null || true
      ip rule add priority 98 from 10.100.0.2/32 lookup 51820
  
      ip route flush cache || true
    '';
  
    preStop = ''
      ip rule del priority 98 2>/dev/null || true
      ip route flush table 51820 || true
      ip route flush cache || true
    '';
  };

  networking.wireguard.interfaces = {
    wg0 = {
      ips = [ "10.100.0.2/32" ];
      listenPort = 51820;

      # @TODO: Encrypt using SOPS
      privateKeyFile = "/home/dominic/keys/wg/private"; 

      allowedIPsAsRoutes = false;

      peers = [
        {
          publicKey = "z7tCgSZWI0a5LkkLQrqo5YAV/q2chYOz16uwGxQk0WA=";
          allowedIPs = [ "0.0.0.0/0" ];
          endpoint = "5.161.200.224:8172";
          persistentKeepalive = 25;
        }
      ];
    };
  };
}
