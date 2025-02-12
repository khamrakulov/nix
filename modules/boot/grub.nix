{ config, pkgs, ... }:
{
  boot.loader.grub = {
    enable = true;
    device = "nodev";  # Keep this for UEFI systems

    efiSupport = true;  # Ensure GRUB installs correctly for UEFI
    useOSProber = true;  # Enable OS detection for dual-booting

    # Set timeout for boot menu
    timeoutStyle = "menu";  # Show menu always (alternatives: "countdown" or "hidden")
  };

  # Bootloader timeout
  boot.loader.timeout = 5;

  # Ensure GRUB can modify EFI variables
  boot.loader.efi.canTouchEfiVariables = true;

  # Handle splash image correctly
  environment.etc."grub-splash.jpg".source = /home/xfeusw/Wallpapers/001.jpg;
  boot.loader.grub.splashImage = "/etc/grub-splash.jpg";
}

