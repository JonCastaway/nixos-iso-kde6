{ pkgs, lib, nixpkgs, ... }:

{
  # Enable bcachefs support
  services.xserver.desktopManager.plasma6.kernelPackages = pkgs.linuxPackages_latest.boot.kernelPackages + [ pkgs.bcachefs ];
  services.xserver.desktopManager.plasma6.supportedFilesystems = lib.mkForce [ "bcachefs" "btrfs" "reiserfs" "vfat" "f2fs" "xfs" "ntfs" "cifs" ];

  # Choose the system packages you want installed here.
  environment.systemPackages = with pkgs; [
    neovim
    fastfetch
    man-pages
    man-pages-posix
    keyutils # for bcachefs encryption
  ];

  # Supports things like `nix run n#bash`
  nix.registry = {
    n.flake = nixpkgs;
  };
}
