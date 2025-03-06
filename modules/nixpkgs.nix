{ config, pkgs, ... }:
{
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [ "https://cache.nixos.org/" ];
    extra-experimental-features = [ "auto-allocate-uids" "cgroups" ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    direnv
    watchexec
    sqlx-cli
  ];
}
