{ config, pkgs, ... }:
{
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;  # Enable JACK for low-latency audio
  };
  
  environment.variables = {
    PIPEWIRE_LATENCY = "64/48000";  # Lower latency (adjust as needed)
  };
}
