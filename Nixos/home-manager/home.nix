{ config, pkgs, ... }:

{
  home.username = "rocco";
  home.homeDirectory = "/home/rocco";
  home.stateVersion = "26.05";

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
 
    firefox
    emacs
    discord
    gimp
    kdePackages.kate
    kdePackages.kdenlive
    obs-studio
    obsidian
    pavucontrol
    vlc
    xivlauncher
    papirus-icon-theme
    cargo
    clippy
    fastfetch
    ripgrep
    rust-analyzer
    rustc
    rustfmt
    unzip
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Cikuozzo";
        email = "roccorotondo@tutamail.com";
      };
    };
  };

  programs.home-manager.enable = true;

}
