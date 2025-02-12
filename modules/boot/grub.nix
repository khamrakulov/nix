{ config, pkgs, ... }:
{
  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "nodev";  # UEFI: "nodev", BIOS: "/dev/sdX"
    useOSProber = true;  # Detect other OSes (e.g., Windows)
    splashImage = "/path/to/image.png";  # Optional: GRUB background image
    timeout = 5;  # GRUB menu timeout
  };

  # Enable EFI boot support (for UEFI)
  boot.loader.efi.canTouchEfiVariables = true;
}
