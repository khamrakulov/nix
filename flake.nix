{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, nixpkgs-stable, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
          ./hardware-configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.xfeusw = import ./home/default.nix;
          }
        ];
      };

      homeConfigurations.xfeusw = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home/default.nix ];
      };

      devShells.default = nixpkgs.legacyPackages.x86_64-linux.mkShell {
        buildInputs = [
          nixpkgs.openssl
          nixpkgs.openssl.dev
          nixpkgs.pkg-config
          nixpkgs.gcc
        ];
        shellHook = ''
          export OPENSSL_DIR=${nixpkgs.openssl}
          export OPENSSL_LIB_DIR=$OPENSSL_DIR/lib
          export OPENSSL_INCLUDE_DIR=$OPENSSL_DIR/include
          export PKG_CONFIG_PATH=$OPENSSL_DIR/lib/pkgconfig
          export OPENSSL_NO_VENDOR=1
        '';
      };
    };
}

