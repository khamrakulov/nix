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

    # Extra Zsh configuration
    initExtra = ''
      # Ensure the correct path for Starship
      export PATH="$HOME/.cargo/bin:$HOME/.composer/vendor/bin:/home/xfeusw/scripts:/etc/profiles/per-user/${config.home.username}/bin:$PATH"

      # Fix Starship initialization issue
      eval "$(starship init zsh)"
    '';
  };

  # Enable Starship prompt
  programs.starship.enable = true;

  programs.git.enable = true;
}
