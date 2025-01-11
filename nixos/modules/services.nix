{ config, pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };

    blueman = {
      enable = true;
    };

    displayManager = {
      sddm = {
        enable = true;
      };
    };

    desktopManager = {
      plasma6 = {
        enable = true;
      };
    };

    printing = {
      enable = true;
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    openssh = {
      enable = true;
    };

    nginx = {
      enable = true;
      virtualHosts = {
        # "example.com" = {
        #   enableACME = true;
        #   forceSSL = true;
        #   root = "/var/www/example";
        #   index = "index.html";
        # };
      };
    };

    k3s = {
      enable = true;
    };
  };
}