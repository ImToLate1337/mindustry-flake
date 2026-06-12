y {
  description = "Mindustry flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { nixpkgs, ... }: {
    pkgs = nixpkgs.legacyPackages;

    packages.default = pkgs.mindustry;
  };

}
