{ config, pkgs, ... }: {
  programs.openssl = { enable = true; };

  environment.systemPackages = with pkgs; [ openssl openssl.dev pkg-config ];
}
