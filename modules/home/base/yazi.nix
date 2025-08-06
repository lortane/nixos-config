{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    flavors = {
      inherit (pkgs.yazi-flavors) catppuccin-mocha;        
    };

    theme.flavor = {
      dark = "catppuccin-mocha";
    };
  };
}