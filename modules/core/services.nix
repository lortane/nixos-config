{ ... }: 
{
  services = {
    gvfs.enable = true;
    dbus.enable = true;
    fstrim.enable = true;
    openssh.enable = true;
    # gnome.gnome-keyring = {
    #   enable = true;
    #   components = [ "pkcs11" "secrets" ];
    # };
  };
  services.logind.extraConfig = ''
    # don’t shutdown when power button is short-pressed
    HandlePowerKey=ignore
  '';
}
