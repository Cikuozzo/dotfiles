{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.desktopManager.xfce.enable = true;

  # LightDM al posto di SDDM
  services.xserver.displayManager.lightdm.enable = true;
  services.displayManager.sddm.enable = false;
  services.displayManager.defaultSession = "xfce";

  environment.systemPackages = with pkgs; [

    mousepad
    galculator
    xfce4-screenshooter
    xarchiver
    ristretto
    xfce4-whiskermenu-plugin
  ];
}