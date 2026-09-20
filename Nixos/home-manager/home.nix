{ config, pkgs, ... }:

{
  home.username = "rocco";
  home.homeDirectory = "/home/rocco";
  home.stateVersion = "26.05";

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [

    prismlauncher
    neovim
    localsend
    git
    firefox
    emacs
    discord
    gimp
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
    gh
  ];

  programs.home-manager.enable = true;

}
