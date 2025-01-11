{ config, pkgs, ... }:

{
  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    mtr = {
      enable = true;
    };

    firefox = {
      enable = true;
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        ll = "ls -l";
        update = "sudo nixos-rebuild switch";
      };

      ohMyZsh = {
        enable = true;
        theme = "jbergantine";
        plugins = [ "git" "thefuck" "zsh-autosuggestions" ];
      };
    };
  };
}