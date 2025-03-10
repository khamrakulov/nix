{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    php83
    php83Packages.composer
  ];
}