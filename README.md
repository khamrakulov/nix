# NixOS Configuration

This repository contains my NixOS configuration files. You can use these configurations to set up your own NixOS system.

## Installation

To install this configuration, you can use the following command:

```sh
sudo nixos-rebuild switch --flake github:xfeusw/nix#hostname --upgrade
```

Replace `hostname` with the your hostname.

## Home Manager

This configuration also includes Home Manager, which allows you to manage your user configuration declaratively. Home Manager integrates well with NixOS and provides a consistent way to manage your user environment. To install Home-Manager, you can use the following command:

```sh
home-manager switch --flake github:xfeusw/nix#username --upgrade
```

## Enabling Flakes and Nix Command

To use this configuration, you need to enable flakes and the nix-command in your NixOS configuration. You can do this in two ways: declaratively and imperatively.

### Declarative Way

Add the following lines to your `/etc/nixos/configuration.nix`:

```nix
{
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
}
```

### Imperative Way

Run the following commands:

```sh
nix-env -iA nixpkgs.nixFlakes
export NIX_CONFIG="experimental-features = nix-command flakes"
```

## Conclusion

With these steps, you should be able to set up your NixOS system using the provided configuration files. If you encounter any issues, feel free to open an issue on the repository.

Happy Nixing!
