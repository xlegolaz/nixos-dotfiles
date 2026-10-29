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
	];
}
