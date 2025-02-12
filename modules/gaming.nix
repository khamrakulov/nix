{ config, lib, pkgs, ... }:

let
  vulkanPackages = with pkgs; [
    vulkan-tools  # Vulkan utilities
    vulkan-validation-layers  # Debugging
    vulkan-loader  # Vulkan loader
    vulkan-headers
  ];

  mesaPackages = with pkgs; [
    mesa  # OpenGL & Vulkan drivers
    mesa-demos
    libva  # Video acceleration
    libvdpau
  ];
  
in {
  options.myGaming.enable = lib.mkEnableOption "Enable gaming optimizations";
  
  config = lib.mkIf config.myGaming.enable {
    
    # Enable Steam
    programs.steam.enable = true;

    # Enable Gamemode (optimizes CPU/GPU when gaming)
    programs.gamemode.enable = true;

    # Install gaming-related packages
    environment.systemPackages = with pkgs; [
      lutris  # Lutris (does not have a module, only a package)
      wineWowPackages.stable  # Wine for Windows games
      winetricks  # Extra tools for Wine
      mangohud  # FPS overlay
      goverlay  # GUI for Mangohud
      gamescope  # Compositing for smooth gaming
      libstrangle  # FPS limiter
      vkBasalt  # Post-processing effects

      # Vulkan-related packages (replacing pkgs.vulkanPackages)
      vulkan-loader
      vulkan-tools
      vulkan-validation-layers
    ] ++ pkgs.mesa.drivers;  # Replace pkgs.mesaPackages with pkgs.mesa.drivers

    # Enable udev rules for controllers
    services.udev.packages = [ pkgs.steam ];

    # Enable Sysctl optimizations for gaming
    boot.kernel.sysctl = {
      "vm.swappiness" = 10;  # Reduce swap usage
      "fs.inotify.max_user_watches" = 524288;  # Prevent game crashes due to file limit
    };

    # Enable performance tweaks for CPU & GPU
    systemd.services.gamemode = {
      description = "Optimize system performance for gaming";
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        ExecStart = "${pkgs.gamemode}/bin/gamemoded";
        Restart = "always";
      };
    };
  };
}
