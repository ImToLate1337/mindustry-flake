{
  description = "Mindustry flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      packages.${system}.default = pkgs.mindustry;

      apps.${system}.default = {
        type = "app";
        program = "${pkgs.mindustry}/bin/mindustry";

        meta.description = "Launch Mindustry";
      };
    };

}
