
{ config, pkgs, ... }:


{ config, pkgs, ... }:

let
  walkerConfig = {
    close_when_open = true;
    hotreload_theme = true;
    force_keyboard_focus = true;
    timeout = 60;
    keys = {
      ai = {
        run_last_response = ["ctrl e"];
      };
    };
    list = {
      max_entries = 200;
      cycle = true;
    };
    search = {
      placeholder = " Search...";
    };
    builtins = {
      hyprland_keybinds = {
        path = "~/.config/hypr/hyprland.conf";
        hidden = true;
      };
      applications = {
        placeholder = " Search...";
        prioritize_new = false;
        context_aware = false;
        show_sub_when_single = false;
        history = false;
        icon = "";
        hidden = true;
        actions = {
          enabled = false;
          hide_category = true;
        };
      };
      bookmarks = {
        hidden = true;
      };
      calc = {
        name = "Calculator";
        icon = "";
        min_chars = 3;
        prefix = "=";
      };
      windows = {
        switcher_only = true;
        hidden = true;
      };
      clipboard = {
        hidden = true;
      };
      commands = {
        hidden = true;
      };
      custom_commands = {
        hidden = true;
      };
      emojis = {
        name = "Emojis";
        icon = "";
        prefix = ":";
      };
      symbols = {
        after_copy = "";
        hidden = true;
      };
      finder = {
        use_fd = true;
        cmd_alt = "xdg-open $(dirname ~/%RESULT%)";
        icon = "file";
        name = "Finder";
        preview_images = true;
        hidden = false;
        prefix = ".";
      };
      runner = {
        shell_config = "";
        switcher_only = true;
        hidden = true;
      };
      ssh = {
        hidden = true;
      };
      websearch = {
        switcher_only = true;
        hidden = true;
      };
      translation = {
        hidden = true;
      };
    };
  };
in
{
  home.packages = [ pkgs.walker ];

  
  home.file.".config/walker/config.toml".text = builtins.toTOML walkerConfig;

  home.file.".local/bin/omarchy-menu" = {
    executable = true;
    text = ''
      #!/bin/bash

      menu() {
        local prompt="$1"
        local options="$2"

        echo -e "$options" | walker --dmenu -p "$prompt…"
      }

      show_main_menu() {
        case $(menu "Main Menu" "󰀻  Apps\n󰧑  Learn\n  Capture") in
          *Apps*) echo "Apps selected" ;;
          *Learn*) echo "Learn selected" ;;
          *Capture*) echo "Capture selected" ;;
        esac
      }

      show_main_menu
    '';
  };
}


