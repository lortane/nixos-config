{ self, pkgs, lib, inputs, ...}: 
{
  # imports = [ inputs.nix-gaming.nixosModules.default ];
  nix = {
    settings = {
      auto-optimise-store = true;
      download-buffer-size = 4194304;
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
      inputs.nur.overlays.default
      inputs.yazi-flavors.overlay
      ];
  };

  environment.systemPackages = with pkgs; [
    wget
    git
    nixfmt-rfc-style
  ];

  time.timeZone = "Europe/Madrid";
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.05";
  i18n = {
    defaultLocale = "es_ES.UTF-8";
    extraLocaleSettings.LC_MESSAGES = "en_US.UTF-8";
  };
}
