{
  description = "My optimized NixOS configuration with flakes and home-manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    nixos-hardware.url = "github:NixOS/nixos-hardware"; # Optional: For better hardware support
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useUserPackages = true;
            home-manager.useGlobalPkgs = true;
            home-manager.users.xfeusw = import ./home.nix;
          }
        ];
      };

      # Define global packages that can be installed via `nix run .#<package>`
      packages.${system} = {
        hello = pkgs.hello;
        neovim = pkgs.neovim;
        git = pkgs.git;
      };

      defaultPackage.${system} = self.packages.${system}.neovim;
    };
}

