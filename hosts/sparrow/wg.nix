{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wireguard-tools
  ];

  networking.firewall = {
    allowedUDPPorts = [ 51820 51821 ];
  };

  systemd.services.wg0-routing = {
    wantedBy = [ "multi-user.target" ];
    after = [ 
      "wireguard-wg0.service"
      "wireguard-wg-proton-vpn.service"
      "tailscaled.service"
      "NetworkManager.service"
    ];
    requires = [ 
      "wireguard-wg0.service"
      "wireguard-wg-proton-vpn.service"
    ];
  
    path = [ pkgs.iproute2 ];
  
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
  
    script = ''
      set -x
  
      ip route replace 10.100.1.0/32 dev wg0
      ip route replace 10.200.0.0/32 dev wg0

      ip route replace default dev wg0 table 51820
      ip route replace default dev wg-proton-vpn table 51821
  
      ip rule del priority 99 2>/dev/null || true
      ip rule add priority 99 from 10.100.0.2/32 lookup 51820

      ip rule del priority 98 2>/dev/null || true
      ip rule add priority 98 from 10.8.0.2/32 lookup 51821
  
      ip route flush cache || true
    '';
  
    preStop = ''
      ip route del 10.100.1.0/32 dev wg0 2>/dev/null || true     
      ip route del 10.200.0.0/32 dev wg0 2>/dev/null || true         

      ip rule del priority 99 2>/dev/null || true
      ip route flush table 51820 || true

      ip rule del priority 98 2>/dev/null || true
      ip route flush table 51821 || true

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
          allowedIPs = [ "10.100.0.1/32" "10.200.0.0/24" ];
          endpoint = "5.161.200.224:8172";
          persistentKeepalive = 25;
        }
      ];
    };

    wg-proton-vpn = {
      ips = [ "10.8.0.2/32" ];
      listenPort = 51821;

      # @TODO: Encrypt using SOPS
      privateKeyFile = "/home/dominic/keys/wg_proton_vpn/private"; 

      allowedIPsAsRoutes = false;

      peers = [
        {
          publicKey = "3XROzgS72QDRKE3Z2XcnppVNFPaLFCeSRDmsCe6EGws=";
          allowedIPs = [ "0.0.0.0/0" ];
          endpoint = "149.34.251.138:51820";
          persistentKeepalive = 25;
        }
      ];
    };
  };
}
