{
  description = "vala dev environment for kemal gtk development learning";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in with pkgs; {
        devShells.default = mkShell {
          buildInputs =
            [ vala vala-lint vala-language-server pkg-config glib gtk4 ];
        };
      });
}
