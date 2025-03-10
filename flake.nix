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
        devShells.default = pkgs.mkShell {
          name = "Sunder";
          packages = with pkgs; [
            lua51Packages.lua
            lua51Packages.ldoc
          ];
        };
        packages = {
          default = pkgs.stdenv.mkDerivation {
            pname = "Sunder";
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
          docs = pkgs.stdenv.mkDerivation {
            pname = "Sunder Docs";
            version = builtins.substring 0 8 self.rev or "dirty";

            src = pkgs.lib.cleanSource ./.;

            nativeBuildInputs = with pkgs; [
              lua51Packages.lua
              lua51Packages.ldoc
              lua51Packages.luacheck
            ];

            buildPhase = ''
              ldoc src/
            '';

            installPhase = ''
              mkdir -p $out
              cp -r doc/* $out/
            '';
          };
        };
      };
    };
}
