<h1 align="center">
   <img src="./.github/assets/logo/nixos-logo.png  " width="100px" /> 
   <br>
      lortane's Flakes 
   <br>
      <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" width="600px" /> <br>
   <div align="center">
</h1>

<br>
</div>

# 🗃️ Overview

### 📚 Layout

-   [flake.nix](flake.nix) base of the configuration
-   [hosts](hosts) per-host configurations that contain machine specific configurations
    - [desktop](hosts/desktop/) Desktop specific configuration
    - [laptop](hosts/laptop/) Laptop specific configuration
    - [vm](hosts/vm/) VM specific configuration
-   [modules](modules) modularized NixOS configurations
    -   [core](modules/core/) Core NixOS configuration
    -   [homes](modules/home/) my [Home-Manager](https://github.com/nix-community/home-manager) config
-   [wallpapers](wallpapers/) 🌄 wallpapers collection

### 📓 Components
|                             | NixOS + Hyprland                                                                              |
| --------------------------- | :---------------------------------------------------------------------------------------------:
| **Window Manager**          | [Hyprland][Hyprland] |
| **Bar**                     | [Waybar][Waybar] |
| **Application Launcher**    | [fuzzel][fuzzel] |
| **Notification Daemon**     | [swaync][swaync] |
| **Terminal Emulator**       | [ghostty][ghostty] |
| **Shell**                   | [zsh][zsh] + [Starship][Starship] |
| **Text Editor**             | [VSCodium][VSCodium] + [Neovim][Neovim] |
| **network management tool** | [NetworkManager][NetworkManager] + [network-manager-applet][network-manager-applet] |
| **System resource monitor** | [Btop][Btop] |
| **File Manager**            | [yazi][yazi] |
| **Fonts**                   | [Nerd fonts][Nerd fonts] |
| **Color Scheme**            | [Catppuccin][Catppuccin] |
| **Cursor**                  | [Nordzy-cursors][Nordzy-cursors] |
| **Icons**                   | [catppuccin-papirus-folders][catppuccin-papirus-folders] |
| **Lockscreen**              | [Swaylock-effects][Swaylock-effects] |
| **Image Viewer**            | [imv][imv] |
| **Media Player**            | [mpv][mpv] |
| **Music Player**            | [audacious][audacious] |
| **Screenshot Software**     | [grimblast][grimblast] |
| **Screen Recording**        | [wf-recorder][wf-recorder] |
| **Clipboard**               | [wl-clip-persist][wl-clip-persist] |
| **Color Picker**            | [hyprpicker][hyprpicker] |


# 🚀 Installation 

> **⚠️ Use this configuration at your own risk! ⚠️** <br>
> Applying custom configurations, especially those related to your operating system, can have unexpected consequences and may interfere with your system's normal behavior. While I have tested these configurations on my own setup, there is no guarantee that they will work flawlessly on all systems. <br>
> **I am not responsible for any issues that may arise from using this configuration.**

> It is highly recommended to review the configuration contents and make necessary modifications to customize it to your needs before attempting the installation.

1. **Install NixOs**

   First install nixos using any [graphical ISO image](https://nixos.org/download.html#nixos-iso). 
   > Only been tested using the Gnome graphical installer and choosing the ```No desktop``` option durring instalation.

2. **Clone the repo**

   ```
   nix-shell -p git
   git clone https://github.com/lortane/nixos-config
   cd nixos-config
   ```
3. **Install script**

   > First make sure to read the install script, it isn't long
   
   Execute and follow the installation script :
   ```
   ./install.sh
   ```
   > You will need to change the git account yourself in ./modules/home/git.nix
   ```
      programs.git = {
         ...
         userName = "lortane";
         userEmail = "67cyril6767@gmail.com";
         ...
      };
   ```
4. **Reboot**

   After rebooting, you'll be greeted by swaylock prompting for your password, with the wallpaper in the background.

5. **Manual config**

   Even though I use home manager, there is still a little bit of manual configuration to do:
      - Enable Discord theme (in Discord settings under VENCORD > Themes).
      - Configure the browser (for now, all browser configuration is done manually).

# 👥 Credits

Original author of this nixos-config, [Frost-Phoenix](https://github.com/Frost-Phoenix/nixos-config).

<p align="center"><img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/footers/gray0_ctp_on_line.svg?sanitize=true" /></p>

<!-- end of page, send back to the top -->

<div align="right">
  <a href="#readme">Back to the Top</a>
</div>

<!-- Links -->
[Hyprland]: https://github.com/hyprwm/Hyprland
[Starship]: https://github.com/starship/starship
[Waybar]: https://github.com/Alexays/Waybar
[fuzzel]: https://codeberg.org/dnkl/fuzzel>
[Btop]: https://github.com/aristocratos/btop
[nemo]: https://github.com/linuxmint/nemo
[yazi]: https://github.com/sxyazi/yazi
[zsh]: https://ohmyz.sh/
[Swaylock-effects]: https://github.com/mortie/swaylock-effects
[audacious]: https://audacious-media-player.org/
[mpv]: https://github.com/mpv-player/mpv
[VSCodium]:https://vscodium.com/
[Neovim]: https://github.com/neovim/neovim
[grimblast]: https://github.com/hyprwm/contrib
[imv]: https://sr.ht/~exec64/imv/
[swaync]: https://github.com/ErikReider/SwayNotificationCenter
[Nerd fonts]: https://github.com/ryanoasis/nerd-fonts
[NetworkManager]: https://wiki.gnome.org/Projects/NetworkManager
[network-manager-applet]: https://gitlab.gnome.org/GNOME/network-manager-applet/
[wl-clip-persist]: https://github.com/Linus789/wl-clip-persist
[wf-recorder]: https://github.com/ammen99/wf-recorder
[hyprpicker]: https://github.com/hyprwm/hyprpicker
[Catppuccin]: https://github.com/catppuccin/catppuccin
[catppuccin-papirus-folders]: https://github.com/catppuccin/papirus-folders
[Nordzy-cursors]: https://github.com/alvatip/Nordzy-cursors
[maxfetch]: https://github.com/jobcmax/maxfetch
