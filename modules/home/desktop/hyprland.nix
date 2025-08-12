# Desktop-only Hyprland settings
{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    # Second monitor vertical
    monitor = [
      "DP-3,preferred,auto,1"
      "HDMI-A-1,preferred,auto,1,transform,1"
    ];

    # Workspace assignments for the desktop
    workspace = [
      "1, monitor:DP-3, persistent:true, default:true"
      "2, monitor:DP-3, persistent:true"
      "3, monitor:DP-3, persistent:true"
      "4, monitor:DP-3, persistent:true"
      "5, monitor:HDMI-A-1, persistent:true, default:true"
      "6, monitor:HDMI-A-1, persistent:true"
      "7, monitor:HDMI-A-1, persistent:true"
      "8, monitor:HDMI-A-1, persistent:true"
    ];
  };
}
