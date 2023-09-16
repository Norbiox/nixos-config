{ config, pkgs, ... }:

{
  users.users.norbert = {
    isNormalUser = true;
    home = "/home/norbert";
    description = "Norbert Chmiel";
    extraGroups = [ "wheel" "networkmanager" "audio" "video" ];
  };
}

