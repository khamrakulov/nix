{ config, pkgs, ... }:
{
  users.users.xfeusw = {
    isNormalUser = true;
    description = "xfeusw";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  users.defaultUserShell = pkgs.zsh;
}
