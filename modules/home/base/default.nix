{
  inputs,
  username,
  host,
  ...
}:
{
  imports = [
    # Core
    ./bat.nix # better cat command
    ./btop.nix # resouces monitor
    ./git.nix # version control
    ./gtk.nix # gtk theme
    ./micro.nix # nano replacement
    ./nvim # neovim editor
    ./packages.nix # other packages
    ./scripts/scripts.nix # personal scripts
    ./ssh.nix # ssh client
    ./starship.nix # shell prompt
    ./zsh.nix # shell

    # GUI / Desktop
    ./discord.nix # discord with catppuccin theme
    ./fuzzel.nix # launcher
    ./ghostty.nix # terminal
    ./hyprland # window manager
    ./spicetify.nix # spotify client
    ./swaylock.nix # lock screen
    ./swaync/swaync.nix # notification deamon
    ./vscodium.nix # vscode fork
    ./waybar # status bar
    ./yazi.nix # yazi file explorer
  ];
}
