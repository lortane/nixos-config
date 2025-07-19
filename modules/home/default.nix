{inputs, username, host, ...}: {
  imports =
       [(import ./audacious/audacious.nix)]       # music player
    ++ [(import ./bat.nix)]                       # better cat command
    ++ [(import ./btop.nix)]                      # resouces monitor 
    ++ [(import ./discord.nix)]                   # discord with catppuccin theme
    ++ [(import ./fuzzel.nix)]                    # launcher
    ++ [(import ./ghostty.nix)]                       # version control
    ++ [(import ./git.nix)]                       # version control
    ++ [(import ./gtk.nix)]                       # gtk theme
    ++ [(import ./hyprland)]                      # window manager
    ++ [(import ./kitty.nix)]                     # terminal
    ++ [(import ./swaync/swaync.nix)]             # notification deamon
    ++ [(import ./micro.nix)]                     # nano replacement
    ++ [(import ./nvim)]                      # neovim editor
    ++ [(import ./packages.nix)]                  # other packages
    ++ [(import ./scripts/scripts.nix)]           # personal scripts
    ++ [(import ./spicetify.nix)]                 # spotify client
    ++ [(import ./ssh.nix)]                       # ssh client
    ++ [(import ./starship.nix)]                  # shell prompt
    ++ [(import ./swaylock.nix)]                  # lock screen
    ++ [(import ./vscodium.nix)]                  # vscode forck
    ++ [(import ./waybar)]                        # status bar
    ++ [(import ./yazi.nix)]                      # yazi file explorer
    ++ [(import ./zsh.nix)];                      # shell
}
