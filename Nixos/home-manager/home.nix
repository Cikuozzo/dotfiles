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
    gimp
    obs-studio
    obsidian
    pavucontrol
    vlc
    xivlauncher
    papirus-icon-theme
    fastfetch
    ripgrep
    gh
    telegram-desktop
    blender
    librecad
    freecad
    kicad
    openscad
    vesktop
];

  programs.home-manager.enable = true;

}
