# NixOS & Home Manager Configuration

This repository contains the NixOS and Home Manager configuration managed with flakes.

## Prerequisites

Before using this configuration, ensure that Nix is installed and that the flakes feature is enabled.

### Enabling Nix Flakes
To enable flakes, modify the Nix configuration:

1. Open the Nix configuration file:
   ```sh
   sudo nano /etc/nixos/configuration.conf
   ```
2. Add or modify the following lines:
   ```ini
   experimental-features = [nix-command flakes];
   ```
3. Save the file and exit.
4. Restart the Nix daemon:
   ```sh
   sudo systemctl restart nix-daemon
   ```

## Applying NixOS Configuration

To rebuild and apply the system configuration for a specific hostname:

```sh
sudo nixos-rebuild switch --flake .#<hostname>
```

Replace `<hostname>` with your actual system hostname.

## Applying Home Manager Configuration

To rebuild and apply the user-specific configuration:

```sh
home-manager switch --flake .#<username>
```

Replace `<username>` with your actual system username.

## Notes
- Ensure you have the correct permissions and access to the Nix store.
- If using Home Manager standalone (not as part of NixOS), install it first:
  ```sh
  nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
  nix-channel --update
  nix-shell '<home-manager>' -A install
  ```

## Troubleshooting

If you encounter issues, check:
- Your Nix version (`nix --version`). Ensure it supports flakes.
- That the `nix.conf` file includes `experimental-features = nix-command flakes`.
- Logs with `journalctl -xe` if the rebuild fails.

## References
- [Nix Flakes Documentation](https://nixos.wiki/wiki/Flakes)
- [Home Manager Documentation](https://nix-community.github.io/home-manager/)

