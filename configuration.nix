{ pkgs, lib, nixpkgs, ... }:

{
  # Enable bcachefs support with the latest kernel packages
  services.xserver.desktopManager.plasma6.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelPackages = pkgs.linuxPackages_latest + [ pkgs.bcachefs ];

  services.xserver.desktopManager.plasma6.supportedFilesystems = lib.mkForce [ "bcachefs" "btrfs" "reiserfs" "vfat" "f2fs" "xfs" "ntfs" "cifs" ];

  # System packages to be installed
  environment.systemPackages = with pkgs; [
    neovim
    fastfetch
    man-pages
    man-pages-posix
    keyutils # Required for bcachefs encryption
    # Add more packages here as needed
  ];

  # Nix registry configuration for running specific commands
  nix.registry = {
    n.flake = nixpkgs;
  };
}
