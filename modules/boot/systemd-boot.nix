{ config, pkgs, ... }:

{
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  systemd.services.reboot-fix = {
    description = "Fix systemd-boot reboot issues";
    after = [ "systemd-boot-update.service" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.bash}/bin/bash -c '${pkgs.systemd}/bin/bootctl update || true'";
      RemainAfterExit = true;
    };
  };
}
