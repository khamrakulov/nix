{ config, pkgs, ... }:

{
  users = {
    users.xfeusw = {
      isNormalUser = true;
      description = "xfeusw";
      extraGroups = [ "networkmanager" "wheel" "docker" ];
      packages = with pkgs; [
        zsh
        oh-my-zsh
        zsh-autosuggestions
        thefuck
      ];
      shell = pkgs.zsh;
    };
  };
}