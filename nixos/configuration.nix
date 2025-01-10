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

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

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
    # bluetooth = {
    #   enable = true;
    # };

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
  };

  security.rtkit.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.xfeusw = {
    isNormalUser = true;
    description = "xfeusw";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
      thunderbird
      vscode
      telegram-desktop
      google-chrome
      firefox
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    direnv
    bluez
    bluez-tools
    blueman

    # Helix
    inputs.helix.packages."${pkgs.system}".helix
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  # Experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "24.11"; # Did you read the comment?

}
