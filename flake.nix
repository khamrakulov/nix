{
  description = "A simple NixOS flake with Home Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs = {
        nixpkgs = {
          follows = "nixpkgs";
        };
      };
    };

    helix.url = "github:helix-editor/helix/master";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./nixos/configuration.nix
          ./nixos/modules/boot-loader.nix
          ./nixos/modules/docker.nix
          ./nixos/modules/environment-packages.nix
          ./nixos/modules/programs.nix
          ./nixos/modules/services.nix
          ./nixos/modules/system.nix
          ./nixos/modules/users.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.xfeusw = import ./home-manager/home.nix;
          }
        ];
      };
    };

    homeConfigurations = {
      xfeusw = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.pkgs;
        modules = [
          home-manager.nixosModules.home-manager
          {
            home-manager.users.xfeusw = import ./home-manager/home.nix;
          }
        ];
      };
    };
  };
}