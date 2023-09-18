{ pkgs, ... }:

{
  programs.home-manager.enable = true;

  home.username = "norbert";
  home.homeDirectory = "/home/norbert";
  home.stateVersion = "23.11";

  # User specific packages
  home.packages = with pkgs; [
    bashInteractive
  ];

  # Raw config files
  home.file.".config/alacritty".source = ./dotfiles/.config/alacritty;
  home.file.".config/kitty".source = ./dotfiles/.config/kitty;
  home.file.".config/sway".source = ./dotfiles/.config/sway;

  # GIT configuration
  programs.git = {
    enable = true;
    userName = "Norbiox";
    userEmail = "norbertchmiel.it@gmail.com";
  };

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
