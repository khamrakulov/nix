{ config, pkgs, ... }:
{
  programs.zsh.enable = true;
  users.users.xfeusw = {
    isNormalUser = true;
    description = "xfeusw";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };
}
