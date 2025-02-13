{ config, pkgs, ... }:
{
  boot.loader.grub = {
    enable = true;
    device = "nodev";  # Use "nodev" for UEFI systems
    efiSupport = true;
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
    efiSysMountPoint = "/boot/efi";  
  };

  # Handle splash image correctly
  boot.loader.grub.splashImage = "/boot/image.jpg";

  environment.systemPackages = with pkgs; [
    sleek-grub-theme
  ];
}