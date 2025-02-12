{ config, pkgs, ... }:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;  # Allow remote play
    dedicatedServer.openFirewall = true;  # Allow Steam servers if needed
  };

  environment.systemPackages = with pkgs; [
    steam-run  # Useful for running games in a compatibility layer
  ];
}
