{
	description = "Nixos from Scratch";

	inputs = {
		nixpkgs.url = "github:NixOs/nixpkgs/nixos-26.05";
		home-manager = {
			url = "github:nix-community/home-manager/release-26.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, home-manager, ... }: {
		nixosConfigurations.nixos-uwu = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				./configuration.nix
				home-manager.nixosModules.home-manager
				{
					nixpkgs.config.allowUnfree = true;

					home-manager = {
						useGlobalPkgs = true;
						useUserPackages = true;
						users.xlegolaz = import ./home.nix;
						backupFileExtension = "backup";
					};
				}
			];
		};
	};
}
