{ inputs, pkgs, ... }: 
{
  home.packages = (with pkgs; [
    audacity
    bitwig-studio
    bitwise                           # cli tool for bit / hex manipulation
    brave
    cliphist                          # clipboard manager
    electrum
    electrum-ltc
    eza
    fd                                # find replacement
    ffmpeg
    file                              # Show file information 
    fzf                               # fuzzy finder
    gemini-cli
    gimp
    gtrash                            # rm replacement, put deleted files in system trash
    haskellPackages.tidal
    hexdump
    imv                               # image viewer
    jq
    kdePackages.kleopatra
    keepassxc
    killall
    libnotify
    libreoffice
    lldb
    llvmPackages.clang-tools
	  man-pages					            	  # extra man pages
    monero-cli
    monero-gui
    mpv                               # video player
    nautilus                          # file manager
    ncdu                              # disk space
    nextcloud-client
    nicotine-plus
    nitch                             # systhem fetch util
    openssl
    pamixer                           # pulseaudio command line mixer
    pavucontrol                       # pulseaudio volume controle (GUI)
    playerctl                         # controller for media players
    poweralertd
    protonvpn-gui
    qalculate-gtk                     # calculator
    ripgrep                           # grep replacement
    soundwireserver                   # pass audio to android phone
    sqlitebrowser
    tor-browser
    traceroute
    unzip
    uv
    wget
    xdg-utils
    xxd
    yazi                              # terminal file manager
    yt-dlp-light
    vital
    winetricks
    wineWowPackages.wayland
    wl-clipboard                      # clipboard utils for wayland (wl-copy, wl-paste)
  ]);
  
  xdg.desktopEntries."vital" = {
    name = "Vital"; # This is the name that will appear in fuzzel
    comment = "Spectral warping wavetable synthesizer"; # A short description
    exec = "${pkgs.vital}/bin/Vital"; # The full path to the executable
    icon = "vital"; # Optional, but good practice if an icon is available
    categories = [ "AudioVideo" "Audio" "Music" ]; # Standard categories for sorting
  };
}
