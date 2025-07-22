{ inputs, pkgs, ... }: 
{
  home.packages = (with pkgs; [
    haskellPackages.tidal
    electrum
    electrum-ltc
    monero-cli
    monero-gui
    vital                 
  ]);
  
  xdg.desktopEntries."vital" = {
    name = "Vital"; # This is the name that will appear in fuzzel
    comment = "Spectral warping wavetable synthesizer"; # A short description
    exec = "${pkgs.vital}/bin/Vital"; # The full path to the executable
    icon = "vital"; # Optional, but good practice if an icon is available
    categories = [ "AudioVideo" "Audio" "Music" ]; # Standard categories for sorting
  };
}
