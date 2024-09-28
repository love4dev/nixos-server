#
#  Services
#
#  flake.nix
#   ├─ ./hosts
#   │   └─ configuration.nix
#   └─ ./modules
#       └─ ./services
#           └─ default.nix *
#               └─ ...
#

[
  ./gpg.nix
  ./ssh.nix
  ./qemu-guest.nix
  ./wireguard.nix
  ./zabbix.nix
]
