{ config, pkgs, ... }:
{
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # GNOME Performance Optimizations
  environment.sessionVariables = {
    "GDK_SCALE" = "0.8";  # Scale UI to 80%
    "GDK_DPI_SCALE" = "0.8";
  };

  services.xserver.displayManager.gdm.settings = {
    "org.gnome.mutter" = {
      "experimental-features" = "scale-monitor-framebuffer";
    };
  };

  programs.dconf.enable = true;
  systemd.user.services.gnome-settings-daemon = {
    enable = true;
    script = ''
      gsettings set org.gnome.desktop.interface enable-animations false
      gsettings set org.gnome.desktop.interface clock-show-date true
      gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
      gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'
      gsettings set org.gnome.desktop.interface text-scaling-factor 0.8
    '';
  };

  # Essential GNOME Apps
  environment.systemPackages = with pkgs; [
    firefox
    gnome-tweaks
    gnomeExtensions.pop-shell  # Tiling window manager for GNOME
    gnomeExtensions.dash-to-dock
  ];
}
