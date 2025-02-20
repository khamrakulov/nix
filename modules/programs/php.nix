{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    php
  ];

  services.phpfpm.pools.laravel = {
    user = "nginx";  # Change this if using Apache or another user
    group = "nginx";
    phpOptions = ''
      post_max_size = 50M
      upload_max_filesize = 50M
      max_execution_time = 300
    '';
    settings = {
      "listen" = "/run/phpfpm/laravel.sock";
      "pm" = "dynamic";
      "pm.max_children" = 10;
      "pm.start_servers" = 3;
      "pm.min_spare_servers" = 2;
      "pm.max_spare_servers" = 5;
    };
  };
}
