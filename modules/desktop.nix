{ config, pkgs, ... }:
{
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Keymap
  services.xserver.xkb.layout = "us";

  # PipeWire (optimized)
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Printing
  services.printing.enable = true;

  # GNOME Performance Tweaks
  environment.sessionVariables = {
    # Disable animations for better performance
    "GTK_THEME" = "Adwaita-dark";  # Use dark mode
  };

  programs.dconf.enable = true;

  systemd.user.services.gnome-settings-daemon = {
    enable = true;
    script = ''
      gsettings set org.gnome.desktop.interface enable-animations false
      gsettings set org.gnome.desktop.interface clock-show-date true
      gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
      gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'
    '';
  };

  # Essential GNOME Apps
  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
    gnomeExtensions.pop-shell  # Tiling window manager for GNOME
    gnomeExtensions.dash-to-dock
  ];
}

