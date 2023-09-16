{ pkgs, nixpkgs, ... }:

{
  # Enable sound.
  security.rtkit.enable = true;
  services.pipewire = {
		enable = true;
    alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		jack.enable = true;
		wireplumber.enable = true;
#		media-session = {
#			enable = true;
#			config.bluez-monitor.rules = [
#				{
#					matches = [ { "device.name" = "~bluez.card.*"; } ];
#					actions = {
#						"update-props" = {
#							"bluez5.reconnect-profiles" = [ "hfp_hf" "hsp_hs" "a2dp_sink" ];
#							"bluez5.msbc-support" = true;
#							"bluez5.sbc-xq-support" = true;
#						};
#					};
#				}
# 				{
#					matches = [
#						{ "node.name" = "~bluez_input.*"; }
#						{ "node.name" = "~bluez_output.*"; }
#					];
#				}
#			];
#		};
  };

  # Install utilities
  environment.systemPackages = with pkgs; [
    pavucontrol
  ];

  # Configure wireplumber
  environment.etc = {
  	"wireplumber/bluetooth.lua.d/51-bluez-config.lua".text = ''
			bluez_monitor.properties = {
				["bluez5.enable-sbc-xq"] = true,
				["bluez5.enable-msbc"] = true,
				["bluez5.enable-hw-volume"] = true,
				["bluez5.headset-roles"] = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]"
			}
	'';
  };
}

