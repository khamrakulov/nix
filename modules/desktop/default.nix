{ config, pkgs, ... }:
{
  imports = [
    # ./gnome.nix  # Use GNOME by default
    ./hyprland.nix  # Uncomment to switch to Hyprland
  ];
}