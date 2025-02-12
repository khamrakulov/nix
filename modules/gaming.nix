{ config, lib, pkgs, ... }:

let
  vulkanPackages = with pkgs; [
    vulkan-tools
    vulkan-validation-layers
    vulkan-loader
    vulkan-headers
  ];

  mesaPackages = with pkgs; [
    mesa
    mesa-demos
    libva
    libvdpau
  ];
  
in {
  options.programs.gaming.enable = lib.mkEnableOption "Enable gaming optimizations";
  
  config = lib.mkIf config.programs.gaming.enable {

    # Enable Steam
    programs.steam.enable = true;

    # Enable Gamemode (optimizes CPU/GPU when gaming)
    programs.gamemode.enable = true;

    # Install gaming-related packages
    environment.systemPackages = with pkgs; [
      lutris
      wineWowPackages.stable
      winetricks
      mangohud
      goverlay
      gamescope
      libstrangle
      vkBasalt
      polkit
      gamemode

      # Vulkan-related packages
      vulkan-loader
      vulkan-tools
      vulkan-validation-layers

      # Mesa drivers (fix for missing attribute issue)
      mesa.drivers
    ];

    # Enable udev rules for controllers
    services.udev.packages = [ pkgs.steam ];

    # Enable Sysctl optimizations for gaming
    boot.kernel.sysctl = {
      "vm.swappiness" = 10;  # Reduce swap usage
      "fs.inotify.max_user_watches" = 524288;  # Prevent game crashes due to file limit
    };
  };
}
