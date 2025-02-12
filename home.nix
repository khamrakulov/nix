{ config, pkgs, ... }:

{
  home.username = "xfeusw";
  home.homeDirectory = "/home/xfeusw";

  # Let Home Manager handle your dotfiles
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  # Shell (Zsh with Oh My Zsh)
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    ohMyZsh.enable = true;
    ohMyZsh.theme = "agnoster";
  };

  # CLI Essentials
  home.packages = with pkgs; [
    git
    neovim
    tmux
    bat
    exa
    fzf
    ripgrep
    htop
    tldr
    tree
    wget
    curl
    unzip
    zsh
    zsh-autosuggestions
    zsh-syntax-highlighting
    lazygit
    starship
    telegram-desktop
  ];

  # Git Configuration
  programs.git = {
    enable = true;
    userName = "xfeusw";
    userEmail = "khamrakulovkamron@gmail.com";
  };

  # Starship Prompt
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      character = { success_symbol = "[➜](bold green)"; error_symbol = "[✗](bold red)"; };
    };
  };

  # Custom Aliases
  programs.bash.shellAliases = {
    ll = "ls -lah";
    gs = "git status";
    gc = "git commit -m";
    gp = "git push";
    gl = "git pull";
    nrb = "sudo nixos-rebuild switch";
    nrbu = "sudo nixos-rebuild switch --upgrade";
  };

  # Apply changes
  home.activation = {
    reloadZsh = ''${pkgs.zsh}/bin/zsh -c "source ~/.zshrc"'';
  };
}
