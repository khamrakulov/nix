{ config, pkgs, ... }:
{
  imports = [
    # ./grub.nix  # Use GRUB by default
    ./systemd-boot.nix  # Uncomment to switch to systemd-boot
  ];

  environment.systemPackages = with pkgs; [
    efibootmgr
  ];
}
