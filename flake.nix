{
  description = "sunn4room's NisOS configurations";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
  inputs.disko.url = "github:nix-community/disko/latest";
  inputs.disko.inputs.nixpkgs.follows = "nixpkgs";
  outputs = inputs: {
    nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      system = "x86_64-linux";
      modules = [
        inputs.disko.nixosModules.disko
        ./configuration.nix
      ];
    };
  };
}
