{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/release-23.11";

  outputs = inputs@{ self, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = inputs.nixpkgs.lib.systems.flakeExposed;

      perSystem = { self', pkgs, ... }:
        let
          inherit (pkgs) just hugo jq;
          myaspell = pkgs.aspellWithDicts (d: [d.en]);
        in
        {
          devShells.default = pkgs.mkShell {
            buildInputs = [ just jq hugo myaspell ];
          };
          packages.default = pkgs.stdenv.mkDerivation {
            name = "jayrahdevore-github-io";
            src = self;
            buildInputs = [hugo];
            buildPhase = ''
            cp -r $src/* .
            hugo -D
            '';
            installPhase = ''
              mkdir -p $out/
              cp -r public/* $out/
            '';
          };
        };
    };
}
