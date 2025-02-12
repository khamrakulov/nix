{ config, pkgs, ... }:
{
  virtualisation.docker.enable = true;
  users.groups.docker.members = [ "xfeusw" ];  # Allow user to run Docker
}
