{ config, pkgs, ... }:

{
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  security.pam.services.kdewallet.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde ];
  };

  environment.systemPackages = with pkgs.kdePackages; [
    kcalc
    kate
    kdenlive
    spectacle
    koko
    ark
    kolourpaint
  ];

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    gwenview
  ];

}
