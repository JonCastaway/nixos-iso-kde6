# NixOS ISO with bcachefs and KDE Plasma 6

This repository contains a NixOS configuration to build an ISO with bcachefs and KDE Plasma 6 support. It can easily be modified to change the configuration to your liking.

## Downloading the ISO
You can download the ISO from the [releases](https://github.com/JonCastaway/nixos-iso-kde6/releases) page.

## Building the ISO
To build the ISO, you need an x86_64 NixOS system or any x86_64 Linux system with nix installed.

You can either clone this repository and run `nix build` in the root directory, or run the following command from anywhere you have write access:

```
nix build github:JonCastaway/nixos-iso-kde6
```

### Updating
This repository is locked to a specific revision of nixpkgs, as seen in `flake.lock`. If you want to build it with the latest unstable nixpkgs, run the following commands in the root directory:

```
nix flake update
```

```
nix build
```

Or, for a one-off solution, run:

```
nix build --override-input nixpkgs nixpkgs/nixos-unstable github:JonCastaway/nixos-iso-kde6
```

## Customizing the ISO
The ISO configuration is defined in `configuration.nix`. You can modify it to add or remove packages, change the default user, and more.

To add KDE Plasma 6 to the ISO, add the following lines to `configuration.nix`:

``` services.xserver.desktopManager.plasma6 = {
  enable = true;
  desktopEnvironments = [ "plasma" ];
};

environment.systemPackages = [
  # Add KDE Plasma 6 packages here
  kde-plasma
  kde-workspace
  plasma-nm
  # ...
];
