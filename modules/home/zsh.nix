{ hostname, config, pkgs, host, lib, ...}: 
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent = lib.mkBefore ''
      # Function to change directory on exit from yazi
      # We name it 'ycd' to avoid conflicts with the 'yazi' package name
      function ycd() {
        local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
        # Launch yazi, passing all arguments to it, and telling it where to write the CWD file
        yazi "$@" --cwd-file="$tmp"
        # Read the CWD file back into a variable
        local cwd="$(cat "$tmp")"
        rm -f -- "$tmp"
        # If the CWD file is not empty and not the same as the current directory, then CD
        if [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
          cd -- "$cwd"
        fi
      }

      # Create a short alias to call the function
      alias y="ycd"
      
      DISABLE_MAGIC_FUNCTIONS=true
      export "MICRO_TRUECOLOR=1"
    '';
    shellAliases = {
      # record = "wf-recorder --audio=alsa_output.pci-0000_08_00.6.analog-stereo.monitor -f $HOME/Videos/$(date +'%Y%m%d%H%M%S_1.mp4')";

      # Utils
      c = "clear";
      cd = "z";
      tt = "gtrash put";
      cat = "bat";
      code = "codium";
      icat = "kitten icat";
      dsize = "du -hs";
      findw = "grep -rl";
      open = "xdg-open";

      l = "eza --icons  -a --group-directories-first -1"; #EZA_ICON_SPACING=2
      ls = "eza --icons  -a --group-directories-first -1 --no-user --long";
      ll = "eza --icons  -a --group-directories-first -1 --no-user --long";
      tree = "eza --icons --tree --group-directories-first";

      # Nixos
      cdnix = "cd ~/nixos-config && codium ~/nixos-config";
      ns = "nix-shell --run zsh";
      nix-shell = "nix-shell --run zsh";
      nix-switch = "sudo nixos-rebuild switch --flake ~/nixos-config#${host}";
      nix-switchu = "sudo nixos-rebuild switch --upgrade --flake ~/nixos-config#${host}";
      nix-flake-update = "sudo nix flake update ~/nixos-config#";
      nix-clean = "sudo nix-collect-garbage && sudo nix-collect-garbage -d && sudo rm /nix/var/nix/gcroots/auto/* && nix-collect-garbage && nix-collect-garbage -d";
    };
  };
  
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
