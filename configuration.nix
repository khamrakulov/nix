{ config, pkgs, ... }:
{
  imports =
    [ 
      ./modules/nixpkgs.nix
      ./modules/desktop/default.nix
      ./modules/networking.nix
      ./modules/security.nix
      ./modules/users.nix
      ./modules/docker.nix
      ./modules/system.nix
      ./modules/audio.nix
      ./modules/boot/default.nix
      ./modules/bluetooth.nix
      ./modules/programs/default.nix
      ./modules/gaming.nix
    ];

  # Set system state version
  system.stateVersion = "24.11";
}

