{ pkgs, ... }:

{
  programs.home-manager.enable = true;

  home.username = "norbert";
  home.homeDirectory = "/home/norbert";
  home.stateVersion = "23.11";

  # User specific packages
  home.packages = with pkgs; [
    alacritty
    bashInteractive
    brave
    kanshi
    kitty
    neovim-unwrapped
    wdisplays
  ];

  # Raw config files
  home.file.".config/alacritty".source = ./dotfiles/.config/alacritty;
  home.file.".config/kitty".source = ./dotfiles/.config/kitty;
  home.file.".config/kanshi".source = ./dotfiles/.config/kanshi;

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
      terminal = "alacritty";

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

#  # Kanshi
#  services.kanshi = {
#    enable = true;
#    systemdTarget = "kanshi.target";
#    profiles = {
#      home = {
#        outputs = [
#          {
#            criteria = "BOE 0x09DE Unknown";
#            position = "5760,1200";
#            mode = "1920x1080";
#            scale = 1.0;
#            transform = "normal";
#          }
#          {
#            criteria = "Dell Inc. DELL U2415 7MT0177R1E2L";
#            position = "3840,0";
#            mode = "1920x1200";
#            scale = 1.0;
#            transform = "normal";
#          }
#          {
#            criteria = "Dell Inc. DELL U2415 7MT0187628UL";
#            position = "7680,0";
#            mode = "1920x1200";
#            scale = 1.0;
#            transform = "normal";
#          }
#          {
#            criteria = "Dell Inc. DELL U2415 7MT016613C3L";
#            position = "5670,0";
#            mode = "1920x1200";
#            scale = 1.0;
#            transform = "normal";
#          }
#        ];
#    };
#      undocked = {
#        outputs = [
#          {
#            criteria = "BOE 0x09DE Unknown";
#            mode = "1920x1080";
#            scale = 1.0;
#            transform = "normal";
#          }
#        ];
#      };
#    };
#  };

  # Bash
  programs.bash = {
    enable = true;
  };
  programs.fzf.enable = true;
  programs.zoxide.enable = true;
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
