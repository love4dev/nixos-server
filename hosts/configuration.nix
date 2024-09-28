#
#  Main system configuration. More information available in configuration.nix(5) man page.
#
#  flake.nix
#   ├─ ./hosts
#   │   ├─ default.nix
#   │   └─ configuration.nix *
#   └─ ./modules
#       ├─ ./desktops
#       │   └─ default.nix
#       ├─ ./editors
#       │   └─ default.nix
#       ├─ ./hardware
#       │   └─ default.nix
#       ├─ ./programs
#       │   └─ default.nix
#       ├─ ./services
#       │   └─ default.nix
#       ├─ ./shell
#       │   └─ default.nix
#       └─ ./theming
#           └─ default.nix
#

{ lib, config, pkgs, stable, inputs, vars, ... }:

let
  terminal = pkgs.${vars.terminal};
in
{
  imports = (import ../modules/programs ++
    import ../modules/services ++
    import ../modules/shell);

  boot = {
    tmp = {
      cleanOnBoot = true;
      tmpfsSize = "5GB";
    };
    # kernelPackages = pkgs.linuxPackages_latest;
  };

  users.users.${vars.user} = {
    isNormalUser = true;
    description = "${vars.username}";
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCt8j0Arz9x5S8oASwgH0SQLgPVghJkqr5z51WV5mEBV7XD6tXIubkl7Lt0tpz9BVaQVy/sKBOEUOXzz+VBzrddmzuQ5wt1CMqrNzHKBJggA8BDiJG5HmiJQC7pEL9RcMhEke5IOv3Jb3VU4b1PbEMf6rbf54gp+ywTn2dF8nKUyMhMOhtlH9T6q5sJDCmti7A+5QKG/yyQfAvt4jv8ex8qroHX298pjlis5tLZXzFDK42T/2M5Ym0YjWD8Sy0gEfo8e/QnTdbo3zkt8DxWvoR24Vfqx8n6qEw8QmvXHraW9m1ftUTv7p2dE7VUzxfUsggkZ3H64JpOFuRTwfM564/LG17/q/naCLkUyF8J2RD5Jwymi9Axbop+npw2ejjUS0tFH/GTJSiMl5tkuO4HAo3rrPDT/7wtp52cqLZZ7/+bfRXq2EGTgFXqRvjgenCoIsHhYMKiibwYbpmuNB0UfjyjdaCdls+kM0OBZZJ/gN3ms0RnEFoHQ+8H0356x/nlBbS7PTpAYfR5sv6jamBmJ5QT9JAGOntpMDlbeNUa6RNTzgID0NjgnGrcaH0SqwSKdD+XQ5hlBUHXL7W2A6ZMIDwFGenhOip4NRUFy0E08th42UistcKB69Yl4EhMDF7WXkOjfO5xliVnG7/whfcbBKLRnnyoNU7B2CcvlwtQzFKAZw=="
    ];
    extraGroups = [ "wheel" "video" "audio" "camera" "networkmanager" "lp" "scanner" ];
  };

  time.timeZone = "Europe/Belgrade";
  i18n = {
    defaultLocale = "en_GB.UTF-8";
    extraLocaleSettings = {
      LC_MONETARY = "en_GB.UTF-8";
    };
  };

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
    sudo.wheelNeedsPassword = false;
  };

  fonts.packages = with pkgs; [
    carlito # NixOS
    vegur # NixOS
    source-code-pro
    jetbrains-mono
    font-awesome # Icons
    corefonts # MS
    noto-fonts # Google + Unicode
    noto-fonts-cjk
    noto-fonts-emoji
    nerdfonts
  ];

  environment = {
    variables = {
      TERMINAL = "${vars.terminal}";
      EDITOR = "${vars.editor}";
      VISUAL = "${vars.editor}";
    };
    systemPackages = with pkgs; [
      # Terminal
      btop # Resource Manager
      coreutils # GNU Utilities
      git # Version Control
      gvfs # Samba
      killall # Process Killer
      lshw # Hardware Config
      nano # Text Editor
      nix-tree # Browse Nix Store
      pciutils # Manage PCI
      smartmontools # Disk Health
      wget # Retriever
      xdg-utils # Environment integration
      p7zip # Zip Encryption
      rsync # Syncer - $ rsync -r dir1/ dir2/
      unzip # Zip Files
      unrar # Rar Files
      zip # Zip
      direnv
    ];
  };

  programs = {
    dconf.enable = true;
  };

  services = {
    openssh = {
      enable = true;
      allowSFTP = true;
      extraConfig = ''
        HostKeyAlgorithms +ssh-rsa
      '';
    };
  };

  nix = {
    settings = {
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 2d";
    };
    # package = pkgs.nixVersions.latest;
    registry.nixpkgs.flake = inputs.nixpkgs;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs          = true
      keep-derivations      = true
    '';
  };
    nixpkgs = {
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      joypixels.acceptLicense = true;
      permittedInsecurePackages = [
        "openssl-1.1.1w"
        "freeimage-unstable-2021-11-01"
      ];
    };
  };

  system = {
    # autoUpgrade = {
    #   enable = true;
    #   channel = "https://nixos.org/channels/nixos-unstable";
    # };
    stateVersion = "24.05";
  };

  home-manager.users.${vars.user} = {
    home = {
      stateVersion = "24.05";
    };
    programs = {
      home-manager.enable = true;
    };
  };
}
