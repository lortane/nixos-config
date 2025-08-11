{ pkgs, inputs, ...}: 
{
  imports = [
    inputs.musnix.nixosModules.musnix 
  ];

  musnix.enable = true;

  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    extraConfig.pipewire."context.properties" = {
      default.clock.rate = 48000;
    default.clock.quantum = 256;
    default.clock.min-quantum = 128;
    default.clock.max-quantum = 512;
    };
  };
  environment.systemPackages = with pkgs; [
    pavucontrol
  ];
}