{ config, pkgs, ... }:
{
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    displayManager.gdm.settings."org.gnome.mutter".experimental-features = "scale-monitor-framebuffer";
  };

  # GNOME Performance Optimizations
  environment.sessionVariables = {
    GDK_SCALE = "0.8";
    GDK_DPI_SCALE = "0.8";
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
    gnome-tweaks
    gnomeExtensions.pop-shell
    gnomeExtensions.dash-to-dock
  ];
}

