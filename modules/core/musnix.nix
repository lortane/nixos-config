# In modules/core/default.nix
{ pkgs, inputs, ...}: {
  imports = [
    inputs.musnix.nixosModules.musnix 
  ];

  musnix.enable = true;
}