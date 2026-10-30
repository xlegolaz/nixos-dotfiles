{ config, pkgs, ...}:

let
	dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";	
	create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
	configs = {
		qtile = "qtile";
		#nvim = "nvim";
		#alacritty = "alacritty";
		# Aqui agrego nueva configuracion, el loop crea los enlaces. No olvidar agregar el paquete en home.packages para descargarlo.
	};
in

{
	home.username = "xlegolaz";
	home.homeDirectory = "/home/xlegolaz";
	programs.git.enable = true;
	home.stateVersion = "26.05";
	programs.bash = {
		enable = true;
		shellAliases = {
			btw = "echo i use nixos, btw";
		};
	};

	#home.file.".config/qtile".source = ./config/qtile;
	
	# Esta es la mejor implementacion de lo anterior. Un loop que enlaza todos los archivos de configuracion que quiera sin generarlos
	# manualmente. Descomentarla
	xdg.configFile = builtins.mapAttrs 
	  (name: subpath: {
		source = create_symlink "${dotfiles}/${subpath}";
		recursive = true;
	  })
        configs;

	#gtk.font = {
		
	#};

	# Compositor para x11 window managers
	services.picom = {
		enable = true;
		vSync = true;
		#shadow = true;
		#shadowOpacity = 0.6;
		#shadowOffsets = [
		#	(-3)
		#	(-3)
		#];
		fade = true;
		fadeSteps = [
			0.05
			0.05
		];
		fadeDelta = 10;
		#menuOpacity = 1.0;
		#inactiveOpacity = 1.0;
		#activeOpacity = 1.0;
		#opacityRules = [
  		#	"100:class_g    = 'XTerm'"
 		#	"100:class_g    = 'URxvt'"
  		#	"100:class_g    = 'firefox'"
  		#	"100:class_g    = 'Thunderbird'"
		#];
		#wintypes = {
		#	normal = { fade = false; shadow = true; };
  		#	tooltip = { fade = false; shadow = false; opacity = 1.0; focus = true; full-shadow = false; };
  		#	dock = { shadow = false; };
  		#	dnd = { shadow = false; };
  		#	popup_menu = { opacity = 1.0; shadow = false; fade = false; };
  		#	dropdown_menu = { opacity = 1.0; shadow = false; fade = false; };
		#};
        };

	home.packages = with pkgs; [
		ripgrep
		fd
		fzf
		gcc
		gdb
		#clang
		#neovim
		#nil
		#nixpkgs-fmt
		#nodejs
		feh
		lxsession
		btop
		flameshot
	];
}
