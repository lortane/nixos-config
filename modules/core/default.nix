{ lib, host, ... }:
{
  imports = [
    ./audio.nix
    ./bootloader.nix
    ./hardware.nix
    ./network.nix
    ./program.nix
    ./security.nix
    ./services.nix
    ./steam.nix
    ./system.nix
    ./user.nix
    ./virtualization.nix
    ./wayland.nix
    ./xserver.nix
  ];
}