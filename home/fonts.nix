{
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" "Hack" ]; })
  ];
}