{ inputs, pkgs, ... }: 
{
  home.packages = (with pkgs; [
    audacity
    bitwise                           # cli tool for bit / hex manipulation
    brave
    cliphist                          # clipboard manager
    electrum
    electrum-ltc
    fd                                # find replacement
    ffmpeg
    file                              # Show file information 
    fzf                               # fuzzy finder
    gimp
    gtrash                            # rm replacement, put deleted files in system trash
    hexdump
    imv                               # image viewer
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
    nitch                             # systhem fetch util
    openssl
    pamixer                           # pulseaudio command line mixer
    pavucontrol                       # pulseaudio volume controle (GUI)
    playerctl                         # controller for media players
    poweralertd
    qalculate-gtk                     # calculator
    ripgrep                           # grep replacement
    soundwireserver                   # pass audio to android phone
    tor-browser
    unzip
    uv
    wget
    xdg-utils
    xxd
    yazi                              # terminal file manager
    yt-dlp-light
    winetricks
    wineWowPackages.wayland
    wl-clipboard                      # clipboard utils for wayland (wl-copy, wl-paste)
  ]);
}
