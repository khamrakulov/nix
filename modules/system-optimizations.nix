{ config, pkgs, ... }:
{
  # Optimize CPU performance
  powerManagement.cpuFreqGovernor = "performance";  # Use "ondemand" for laptops

  # Enable Zswap (better memory management)
  zramSwap.enable = true;

  systemd.services.NetworkManager.wantedBy = pkgs.lib.mkForce [ "multi-user.target" ];
  systemd.defaultTimeoutStartSec = "10s";  # Reduce startup timeout

  nix.gc = {
    automatic = true;
    dates = "weekly";  # Runs cleanup weekly
    options = "--delete-older-than 30d";  # Remove old generations older than 30 days
  };

  nix.settings.max-jobs = "auto";  # Use all available CPU cores
  nix.settings.cores = 0;          # Use all CPU cores for compilation
}