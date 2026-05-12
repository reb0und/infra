{ config, pkgs, ... }: 

{
	environment.etc."k3s-resolve.conf".text = ''
		nameserver 1.1.1.1
		nameserver 8.8.8.8
	'';

	services.k3s = {
		enable = true;
  	  	role = "server";
  	  	clusterInit = true;
  	  	extraFlags = [
			"--resolve-conf=k3s-resolve.conf"
			"--node-ip=155.246.36.10"
  	  	  	"--disable-network-policy"
  	  	  	"--flannel-backend=none"
			"--disable-kube-proxy"
			"--disable=traefik"
			"--disable=servicelb"
			"--disable=metrics-server"
  	  	];
  	};
}
