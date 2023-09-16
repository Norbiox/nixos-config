{ pkgs, ... }:

{
  # Enable bluetooth
  hardware.bluetooth.enable = true;

  # Enable bluetooth manager
  services.blueman.enable = true;

  # Enable control media player with headset buttons
  systemd.user.services.mpris-proxy = {
    description = "Mpris proxy";
    after = [ "network.target" "sound.target" ];
    wantedBy = [ "default.target" ];
    serviceConfig.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
  };

  # Enable A2DP sink
  hardware.bluetooth.settings = {
    General = {
      Enable = "Source,Sink,Media,Socket";
    };
  };
}

