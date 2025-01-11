{ config, pkgs, ... }:

{
  imports = [
    ./environment-packages.nix
  ];
  
  networking = {
    hostName = "nixos";
    networkmanager = {
      enable = true;
    };

    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 ];
    };
  };

  environment.variables = {
    EDITOR = "nvim";
  };

  hardware = {
    bluetooth = {
      enable = true;
    };
  };

  security.rtkit.enable = true;

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  time.timeZone = "Asia/Tashkent";

  i18n.defaultLocale = "en_US.UTF-8";

  system.stateVersion = "24.11";
}