{inputs, username, host, ...}: {
  imports =
       [(import ./packages.nix)]
    ++ [(import ./hyprland.nix)];                    

}
