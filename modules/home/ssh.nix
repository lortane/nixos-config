{
  home.sessionVariables = {
    SSH_AUTH_SOCK = "/run/user/1000/ssh-agent";
  };

  services.ssh-agent.enable = true;
  
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
  };
}