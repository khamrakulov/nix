{ config, pkgs, ... }:
{
  # Optimize CPU performance
  powerManagement.cpuFreqGovernor = "performance";  # Use "ondemand" for laptops

  # Enable Zswap (better memory management)
  zramSwap.enable = true;
}