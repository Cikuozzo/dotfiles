{ config, pkgs, ... }:

{
  services.flatpak.enable = true;

  nixpkgs.config.allowUnfree = true;

  fonts.fontconfig.enable = true;
  fonts.packages = with pkgs; [
    iosevka
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
  ];

  programs.steam.enable = true;
  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    btrfs-assistant
    home-manager
    curl
    gcc
    gnumake
    pkg-config
    wget
  ];
}
