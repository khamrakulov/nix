{ config, pkgs, ... }:
{
  # Enable Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.blueman.enable = true;  # GUI for managing Bluetooth devices

  # Enable PipeWire Bluetooth support
  services.pipewire.extraConfig.pipewire."context.modules" = [
    {
      name = "libpipewire-module-bluez5";
      args = {
        "bluez5.enable" = true;
        "bluez5.headset-roles" = [ "hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag" ];
      };
    }
  ];

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
