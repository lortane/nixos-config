{ pkgs, ... }:
let
  fuzzel-menu = pkgs.writeShellApplication {
    name = "fuzzel-menu";
    runtimeInputs = [ pkgs.fuzzel ];
    text = ''
      # Fuzzel with nested menus using temporary files
      main_menu() {
        fuzzel --dmenu --prompt "Main Menu" <<EOF
      󰀻  Applications
      󰧑  Learning  
        Capture
      EOF
      }

      app_menu() {
        fuzzel --dmenu --prompt "Applications" <<EOF
        Browser
        Terminal
        Files
        Code
      EOF
      }

      case $(main_menu) in
        *Applications*)
          case $(app_menu) in
            *Browser*) firefox ;;
            *Terminal*) kitty ;;
            *Files*) nautilus ;;
            *Code*) code ;;
          esac
          ;;
        *Learning*)
          # Learning submenu
          ;;
        *Capture*)
          # Capture submenu
          ;;
      esac
    '';
  };
in
{
  home.packages = [ fuzzel-menu ];
}
