{ inputs, pkgs, ... }: 
{
  home.packages = (with pkgs; [
    bitwig-studio
    bitwise                           # cli tool for bit / hex manipulation
    brave
    cliphist                          # clipboard manager
    eza
    fd                                # find replacement
    ffmpeg
    file                              # Show file information 
    fzf                               # fuzzy finder
    gcc
    gdb
    gemini-cli
    gimp
    gtrash                            # rm replacement, put deleted files in system trash
    hexdump
    imv                               # image viewer
    jq
    kdePackages.kleopatra
    keepassxc
    killall
    libnotify
    libreoffice
    librewolf
    lldb
    llvmPackages.clang-tools
	  man-pages					            	  # extra man pages
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
    winetricks
    wineWowPackages.wayland
    wl-clipboard                      # clipboard utils for wayland (wl-copy, wl-paste)
  ]);
}
