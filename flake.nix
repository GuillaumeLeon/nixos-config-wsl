{
  description = "Guillaume WSL nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # outputs = { self, nixpkgs, nixos-wsl, ... }@inputs:
  #   let 
  #     system = "x86_64-linux";
  #     pkgs = nixpkgs.legacyPackages.${system};
  #   in
  #   {
  #   nixosConfigurations.default = nixpkgs.lib.nixosSystem {
  #     specialArgs = {inherit inputs;};
  #     modules = [
  #       ./configuration.nix
  #       # inputs.home-manager.nixosModules.default
  #       inputs.home-manager.nixosModules.default
  #       nixos-wsl.nixosModules.wsl
  #     ];
  #   };
  # };
  #
   outputs = inputs@{ nixpkgs, home-manager, nixos-wsl, ... }: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
	   nixos-wsl.nixosModules.default
          {
            system.stateVersion = "24.05";
            wsl.enable = true;
          }
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.guillaume = import ./home-manager/home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
        ];
    };
  };
}
