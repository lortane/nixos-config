{ self, pkgs, lib, inputs, ...}: 
{
  # imports = [ inputs.nix-gaming.nixosModules.default ];
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      substituters = [ "https://nix-gaming.cachix.org" ];
      trusted-public-keys = [ "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4=" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
  nixpkgs = {
    overlays = [
      inputs.nur.overlay
    ];
  };

  environment.systemPackages = with pkgs; [
    wget
    git
  ];

  time.timeZone = "Europe/Madrid";
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.05";
  i18n = {
    defaultLocale = "es_ES.UTF-8";
    extraLocaleSettings.LC_MESSAGES = "en_US.UTF-8";
  };
}
