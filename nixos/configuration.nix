# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "nixos";
    wireless = {
      enable = true;
    };
    networkmanager = {
      enable = true;
    };
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 ];
    };
  };

  # Set your time zone.
  time.timeZone = "Asia/Tashkent";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  hardware = {
    bluetooth = {
      enable = true;
    };
  };

  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };

    blueman = {
      enable = true;
    };

    displayManager = {
      sddm = {
        enable = true;
      };
    };

    desktopManager = {
      plasma6 = {
        enable = true;
      };
    };

    printing = {
      enable = true;
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    openssh = {
      enable = true;
    };

    nginx = {
      enable = true;
      virtualHosts = {
        # "example.com" = {
        #   enableACME = true;
        #   forceSSL = true;
        #   root = "/var/www/example";
        #   index = "index.html";
        # };
      };
    };
  };

  security.rtkit.enable = true;

  # Define a user account.
  users = {
    users.xfeusw = {
      isNormalUser = true;
      description = "xfeusw";
      extraGroups = [ "networkmanager" "wheel" "docker" ];
      packages = with pkgs; [
        zsh
        oh-my-zsh
        zsh-autosuggestions
        thefuck
      ];
      shell = pkgs.zsh;
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    neovim
    wget
    git
    gh # github cli
    direnv
    bluez
    bluez-tools
    blueman
    firefox
    home-manager

    # nodejs
    nodejs_22
    nest-cli

    # Helix
    inputs.helix.packages."${pkgs.system}".helix

    # Fonts
    noto-fonts
    fira-code
    roboto
    jetbrains-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code

    # Rust
    rustup
    cargo
    rust-analyzer
  ];

  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    mtr = {
      enable = true;
    };

    firefox = {
      enable = true;
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        ll = "ls -l";
        update = "sudo nixos-rebuild switch";
      };

      ohMyZsh = {
        enable = true;
        theme = "jbergantine";
        plugins = [ "git" "thefuck" "zsh-autosuggestions" ];
      };
    };
  };

  # Docker
  virtualisation = {
    docker = {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
  };

  # Experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "24.11"; # Did you read the comment?
}
