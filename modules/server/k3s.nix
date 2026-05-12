{ config, pkgs, ... }: 

{
	services.k3s = {
		enable = true;
  	  	role = "server";
  	  	clusterInit = true;
  	  	extraFlags = [
			"--node-ip=155.246.36.10"
  	  	  	"--disable-network-policy"
  	  	  	"--flannel-backend=none"
  	  	];
  	};
}
