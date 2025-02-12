{ config, pkgs, lib, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
    ];

  # Enable Flakes & Experimental Features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader Configuration
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Hostname & Networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Time & Locale Settings
  time.timeZone = "Asia/Tashkent";
  i18n.defaultLocale = "en_US.UTF-8";

  # Keyboard Layout
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable X11 and GNOME
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Printing Support
  services.printing.enable = true;

  # Enable PipeWire for Audio
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define User
  users.users.xfeusw = {
    isNormalUser = true;
    description = "xfeusw";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Allow Unfree Packages
  nixpkgs.config.allowUnfree = true;

  # Essential System Packages
  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    vim
    nano
    htop
    neofetch
    firefox
    unzip
    tmux
    gcc
    ripgrep
    fzf
  ];

  # Enable OpenSSH
  services.openssh.enable = true;

  # Home Manager as a System Module
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    users.xfeusw = import ./home.nix;
  };

  # NixOS Version (Do not change unless upgrading)
  system.stateVersion = "24.11";
}
