{ config, pkgs, ... }:
{
  home.username = "xfeusw";
  home.homeDirectory = "/home/xfeusw";

  home.packages = with pkgs; [
    vscode
    telegram-desktop
    git
    gh
    neovim
    zsh
    starship
    htop
    ripgrep
  ];

  programs.zsh.enable = true;
  programs.starship.enable = true;
  programs.git = {
    enable = true;
    userName = "xfeusw";
    userEmail = "khamrakulovkamron@gmail.com";
  };

  home.stateVersion = "24.11";
}

