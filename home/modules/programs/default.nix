# home/modules/programs/default.nix
{ config, pkgs, ... }:
{
  imports = [
    ./neovim.nix
  ]
}
