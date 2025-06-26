{
  home.sessionVariables = {
    SSH_AUTH_SOCK = "/run/user/1000/ssh-agent";
  };

  services.ssh-agent.enable = true;
  
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com" = {
        identitiesOnly = true;
        identityFile = "~/.ssh/id_github"; 
      };
    };
  };
}