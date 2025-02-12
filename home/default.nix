{ config, pkgs, ... }:
{
  home.username = "xfeusw";
  home.homeDirectory = "/home/xfeusw";

  imports = [
    ./packages.nix
    ./shell.nix
    ./programs.nix
  ];

  home.stateVersion = "24.11";
}
