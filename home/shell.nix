{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    # Oh My Zsh configuration
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" "docker" ];
    };

    # Zsh Plugins (Autosuggestions + Syntax Highlighting)
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

  programs.git.enable = true;

  # Set default shell properly
  home.sessionVariables = {
    SHELL = "${pkgs.zsh}/bin/zsh";
  };
}
