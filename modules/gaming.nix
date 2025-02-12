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
    
    # Enable Steam, Lutris, and Wine for gaming
    programs.steam.enable = true;
    programs.lutris.enable = true;
    programs.gamemode.enable = true;  # Optimizes CPU/GPU when gaming
    
    # Install gaming-related packages
    environment.systemPackages = with pkgs; [
      wineWowPackages.stable  # Wine for Windows games
      winetricks  # Extra tools for Wine
      mangohud  # FPS overlay
      goverlay  # GUI for Mangohud
      gamescope  # Compositing for smooth gaming
      libstrangle  # FPS limiter
      vkBasalt  # Post-processing effects
    ] ++ vulkanPackages ++ mesaPackages;

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
