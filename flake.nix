{
  description = "Pablo's Cooking Website";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-22.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let 
        pkgs = nixpkgs.legacyPackages.${system};
      in with pkgs;
      {
        devShells.default =
          mkShell {
            buildInputs = [ ruby ];
          };

        packages.default =
          stdenv.mkDerivation {
            name = "Cooking";
            src = ./.;
            buildInputs = [ ruby ];
            buildPhase = "echo start && echo `ls` && bundle exec jekyll build";
          };
      }
    );
}
