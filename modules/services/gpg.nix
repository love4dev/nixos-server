#
#  GPG configuration
#

{ lib, pkgs, vars, host, ... }:

{
  environment.systemPackages = with pkgs; [
    gnupg # GnuPG
  ];

  # smartcard daemon
  # services.pcscd.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Needed for yubikey to work
  environment.shellInit = ''
    export GPG_TTY="$(tty)"
  '';
}

