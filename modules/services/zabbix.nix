#
#  Zabbix configuration
#

{ lib, pkgs, vars, host, ... }:

{
  services.zabbixAgent = {
     enable = false;
     openFirewall = true;
  };
}

