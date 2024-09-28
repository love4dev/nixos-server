# NixOS configuration

## The repo

- Enable the `nix` command:

`mkdir -p ~/.config/nix; echo 'experimental-features = nix-command flakes' > ~/.config/nix/nix.conf`

- Rebuild OS

`sudo nixos-rebuild switch`

- Install basic utils

`nix shell nixpkgs#home-manager nixpkgs#git`

- Pull repo
```
git clone https://github.com/love4dev/nixos-server.git ~/.setup
cd ~/.setup
```

## Usage

- Run `git pull && sudo nixos-rebuild switch --flake .#vpn --option eval-cache false --show-trace` to apply your system configuration.

### Useful command

- Update apps

```bash
git pull
nix-channel --update
nix flake update # then rebuild
sudo nixos-rebuild switch --flake .#vpn --show-trace
nix-env -u '*'
```

## Useful links
- [VPN](https://github.com/linuxserver/docker-wireguard)
