{ config, pkgs, ... }:
{
  imports = [
    ./gnome.nix  # Use GNOME by default
    # ./hyprland.nix  # Uncomment to switch to Hyprland
  ];

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";  # Enable Wayland support in Firefox
    LIBVA_DRIVER_NAME = "intel";  # Adjust for AMD/NVIDIA
  };
}