{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    defaultEditor = true;
    extraLuaConfig = builtins.readFile ./init.lua;
  };
}