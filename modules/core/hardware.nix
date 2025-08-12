{ pkgs, ... }:
{
  hardware.graphics.enable = true;
  hardware.enableRedistributableFirmware = true;

  # Razer hardware
  hardware.openrazer.enable = true;
  environment.systemPackages = with pkgs; [
    openrazer-daemon
    polychromatic
  ];

}
