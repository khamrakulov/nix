{ config, pkgs, ... }:
{
  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";  # Keep this for UEFI systems

    efiSupport = true;  # Ensure GRUB installs correctly for UEFI
    # useOSProber = true;  # Enable OS detection for dual-booting

    configurationLimit = 10;

    # Set timeout for boot menu
    timeoutStyle = "menu";  # Show menu always (alternatives: "countdown" or "hidden")
    theme = "${pkgs.sleek-grub-theme}";
    default = "saved";
  };

  # Bootloader timeout
  boot.loader.timeout = 5;

  # Ensure GRUB can modify EFI variables
  boot.loader.efi = {
    canTouchEfiVariables = true;
    efiSysMountPoint = "/boot";  
  };

  # Handle splash image correctly
  # boot.loader.grub.splashImage = "/boot/image.jpg";

  environment.systemPackages = with pkgs; [
    sleek-grub-theme
  ];
}

