{ config, pkgs, ... }:

{
  home.username = "xfeusw";
  home.homeDirectory = "/home/xfeusw";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    # Add your desired packages here
    vim
    git
    htop
  ];

  services = {
    # Enable and configure services here
    xserver = {
      enable = true;
      layout = "us";
      xkbVariant = "";
      displayManager.sddm.enable = true;
      desktopManager.plasma5.enable = true;
      windowManager.i3.enable = false;
    };

    wayland = {
      enable = true;
      compositor = "plasma";
    };

    bluetooth = {
      enable = true;
      pulseaudio = true;
    };
  };

  programs = {
    # Enable and configure programs here
    zsh = {
      enable = true;
      oh-my-zsh = {
        enable = true;
      };
    };
  };

  # Define your dotfiles and other configurations here
  home.file.".zshrc".text = ''
    export PATH=$HOME/bin:$PATH
    eval "$(starship init zsh)"
  '';
}