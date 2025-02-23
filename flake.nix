{
  description = "Sunder flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    flake-parts,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux"];

      perSystem = {pkgs, ...}: {
        packages.default = pkgs.stdenv.mkDerivation {
          pname = "VykSys";
          version = builtins.substring 0 8 self.rev or "dirty";

          src = pkgs.lib.cleanSource ./.;

          nativeBuildInputs = with pkgs; [
            temurin-jre-bin-17
          ];

          buildPhase = ''
            java -jar muddle.jar
          '';

          installPhase = ''
            mkdir -p $out
            cp -r build/* $out/
          '';
        };
      };
    };
}
