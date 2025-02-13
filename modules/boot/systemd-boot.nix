{ config, pkgs, ... }:

{
  boot = {
    loader = {
      systemd-boot.enable = true;  # Enable systemd-boot as the bootloader
      efi.canTouchEfiVariables = true;  # Allow modifying EFI variables
    };
  };

  systemd.services.reboot-fix = {
    description = "Fix systemd-boot reboot issues";
    after = [ "systemd-boot-update.service" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.systemd}/bin/bootctl update";
      RemainAfterExit = true;
    };
  };

  environment.systemPackages = with pkgs; [
    efibootmgr
  ];
}
