{
  description = "Mindustry flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixgl.url = "github:nix-community/nixGL";
    nixgl.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    { nixpkgs, nixgl, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      mindustryNixGL = pkgs.writeShellApplication {
        name = "mindustry-nixgl"; # declares the name of the new app

        runtimeInputs = [
          nixgl.packages.${system}.default # makes the nixGL command available in the wrapper
          pkgs.mindustry
        ];
        text = ''exec nixGL mindustry "$@"'';
      };
    in
    {
      packages.${system} = {
        default = pkgs.mindustry;
        server = pkgs.mindustry-server;
        nixgl = mindustryNixGL;
      };

      apps.${system} = {
        default = {
          type = "app";
          program = "${pkgs.mindustry}/bin/mindustry";
          meta.description = "Launch Mindustry";
        };

        server = {
          type = "app";
          program = "${pkgs.mindustry-server}/bin/mindustry-server";
          meta.description = "Launch dedicated Mindustry server";
        };
        nixgl = {
          type = "app";
          program = "${mindustryNixGL}/bin/mindustry-nixgl";
          meta.description = "Launch Mindustry through nixGL for non-NixOS Linux";
        };
      };
    };

}
