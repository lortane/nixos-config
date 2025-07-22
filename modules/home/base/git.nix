{ pkgs, ... }: 
{
  programs.git = {
    enable = true;
    
    userName = "lortane";
    userEmail = "lortane@pm.me";
    
    extraConfig = { 
      init.defaultBranch = "master";
      credential.helper = "store";
    };
  };

  # home.packages = [ pkgs.gh pkgs.git-lfs ];
}
