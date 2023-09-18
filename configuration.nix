{ config, pkgs, ... }:

{
  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs = true
      keep-derivations = true
    '';
  };
 
  imports =
    [
      ./hardware-configuration.nix
      ./users.nix
      ./sway.nix
      ./bluetooth.nix
    ];

  # Use the GRUB 2 boot loader
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true; 

  # Network configuration
  networking.hostName = "onwelowy";
  networking.networkmanager.enable = true;

  # Time zone.
  time.timeZone = "Europe/Warsaw";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable touchpad support
  services.xserver.libinput.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    alacritty
    appimage-run
    bashInteractive
    brave
    git
    jq
    kitty
    neovim-unwrapped
    qt5.qtwayland
    vim
    wget
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

  # Enable PolicyKit (for wayland)
  security.polkit.enable = true;

  # Enable OpenGL
  hardware.opengl.enable = true;

  # Enable light
  programs.light.enable = true;

  # Fonts
  fonts.packages = with pkgs; [
    fira-code
    fira
    fira-code-symbols
    powerline-fonts
    nerdfonts
  ];

  # Enable XDG
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
  };

  # Enable QT
  qt.enable = true;
  qt.platformTheme ="gtk2";
  qt.style = "gtk2";

  # Enable login via swaylock
  security.pam.services.swaylock = {
    text = "auth include login";
  };
}

