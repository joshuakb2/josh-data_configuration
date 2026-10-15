{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    airsane.url = "github:joshuakb2/AirSane";
  };
  outputs =
    { nixpkgs, airsane, self, ... }:
    {
      nixosConfigurations = {
        josh-data = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
	    airsane.nixosModules.default
	    ./configuration.nix
	  ];
        };
      };
    };
}
