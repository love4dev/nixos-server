#
#  wireguard configuration
#

{ lib, pkgs, vars, host, ... }:

{
  systemd.services."wireguard" = {
    enable = true;
    path = [ pkgs.docker ];
        script = ''
  docker run -d \
  --name=wireguard \
  --cap-add=NET_ADMIN \
  --cap-add=SYS_MODULE `#optional` \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Etc/UTC \
  -e SERVERPORT=51820 `#optional` \
  -e PEERS=1 `#optional` \
  -e PEERDNS=auto `#optional` \
  -e INTERNAL_SUBNET=10.13.13.0 `#optional` \
  -e ALLOWEDIPS=0.0.0.0/0 `#optional` \
  -e PERSISTENTKEEPALIVE_PEERS= `#optional` \
  -e LOG_CONFS=true `#optional` \
  -p 51820:51820/udp \
  -v /home/${vars.user}/docker/wireguard/config:/config \
  -v /lib/modules:/lib/modules `#optional` \
  --sysctl="net.ipv4.conf.all.src_valid_mark=1" \
  --restart unless-stopped \
  lscr.io/linuxserver/wireguard:latest
        '';
        serviceConfig = {
          Type = "oneshot";
          User = "root";
        };
        after = [ "network.target" ];
      };
}

