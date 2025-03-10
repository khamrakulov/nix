{ config, pkgs, ... }:

{
  # Enable Xserver and SDDM for Wayland
  services = {
    xserver.enable = true;

    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };

    # Input optimizations (for smoother touchpad & keyboard experience)
    libinput = {
      enable = true;
      touchpad = {
        naturalScrolling = true;
        tapping = true;
        scrollMethod = "twofinger";
      };
    };
  };

  # Enable Hyprland and GSettings compatibility
  programs = {
    hyprland.enable = true;
    dconf.enable = true;
  };

  # Essential and quality-of-life applications
  environment.systemPackages = with pkgs; [
    # Essentials
    waybar         # Status bar
    dunst          # Notifications
    rofi-wayland   # App launcher
    alacritty      # Terminal
    hyprpaper      # Wallpaper
    
    # Quality-of-life tools
    wl-clipboard   # Clipboard support (copy-paste)
    grim           # Screenshot tool
    slurp          # Region selection for screenshots
    xdg-desktop-portal-hyprland # Ensures Wayland compatibility for apps
    mako           # Alternative lightweight notification daemon
    networkmanagerapplet # GUI for managing network connections
    
    # Performance & Utility Tools
    fastfetch      # System info fetcher (like neofetch but faster)
    brightnessctl  # Control screen brightness
    pavucontrol    # Audio control GUI
    playerctl      # Media control from keyboard
    kanshi         # Auto-detect and configure external monitors
  ];

  # Wayland-specific environment variables for smoother performance
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

  # Systemd user services for Hyprland settings
  systemd.user.services.hyprland-settings = {
    enable = true;
    script = ''
      gsettings set org.gnome.desktop.interface enable-animations false
      gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
    '';
  };
}
