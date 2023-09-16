{ pkgs, ... }:

{
  programs.home-manager.enable = true;

  home.username = "norbert";
  home.homeDirectory = "/home/norbert";
  home.stateVersion = "23.11";

  # User specific packages
  home.packages = with pkgs; [
    brave
    kitty
    neovim-unwrapped
  ];

  # Raw config files
  home.file.".config/kitty".source = ./dotfiles/.config/kitty;

  # GIT configuration
  programs.git = {
    enable = true;
    userName = "Norbiox";
    userEmail = "norbertchmiel.it@gmail.com";
  };

  # Sway configuration
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraSessionCommands = ''
      export DSL_VIDEODRIVER=wayland
      export QT_QPA_PLATFORM=wayland
      export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
      export _JAVA_AWT_WM_NONREPARENTING=1
    '';

    config = rec {
      modifier = "Mod4";
      terminal = "kitty";

      fonts = {
        names = [ "Victor Mono" ];
        style = "Bold";
        size = 11.0;
      };

      gaps = {
        inner = 10;
        outer = 0;
        smartGaps = true;
        smartBorders = "on";
      };

      seat = {
        "*" = {
          hide_cursor = "when-typing enable";
        };
      };

    };

    extraConfig = ''
      # Brightness
      bindsym XF86MonBrightnessDown exec light -U 10
      bindsym XF86MonBrightnessUp exec light -A 10
      
      # Volume
      bindsym XF86AudioRaiseVolume exec 'pactl set-sink-volume @DEFAULT_SINK@ +1%'
      bindsym XF86AudioLowerVolume exec 'pactl set-sink-volume @DEFAULT_SINK@ -1%'
      bindsym XF86AudioMute exec 'pactl set-sink-mute @DEFAULT_SINK@ toggle
    '';
  };
}
