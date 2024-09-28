#
#  Docker
#

{ pkgs, vars, ... }:

{
  virtualisation = {
     docker = {
      enable = true;
      daemon.settings = {
        "registry-mirrors" = [ "https://dockerhub.timeweb.cloud" ];
        "live-restore" = false;
      };
    };
  };

  users.groups.docker.members = [ "${vars.user}" ];

  environment.systemPackages = with pkgs; [
    docker # Containers
    docker-compose # Multi-Container
  ];
}
