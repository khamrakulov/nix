{ config, pkgs, ... }:
{
  boot.loader.grub = {
    enable = true;
    device = "/dev/sda1";  # Keep this for UEFI systems

    efiSupport = true;  # Ensure GRUB installs correctly for UEFI
    # useOSProber = true;  # Enable OS detection for dual-booting

    configurationLimit = 10;

    # Set timeout for boot menu
    timeoutStyle = "menu";  # Show menu always (alternatives: "countdown" or "hidden")
    theme = "${pkgs.sleek-grub-theme}";
    default = "saved";

    extraConfig = ''
      insmod efi_gop
      insmod efi_uga
      insmod gfxterm
    '';
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
    grub2
    grub2_efi
    sleek-grub-theme
  ];
}

