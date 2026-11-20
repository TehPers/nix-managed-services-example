{
  description = "Example flake for deploying services";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      # Supported platforms
      systems = [ "x86_64-linux" ];

      # Helper for generating sets for each supported platform
      forAllSystems =
        f:
        nixpkgs.lib.genAttrs systems (
          system:
          f {
            inherit system;
            pkgs = import nixpkgs { inherit system; }; # Use packages for this platform
          }
        );
    in
    {
      packages = forAllSystems (
        { pkgs, system }: {
          # Inits and starts the database
          postgres = pkgs.callPackage ./packages/postgres { } {
            pgdata = "./.data/postgres";
          };

          # Admin tool for the database
          adminer = pkgs.callPackage ./packages/adminer { } {
            host = "localhost";
            port = "8000";
          };
        }
      );
    };
}
