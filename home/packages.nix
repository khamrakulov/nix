{ config, pkgs, ... }:
{
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
    discord
    nodejs
    yarn
    pnpm
    nest-cli
    rustup
    gcc
    postman
    ngrok
    neofetch
    # Photo editing tools
    darktable
    rawtherapee
    digikam
    gimp
    krita
  ];
}
