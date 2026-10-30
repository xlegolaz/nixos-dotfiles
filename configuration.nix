
{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos-uwu"; # Define your hostname.

  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Bogota";

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  services.displayManager.ly.enable = true;
  services.xserver = {
	enable = true;
	#autoRepeatDelay = 200;
	#autoRepeatInterval = 35;
	#videoDrivers = [ "amdgpu" ];
	#displayManager.sessionCommands = ''		
	#	xrandr --output HDMI-1 --mode 1920x1080 --rate 74.97 &
    	#'';
	windowManager.qtile = {
	  enable = true;
  	  extraPackages = python313Packages: with python313Packages; [
    	  	qtile-extras
		psutil
  	  ];
	};
  };
	
  hardware.graphics = {
	enable = true;
	enable32Bit = true;
  };

  
  nixpkgs.config.allowUnfree = true; 

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa = {
	enable = true;
	support32Bit = true;
    };
    wireplumber.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.xlegolaz = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };

  programs.firefox.enable = true;

  programs.thunar = {
	enable = true;
	plugins = with pkgs; [
		thunar-archive-plugin
		thunar-volman
	];
  };

  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.tumbler.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    alacritty
    git
    alsa-utils
    pulseaudio
    fastfetch
    file-roller
    unzip
    xdg-utils
    #feh
  ];

  fonts.packages = with pkgs; [
  	nerd-fonts.jetbrains-mono
	corefonts
	vista-fonts
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?

}
