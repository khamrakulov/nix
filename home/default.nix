{ config, pkgs, ... }:
{
  home.username = "xfeusw";
  home.homeDirectory = "/home/xfeusw";

  imports = [
    ./packages.nix
    ./shell.nix
    ./modules/programs/default.nix
    ./fonts.nix
  ];

  home.stateVersion = "24.11";
}
