{ config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withNodeJs = true;
    withPython3 = true;
  };

  environment.systemPackages = with pkgs; [
    neovim
    nodejs
    python3
    ripgrep
    fzf
  ];
}
