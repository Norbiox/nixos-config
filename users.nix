{ config, pkgs, ... }:

{
  users.users.norbert = {
    isNormalUser = true;
    home = "/home/norbert";
    createHome = true;
    description = "Norbert Chmiel";
    extraGroups = [ "wheel" "networkmanager" "audio" "video" ];
    shell = pkgs.bash;
  };
}

