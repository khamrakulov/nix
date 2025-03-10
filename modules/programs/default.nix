# home/modules/programs/default.nix
{ config, pkgs, ... }: {
  imports = [ ./steam.nix ./neovim.nix ./php.nix ];
}
