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
    htop
    ripgrep
    starship  # Fancy prompt
    zsh
    docker-compose
    spotify
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" "docker" ];  # Only add Oh My Zsh plugins here
    };

    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.zsh-autosuggestions;
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.zsh-syntax-highlighting;
      }
    ];
  };

  programs.starship.enable = true;

  home.stateVersion = "24.11";
}
