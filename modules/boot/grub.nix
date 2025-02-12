{ config, pkgs, ... }:
{
  boot.loader.grub = {
    enable = true;
    device = "nodev";  # UEFI: "nodev", BIOS: "/dev/sdX"
    useOSProber = true;  # Detect other OSes (if dual-booting)
  };

  # Use this instead of `boot.loader.grub.timeout`
  boot.loader.timeout = 5;  # GRUB menu timeout

  # Optional: Remove or fix splash image
  boot.loader.grub.splashImage = "/home/xfeusw/Wallpapers/001.jpg";  # Ensure this file exists

  # Enable EFI boot support (for UEFI)
  boot.loader.efi.canTouchEfiVariables = true;
}
