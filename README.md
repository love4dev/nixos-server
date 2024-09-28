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
