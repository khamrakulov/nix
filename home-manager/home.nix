{ config, pkgs, lib, ... }:

{
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  home = {
    stateVersion = "24.11";
    username = "xfeusw";
    homeDirectory = "/home/xfeusw";

    packages = with pkgs; [
      neofetch
      nnn # terminal file manager
      # zsh
      # oh-my-zsh
      # zsh-autosuggestions
      # thefuck

      # archives
      zip
      xz
      unzip
      p7zip

      # utils
      ripgrep # recursively searches directories for a regex pattern
      jq # A lightweight and flexible command-line JSON processor
      yq-go # yaml processor https://github.com/mikefarah/yq
      eza # A modern replacement for ‘ls’
      fzf # A command-line fuzzy finder

      # networking tools
      mtr # A network diagnostic tool
      iperf3
      dnsutils  # `dig` + `nslookup`
      ldns # replacement of `dig`, it provide the command `drill`
      aria2 # A lightweight multi-protocol & multi-source command-line download utility
      socat # replacement of openbsd-netcat
      nmap # A utility for network discovery and security auditing
      ipcalc  # it is a calculator for the IPv4/v6 addresses

      # misc
      cowsay
      file
      which
      tree
      gnused
      gnutar
      gawk
      zstd
      gnupg

      # nix related
      nix-output-monitor

      # productivity
      hugo # static site generator
      glow # markdown previewer in terminal

      btop  # replacement of htop/nmon
      iotop # io monitoring
      iftop # network monitoring

      # system call monitoring
      strace # system call monitoring
      ltrace # library call monitoring
      lsof # list open files

      # system tools
      sysstat
      lm_sensors # for `sensors` command
      ethtool
      pciutils # lspci
      usbutils # lsusb

      kdePackages.kate
      thunderbird
      vscode
      telegram-desktop
      google-chrome
      spotify

      # Haskell
      haskell.compiler.ghc983
      haskellPackages.cabal-install
      haskellPackages.stack
    ];
  };

  programs = {
    home-manager = {
      enable = true;
    };

    # starship = {
    #   enable = true;
    #   settings = {
    #     add_newline = false;
    #     aws.disabled = true;
    #     gcloud.disabled = true;
    #     line_break.disabled = true;
    #   };
    # };

    git = {
      enable = true;
      userName = "Kamron Khamrakulov";
      userEmail = "khamrakulovkamron@gmail.com";
    };

    alacritty = {
      enable = true;
      settings = {
        font = {
          family = "Jetbrains Mono Nerd Font";
          size = 10;
        };
        window = {
          opacity = 0.9;
          decorations = "full";
        };
        colors = {
          primary = {
            background = "#282a36"; # Dracula theme background
            foreground = "#f8f8f2"; # Dracula theme foreground
          };
          normal = {
            black = "#21222c";
            red = "#ff5555";
            green = "#50fa7b";
            yellow = "#f1fa8c";
            blue = "#bd93f9";
            magenta = "#ff79c6";
            cyan = "#8be9fd";
            white = "#bfbfbf";
          };
          bright = {
            black = "#4d4d4d";
            red = "#ff6e6e";
            green = "#69ff94";
            yellow = "#ffffa5";
            blue = "#d6acff";
            magenta = "#ff92df";
            cyan = "#a4ffff";
            white = "#ffffff";
          };
        };
      };
    };

    # bash = {
    #   enable = true;
    #   enableCompletion = true;
    #   # TODO add your custom bashrc here
    #   bashrcExtra = ''
    #     export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    #   '';

    #   # set some aliases, feel free to add more or remove some
    #   shellAliases = {
    #     k = "kubectl";
    #     urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
    #     urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
    #   };
    # };

    # zsh = {
    #   enable = true;
    #   enableCompletion = true;
    #   syntaxHighlighting.enable = true;

    #   shellAliases = {
    #     ll = "ls -l";
    #     update = "sudo nixos-rebuild switch";
    #   };

    #   oh-my-zsh = {
    #     enable = true;
    #     theme = "jbergantine";
    #     plugins = [ "git" "thefuck" "zsh-autosuggestions" ];
    #   };
    # };
  };

  nixpkgs.config.allowUnfree = true;
}