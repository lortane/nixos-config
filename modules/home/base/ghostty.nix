{
  pkgs,
  host, # This is needed for the font size logic
  ...
}:
{
  # 1. Install Ghostty
  home.packages = [ pkgs.ghostty ];

  # 2. Main Ghostty Configuration
  xdg.configFile."ghostty/config".text = ''
    # Font
    font-family = "JetBrainsMono Nerd Font"
    font-size = 13

    # Theme
    theme = "Catppuccin-Mocha"

    # Opacity 
    background-opacity = 0.55

    # Padding 
    window-padding-x = 10
    window-padding-y = 10

    # Other settings
    confirm-close-surface = false        
    mouse-hide-while-typing = true     

    # Other useful settings you had before
    window-decoration = false
    term = "ghostty"
  '';

  # 3. Catppuccin Mocha Theme File
  xdg.configFile."ghostty/themes/Catppuccin-Mocha".text = ''
    # Catppuccin Mocha theme for Ghostty
    # Created: 2025-07-19

    background = #1E1E2E
    foreground = #CDD6F4

    cursor-color = #CBA6F7

    selection-background = #585B70
    selection-foreground = #1E1E2E

    # Normal colors
    palette = 0=#45475A  
    palette = 1=#F38BA8  
    palette = 2=#A6E3A1  
    palette = 3=#F9E2AF  
    palette = 4=#89B4FA  
    palette = 5=#F5C2E7 
    palette = 6=#94E2D5  
    palette = 7=#BAC2DE 

    # Bright colors
    palette = 8=#585B70   
    palette = 9=#F38BA8   
    palette = 10=#A6E3A1  
    palette = 11=#F9E2AF  
    palette = 12=#89B4FA  
    palette = 13=#F5C2E7  
    palette = 14=#94E2D5  
    palette = 15=#A6ADC8  
  '';
}
