{ ... }:
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {

        width = 35;
        height = 396;
        horizontal-pad = 25;
        inner-pad = 5;
        lines = 10;
        line-height = 25;

        font = "JetBrainsMono Nerd Font:weight=bold:size=14";
        fields = "name,generic,comment,categories,filename,keywords";
        terminal = "ghostty";
        prompt = "'   '";
        icon-theme = "Papirus-Dark";
        layer = "top";

        # Behavior
        exit-on-keyboard-focus-loss = false; # force_keyboard_focus = true
        hide-scrollbar = true; # Hide scrollbar like Walker
        dmenu = true;
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
        radius = 8;
        width = 1;
      };

      # Hide prompt when not needed (like Walker's hidden prompt)
      dmenu = {
        prompt = "'   '";
      };

      # List item styling
      list = {
        item-padding = 12;
        item-margin = 0;
      };

      # Input field styling
      input = {
        padding = 10;
        margin = 0;
      };
    };
  };
}
