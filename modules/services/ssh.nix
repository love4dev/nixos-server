#
#  SSH configuration
#

{ lib, pkgs, vars, host, ... }:

{
  services = {
      openssh = {
        enable = true;
        allowSFTP = true;
        extraConfig = ''
          HostKeyAlgorithms +ssh-rsa
        '';
        settings = {
          # Opinionated: forbid root login through SSH.
          PermitRootLogin = "no";
          # Opinionated: use keys only.
          # Remove if you want to SSH using passwords
          PasswordAuthentication = false;
        };
      };
    };
}

