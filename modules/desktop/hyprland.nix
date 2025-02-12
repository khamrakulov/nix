{ config, pkgs, ... }:
{
  services.xserver.enable = true;
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    waybar         # Status bar
    dunst          # Notifications
    rofi-wayland   # App launcher
    alacritty      # Terminal
    hyprpaper      # Wallpaper
  ];

  # Enable SDDM for Wayland session login
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
}
