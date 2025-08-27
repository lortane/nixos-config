{ config, pkgs, ... }:

let
  # Your custom fuzzel menu script with Walker-like behavior
  fuzzel-menu = pkgs.writeShellApplication {
    name = "fuzzel-menu";
    runtimeInputs = [
      pkgs.fuzzel
      pkgs.grim
      pkgs.slurp
      pkgs.wl-clipboard
      pkgs.libnotify
      pkgs.uwsm # For uwsm app launching
      pkgs.bc # For calculator
    ];
    text = ''
            # Walker-like behavior implementation
            main_menu() {
              fuzzel --dmenu --prompt " Search..." <<EOF
      󰀻  Applications
      󰧑  Learning  
        Capture
        System
        Bookmarks
        Calculator
        Finder
      EOF
            }
            
            # Applications submenu (with uwsm integration like Walker)
            app_menu() {
              fuzzel --dmenu --prompt " Applications..." <<EOF
        Browser (Firefox)
        Terminal (Kitty)
        Files (Nautilus)
        Code (VSCode)
      EOF
            }
            
            # Bookmarks submenu (like Walker's bookmarks)
            bookmarks_menu() {
              fuzzel --dmenu --prompt " Bookmarks..." <<EOF
        Omarchy - Github
        Omarchy Manual
      EOF
            }
            
            # System submenu
            system_menu() {
              fuzzel --dmenu --prompt " System..." <<EOF
        Shutdown
        Reboot
        Sleep
        Lock
      EOF
            }
            
            # Handle menu selection with Walker-like behavior
            case $(main_menu) in
              *Applications*)
                case $(app_menu) in
                  *Firefox*) uwsm app -- firefox ;;
                  *Kitty*) uwsm app -- kitty ;;
                  *Nautilus*) uwsm app -- nautilus ;;
                  *VSCode*) uwsm app -- code ;;
                esac
                ;;
              
              *Bookmarks*)
                case $(bookmarks_menu) in
                  *Github*) firefox "https://github.com/basecamp/omarchy" ;;
                  *Manual*) firefox "https://manuals.omamix.org/2/the-omarchy-manual" ;;
                esac
                ;;
              
              *System*)
                case $(system_menu) in
                  *Shutdown*) systemctl poweroff ;;
                  *Reboot*) systemctl reboot ;;
                  *Sleep*) systemctl suspend ;;
                  *Lock*) swaylock ;;
                esac
                ;;
              
              *Capture*)
                # Screenshot with small delay for menu to close (like Walker timeout)
                sleep 0.3
                grim -g "$(slurp)" - | wl-copy && notify-send "Screenshot" "Copied to clipboard" 
                ;;
              
              *Calculator*)
                # Calculator functionality with = prefix (like Walker)
                result=$(fuzzel --dmenu --prompt " Calculator: =" <<< "=")
                if [[ "$result" == =* ]]; then
                  calculation=''${result#=}
                  answer=$(echo "$calculation" | bc -l 2>/dev/null) || answer="Error"
                  notify-send "Calculator" "$calculation = $answer"
                fi
                ;;
              
              *Finder*)
                # File finder functionality with . prefix (like Walker)
                file=$(find ~/ -type f 2>/dev/null | head -50 | fuzzel --dmenu --prompt " Find file: ")
                if [ -n "$file" ] && [ -f "$file" ]; then
                  xdg-open "$file"
                fi
                ;;
              
              *Learning*)
                firefox "https://learn-anything.xyz" ;;
            esac
    '';
  };
in
{
  # Fuzzel visual configuration (your styling)
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "JetBrainsMono Nerd Font:weight=bold:size=14";
        line-height = 25;
        fields = "name,generic,comment,categories,filename,keywords";
        terminal = "ghostty";
        prompt = "' ➜  '";
        icon-theme = "Papirus-Dark";
        layer = "top";
        lines = 10;
        width = 35;
        horizontal-pad = 25;
        inner-pad = 5;
      };
      colors = {
        background = "1e1e2ecc";
        text = "cdd6f4ff";
        match = "f38ba8ff";
        selection = "b4befeaa";
        selection-match = "f38ba8ff";
        selection-text = "cdd6f4ff";
        border = "b4befeff";
      };
      border = {
        radius = 15;
        width = 3;
      };
    };
  };

  # Your custom menu application
  home.packages = [
    fuzzel-menu
    pkgs.grim
    pkgs.slurp
    pkgs.wl-clipboard
    pkgs.libnotify
    pkgs.uwsm
    pkgs.bc
  ];
}
