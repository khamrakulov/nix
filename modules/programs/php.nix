{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    php
    phpPackages.composer
    phpPackages.pcntl
    phpPackages.openssl
    phpPackages.pdo
    phpPackages.sqlite
    phpPackages.mbstring
    phpPackages.tokenizer
    phpPackages.xml
    phpPackages.curl
    phpPackages.zip
    phpPackages.fileinfo
  ];

  services.phpfpm.enable = true;  # Enable PHP-FPM if needed
}
