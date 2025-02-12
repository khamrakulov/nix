{ config, pkgs, ... }:
{
  # Enable PipeWire for better audio performance
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;  # PulseAudio compatibility layer
    jack.enable = true;   # Enable JACK for low-latency audio

    # Advanced PipeWire settings
    config.pipewire = {
      "context.properties" = {
        "default.clock.rate" = 48000;  # Set default sample rate to 48kHz
        "default.clock.quantum" = 64;  # Reduce latency
        "default.clock.min-quantum" = 32;
      };
    };
  };

  environment.systemPackages = with pkgs; [
    pavucontrol  # GUI to manage sound settings
    helvum       # PipeWire audio graph manager
    easyeffects  # Advanced equalizer & effects
  ];
  
  environment.variables = {
    PIPEWIRE_LATENCY = "64/48000";  # Lower latency (adjust as needed)
  };
}
