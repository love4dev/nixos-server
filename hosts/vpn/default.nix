#
#  Specific system configuration settings for beelink
#
#  flake.nix
#   ├─ ./hosts
#   │   ├─ default.nix
#   │   └─ ./vpn
#   │        ├─ default.nix *
#   │        └─ hardware-configuration.nix
#   └─ ./modules
#
#  NOTE: Dual booted with windows 11. Disable fast-boot in power plan and bios and turn off hibernate to get wifi and bluetooth working. This only works once but on reboot is borked again. So using the old school BLT dongle.
#

{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ] ++
  (import ../../modules/hardware/vpn) ++
  (import ../../modules/desktops/virtualisation);

  # Boot Options
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 3;
      };
      efi = {
        canTouchEfiVariables = true;
      };
      timeout = 5;
    };
  };

  hardware = {
    graphics = {
      enable = false;
    };
  };

  environment = {
    systemPackages = with pkgs; [
      
    ];
  };
}
