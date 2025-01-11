{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    neovim
    wget
    git
    gh # github cli
    direnv
    bluez
    bluez-tools
    blueman
    firefox
    home-manager

    # nodejs
    nodejs_22
    nest-cli

    # Helix
    inputs.helix.packages."${pkgs.system}".helix

    # Fonts
    noto-fonts
    fira-code
    roboto
    jetbrains-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code

    # Rust
    rustup
    cargo
    rust-analyzer

    # C, CPP, GCC, CLANG, LLVM, ZIG
    gcc
    clang
    llvm
    zig

    # kubernetes
    kubectl
  ];

  nixpkgs.config.allowUnfree = true;
}