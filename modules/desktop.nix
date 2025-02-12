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

  # Essential system packages
  environment.systemPackages = with pkgs; [
    firefox
    telegram-desktop
    vscode
    git
    gh
  ];
}
