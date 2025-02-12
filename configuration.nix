{ config, pkgs, ... }:
{
  imports =
    [ 
      ./hardware-configuration.nix
      ./modules/nixpkgs.nix
      ./modules/desktop/default.nix
      ./modules/networking.nix
      ./modules/security.nix
      ./modules/users.nix
      ./modules/docker.nix
      ./modules/system-optimizations.nix
    ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set system state version
  system.stateVersion = "24.11";
}

