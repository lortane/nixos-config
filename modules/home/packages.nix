{ inputs, pkgs, ... }: 
{
  home.packages = (with pkgs; [
    alejandra  
    audacity
    bitwise                           # cli tool for bit / hex manipulation
    electrum-ltc
    electrum
    fd                                # find replacement
    file                              # Show file information 
    fzf                               # fuzzy finder
    gimp
    gtrash                            # rm replacement, put deleted files in system trash
    hexdump
    keepassxc
    kdePackages.kleopatra
    libreoffice
    monero-cli
    monero-gui
    nautilus     # file manager
    nitch                             # systhem fetch util
    ripgrep                           # grep replacement
    soundwireserver                   # pass audio to android phone
    tor-browser
    yazi                              # terminal file manager
    yt-dlp-light
    winetricks
    wineWowPackages.wayland

    brave
    ffmpeg
    imv                               # image viewer
    killall
    libnotify
    lldb
    llvmPackages.clang-tools
	  man-pages					            	  # extra man pages
    mpv                               # video player
    nextcloud-client
    ncdu                              # disk space
    openssl
    pamixer                           # pulseaudio command line mixer
    pavucontrol                       # pulseaudio volume controle (GUI)
    playerctl                         # controller for media players
    wl-clipboard                      # clipboard utils for wayland (wl-copy, wl-paste)
    cliphist                          # clipboard manager
    poweralertd
    qalculate-gtk                     # calculator
    unzip
    uv
    wget
    xdg-utils
    xxd
  ]);
}
