#
#  Zabbix configuration
#

{ lib, pkgs, vars, host, ... }:

{
  services.zabbixAgent = {
    enable = true;
    server = "92.53.116.12,92.53.116.111,92.53.116.119,217.18.62.11";
    settings = {
      StartAgents = 3;
      DebugLevel = 3;
      
      AllowRoot = 0;
      User = "zabbix";
      Timeout = 30;
      DenyKey = "system.run[*]";
      
      UserParameter = "timeweb_config_version,echo 127";
    };
    openFirewall = true;
  };

}

