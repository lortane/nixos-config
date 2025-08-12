{ inputs, ... }: # Make sure 'inputs' is passed in
{
  imports = [
    ./packages.nix
    ./hyprland.nix
    ./waybar.nix
  ];
}
