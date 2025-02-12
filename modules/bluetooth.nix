{ config, pkgs, ... }:
{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.blueman.enable = true;  # GUI for managing Bluetooth devices

  # Enable PipeWire Bluetooth support
  services.pipewire.bluetooth.enable = true;

  # Fix for high-quality Bluetooth audio (A2DP)
  environment.variables = {
    "WIREPLUMBER_MODULE_LOG" = "a2dp";  # Debugging info for Bluetooth audio
  };

  environment.systemPackages = with pkgs; [
    bluez
    bluez-tools
    blueman  # GUI for Bluetooth
  ];
}
