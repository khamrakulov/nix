# modules/networking.nix
{ ... }:
{
  networking = {
    hostName = "nixos-acer";
    networkmanager = {
      enable = true;
      wifi.powersave = true;
    };

    # Faster DNS
    nameservers = [
      "1.1.1.1"
      "8.8.8.8"
    ];
  };

  services.blueman.enable = true;

  # mDNS for local network discovery
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
