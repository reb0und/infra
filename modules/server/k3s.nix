{ config, pkgs, ... }: 

{
	networking.firewall.checkReversePath = false;

	networking.firewall.trustedInterfaces = [
		"cilium_hust"
		"cilium_net"
	];

  	networking.firewall.extraCommands = ''
  	 	iptables -I nixos-fw 1 -i cilium_host -j ACCEPT || true
  	  	iptables -I nixos-fw 1 -i cilium_net -j ACCEPT || true
  	  	iptables -I nixos-fw 1 -i lxc+ -j ACCEPT || true
  	'';

  	networking.firewall.extraStopCommands = ''
  	 	iptables -D nixos-fw -i cilium_host -j ACCEPT 2>/dev/null || true
  	  	iptables -D nixos-fw -i cilium_net -j ACCEPT 2>/dev/null || true
  	  	iptables -D nixos-fw -i lxc+ -j ACCEPT 2>/dev/null || true
  	'';

	networking.firewall.interfaces.wg0.allowedTCPPorts = [ 3000 ];

  	environment.etc."k3s-resolv.conf".text = ''
  	 	nameserver 1.1.1.1
  	  	nameserver 8.8.8.8
  	'';

	services.k3s = {
		enable = true;
  	  	role = "server";
  	  	clusterInit = true;
  	  	extraFlags = [
			"--write-kubeconfig-mode=0644"
			"--resolv-conf=/etc/k3s-resolv.conf"
			"--node-ip=155.246.36.12"
  	  	  	"--disable-network-policy"
  	  	  	"--flannel-backend=none"
			"--disable-kube-proxy"
			"--disable=traefik"
			"--disable=servicelb"
			"--disable=metrics-server"
  	  	];
  	};
}
