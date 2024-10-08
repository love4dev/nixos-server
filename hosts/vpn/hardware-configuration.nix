#
# Hardware settings for my Beelink EQ12 Pro Mini PC
#
# flake.nix
#  └─ ./hosts
#      └─ ./vpn
#          ├─ default.nix
#          └─ hardware-configuration.nix *
#
# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
#

{ config, lib, modulesPath, vars, host, ... }:

{
  imports =
    [ (modulesPath + "/profiles/qemu-guest.nix")
    ];

  boot.initrd.availableKernelModules = [ "ahci" "xhci_pci" "virtio_pci" "sr_mod" "virtio_blk" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/b0736dde-e774-4bba-9916-b1ae33e9ecd5";
      fsType = "ext4";
    };

  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  networking = with host; {
    enableIPv6 = true;
    useDHCP = lib.mkDefault true;
    hostName = "timeweb-vpn-server";
    nameservers = [ "1.1.1.1" "8.8.8.8" ];
  };
}