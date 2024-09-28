#
#  Zabbix configuration
#

{ lib, pkgs, vars, host, ... }:

{
  services.zabbixAgent = {
     enable = true;
     openFirewall = true;
  };
}

