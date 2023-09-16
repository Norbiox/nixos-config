{ pkgs, nixpkgs, home, ... }:

{
  # Enable sound.
  sound.enable = true;

  # Enable pulseaudio
  hardware.pulseaudio.enable = true;

  # Enable compatibility with 32-bit applications
  hardware.pulseaudio.support32Bit = true;

  # Explicit PulseAudio support in applications
  nixpkgs.config.pulseaudio = true;

  # Enable extra codecs
  hardware.pulseaudio.package = pkgs.pulseaudioFull;

  # Automatically switch audio to connected device
  hardware.pulseaudio.extraConfig = ''
    load-module module-switch-on-connect
  '';

  # Install utilities
  environment.systemPackages = with pkgs; [
    pavucontrol
  ];
}

