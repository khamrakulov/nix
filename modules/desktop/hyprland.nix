{ config, pkgs, ... }:

{
  services = {
    xserver.enable = true;

    # Enable SDDM with Wayland support
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
  };

  programs = {
    hyprland.enable = true;
    dconf.enable = true; # Ensures compatibility with apps that use GSettings
  };

  environment.systemPackages = with pkgs; [
    # Essentials
    waybar         # Status bar
    dunst          # Notifications
    rofi-wayland   # App launcher
    alacritty      # Terminal
    hyprpaper      # Wallpaper
    
    # Quality-of-life improvements
    wl-clipboard   # Clipboard support
    grim           # Screenshot tool
    slurp          # Region selection (for grim)
    xdg-desktop-portal-hyprland # Ensures portal compatibility
    mako           # Alternative lightweight notification daemon
    networkmanagerapplet # GUI for NetworkManager
  ];

  # Ensure Wayland environment variables are set properly
  environment.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATIONS = "1";
    MOZ_ENABLE_WAYLAND = "1";
    SDL_VIDEODRIVER = "wayland";
    _JAVA_AWT_WM_NONREPARENTING = "1";
  };

  # Enable networking tools
  networking.networkmanager.enable = true;
  
  # Improve input experience
  services.libinput = {
    enable = true;
    touchpad = {
      naturalScrolling = true;
      tapping = true;
      scrollMethod = "twofinger";
    };
  };
}
