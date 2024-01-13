{
  description = "A very basic flake";

  outputs = { self, nixpkgs }: {
    colmena = {
      meta = {
        nixpkgs = import nixpkgs { system = "x86_64-linux"; };
      };

      some-host = { };
    };

    devShells.aarch64-darwin.default = with nixpkgs.legacyPackages.aarch64-darwin; mkShell {
      packages = [ colmena ];
    };
  };
}
